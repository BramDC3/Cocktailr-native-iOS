import Foundation

struct GetAllIngredientsResponseDrink: Codable {
    let strIngredient1: String
    
    enum CodingKeys: String, CodingKey {
        case strIngredient1
    }
    
    init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy:CodingKeys.self)
        self.strIngredient1 = try valueContainer.decode(String.self, forKey: CodingKeys.strIngredient1)
    }
}
