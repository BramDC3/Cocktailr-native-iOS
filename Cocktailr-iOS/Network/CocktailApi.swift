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
            if let data = data,
                let string = String(data: data, encoding: .utf8) {
                print(string)
            }
            let ingredients: [String] = []
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
            if let data = data,
                let string = String(data: data, encoding: .utf8) {
                print(string)
            }
            let cocktail: Cocktail = Cocktail(id: "", name: "", category: "", instructions: "", imageUrl: "", ingredients: [], measurements: [])
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
            if let data = data,
                let string = String(data: data, encoding: .utf8) {
                print(string)
            }
            let cocktails: [Cocktail] = []
            completion(cocktails)
        }
        task.resume()
    }
}
