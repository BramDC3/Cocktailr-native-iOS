import Foundation

struct GetAllIngredientsResponse: Codable {
    let drinks: [GetAllIngredientsResponseDrink]
    
    enum CodingKeys: String, CodingKey {
        case drinks
    }
    
    init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy:CodingKeys.self)
        self.drinks = try valueContainer.decode([GetAllIngredientsResponseDrink].self, forKey: CodingKeys.drinks)
    }
}
