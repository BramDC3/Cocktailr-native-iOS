import Foundation

struct CocktailsByIngredientResponse: Codable {
    let drinks: [CocktailsByIngredientResponseDrink]
    
     enum CodingKeys: String, CodingKey {
        case drinks
    }
    
    init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy:CodingKeys.self)
        self.drinks = try valueContainer.decode([CocktailsByIngredientResponseDrink].self, forKey: CodingKeys.drinks)
    }
}
