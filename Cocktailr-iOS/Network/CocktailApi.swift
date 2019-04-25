import Foundation

class CocktailApi {
    static let instance = CocktailApi()
    let baseUrl = URL(string: "https://www.thecocktaildb.com/api/json/v1/36578/")

    func getAllIngredients(completion: @escaping ([String]?) -> Void) {
        let initialIngredientsUrl = baseUrl!.appendingPathComponent("list.php")
        var components = URLComponents(url: initialIngredientsUrl,resolvingAgainstBaseURL: true)!
        components.queryItems = [URLQueryItem(name: "i", value: "list")]
        let ingredientsUrl = components.url!
        
        let task = URLSession.shared.dataTask(with: ingredientsUrl) { (data, response, error) in
            let jsonDecoder = JSONDecoder()
            var ingredients: [String] = []
            if let data = data, let getAllIngredientsResponse = try? jsonDecoder.decode(GetAllIngredientsResponse.self, from: data) {
                ingredients = getAllIngredientsResponse.drinks.map({ $0.strIngredient1 })
            }
            completion(ingredients)
        }
        task.resume()
    }
    
    func getCocktailById(cocktail: Cocktail, completion: @escaping (Cocktail?) -> Void) {
        let initialCocktailUrl = baseUrl!.appendingPathComponent("lookup.php")
        var components = URLComponents(url: initialCocktailUrl,resolvingAgainstBaseURL: true)!
        components.queryItems = [URLQueryItem(name: "i", value: cocktail.id)]
        let cocktailUrl = components.url!
        
        let task = URLSession.shared.dataTask(with: cocktailUrl) { (data, response, error) in
            let jsonDecoder = JSONDecoder()
            if let data = data, let cocktailByIdResponse = try? jsonDecoder.decode(CocktailByIdResponse.self, from: data) {
                let responseCocktail = cocktailByIdResponse.drinks[0]
                cocktail.category = responseCocktail.strCategory
                cocktail.instructions = responseCocktail.strInstructions
                cocktail.ingredients = self.getIngredients(cocktail: responseCocktail)
                cocktail.measurements = self.getMeasurements(cocktail: responseCocktail)
            }
            completion(cocktail)
        }
        task.resume()
    }
    
    func getCocktailsByIngredient(ingredient: String, completion: @escaping ([Cocktail]?) -> Void) {
        let initialCocktailsUrl = baseUrl!.appendingPathComponent("filter.php")
        var components = URLComponents(url: initialCocktailsUrl,resolvingAgainstBaseURL: true)!
        components.queryItems = [URLQueryItem(name: "i", value: ingredient)]
        let cocktailsUrl = components.url!
        
        let task = URLSession.shared.dataTask(with: cocktailsUrl) { (data, response, error) in
            let jsonDecoder = JSONDecoder()
            var cocktails: [Cocktail] = []
            if let data = data, let cocktailsByIngredientResponse = try? jsonDecoder.decode(CocktailsByIngredientResponse.self, from: data) {
                cocktails = cocktailsByIngredientResponse.drinks.map({ Cocktail(id: $0.idDrink, name: $0.strDrink, imageUrl: $0.strDrinkThumb) })
            }
            completion(cocktails)
        }
        task.resume()
    }
    
    private func getIngredients(cocktail: CocktailByIdResponseDrink) -> [String?] {
        return [cocktail.strIngredient1, cocktail.strIngredient2, cocktail.strIngredient3, cocktail.strIngredient4, cocktail.strIngredient5, cocktail.strIngredient6, cocktail.strIngredient7, cocktail.strIngredient8, cocktail.strIngredient9, cocktail.strIngredient10, cocktail.strIngredient11, cocktail.strIngredient12, cocktail.strIngredient13, cocktail.strIngredient14, cocktail.strIngredient15].filter({ $0 != nil && $0 != "" && $0 != " " && $0 != "\n" })
    }

    private func getMeasurements(cocktail: CocktailByIdResponseDrink) -> [String?] {
        return [cocktail.strMeasure1, cocktail.strMeasure2, cocktail.strMeasure3, cocktail.strMeasure4, cocktail.strMeasure5, cocktail.strMeasure6, cocktail.strMeasure7, cocktail.strMeasure8, cocktail.strMeasure9, cocktail.strMeasure10, cocktail.strMeasure11, cocktail.strMeasure12, cocktail.strMeasure13, cocktail.strMeasure14, cocktail.strMeasure15].filter({ $0 != nil && $0 != "" && $0 != " " && $0 != "\n" })
    }
}
