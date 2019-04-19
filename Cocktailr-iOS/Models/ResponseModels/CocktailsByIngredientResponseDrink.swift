import Foundation

struct CocktailsByIngredientResponseDrink: Codable {
    let strDrink: String
    let strDrinkThumb: String
    let idDrink: String
    
    enum CodingKeys: String, CodingKey {
        case strDrink
        case strDrinkThumb
        case idDrink
    }
    
    init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy:CodingKeys.self)
        self.strDrink = try valueContainer.decode(String.self, forKey: CodingKeys.strDrink)
        self.strDrinkThumb = try valueContainer.decode(String.self, forKey: CodingKeys.strDrinkThumb)
        self.idDrink = try valueContainer.decode(String.self, forKey: CodingKeys.idDrink)
    }
}
