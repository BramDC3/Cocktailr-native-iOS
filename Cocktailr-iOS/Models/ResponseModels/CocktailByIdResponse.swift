import Foundation

struct CocktailByIdResponse: Codable {
    let drinks: [CocktailByIdResponseDrink]
    
    enum CodingKeys: String, CodingKey {
        case drinks
    }
    
    init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy:CodingKeys.self)
        self.drinks = try valueContainer.decode([CocktailByIdResponseDrink].self, forKey: CodingKeys.drinks)
    }
}
