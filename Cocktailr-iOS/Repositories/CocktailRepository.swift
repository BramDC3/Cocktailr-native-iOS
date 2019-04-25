import Foundation

class CocktailRepository {
    static let instance = CocktailRepository()
    
    var selectedCocktail: Cocktail?
    var ingredients: [String]
    var cocktails: [Cocktail]
    
    init() {
        selectedCocktail = nil
        ingredients = []
        cocktails = []
        getAllIngredients()
    }
    
    private func getAllIngredients() {
        CocktailApi.instance.getAllIngredients { (ingredients) in
            if let ingredients = ingredients {
                self.ingredients = ingredients
                NotificationCenter.default.post(name: .didFetchIngredients, object: nil)
            }
        }
    }
    
    func getCocktailById(cocktail: Cocktail) {
        selectedCocktail = nil
        CocktailApi.instance.getCocktailById(cocktail: cocktail) { (cocktail) in
            if let cocktail = cocktail {
                self.selectedCocktail = cocktail
                NotificationCenter.default.post(name: .didFetchCocktailById, object: nil)
            }
        }
    }
    
    func getCocktailsByIngredient(ingredient: String) {
        CocktailApi.instance.getCocktailsByIngredient(ingredient: ingredient) { (cocktails)  in
            if let cocktails = cocktails {
                self.cocktails = cocktails
                NotificationCenter.default.post(name: .didFetchCocktailsByIngredient, object: nil)
            }
        }
    }
    
}

extension Notification.Name {
    static let didFetchIngredients = Notification.Name("didFetchIngredients")
    static let didFetchCocktailsByIngredient = Notification.Name("didFetchCocktailsByIngredient")
    static let didFetchCocktailById = Notification.Name("didFetchCocktailById")
}
