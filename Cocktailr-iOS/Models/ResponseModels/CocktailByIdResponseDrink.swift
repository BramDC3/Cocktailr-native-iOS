import Foundation

struct CocktailByIdResponseDrink: Codable {
    let strCategory: String
    let strInstructions: String
    
    let strIngredient1: String?
    let strIngredient2: String?
    let strIngredient3: String?
    let strIngredient4: String?
    let strIngredient5: String?
    let strIngredient6: String?
    let strIngredient7: String?
    let strIngredient8: String?
    let strIngredient9: String?
    let strIngredient10: String?
    let strIngredient11: String?
    let strIngredient12: String?
    let strIngredient13: String?
    let strIngredient14: String?
    let strIngredient15: String?
    
    let strMeasure1: String?
    let strMeasure2: String?
    let strMeasure3: String?
    let strMeasure4: String?
    let strMeasure5: String?
    let strMeasure6: String?
    let strMeasure7: String?
    let strMeasure8: String?
    let strMeasure9: String?
    let strMeasure10: String?
    let strMeasure11: String?
    let strMeasure12: String?
    let strMeasure13: String?
    let strMeasure14: String?
    let strMeasure15: String?
    
    enum CodingKeys: String, CodingKey {
        case strCategory
        case strInstructions
        
        case strIngredient1
        case strIngredient2
        case strIngredient3
        case strIngredient4
        case strIngredient5
        case strIngredient6
        case strIngredient7
        case strIngredient8
        case strIngredient9
        case strIngredient10
        case strIngredient11
        case strIngredient12
        case strIngredient13
        case strIngredient14
        case strIngredient15
        
        case strMeasure1
        case strMeasure2
        case strMeasure3
        case strMeasure4
        case strMeasure5
        case strMeasure6
        case strMeasure7
        case strMeasure8
        case strMeasure9
        case strMeasure10
        case strMeasure11
        case strMeasure12
        case strMeasure13
        case strMeasure14
        case strMeasure15
    }
    
    init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy:CodingKeys.self)
        self.strCategory = try valueContainer.decode(String.self, forKey: CodingKeys.strCategory)
        self.strInstructions = try valueContainer.decode(String.self, forKey: CodingKeys.strInstructions)
        
        self.strIngredient1 = try valueContainer.decode(String?.self, forKey: CodingKeys.strIngredient1)
        self.strIngredient2 = try valueContainer.decode(String?.self, forKey: CodingKeys.strIngredient2)
        self.strIngredient3 = try valueContainer.decode(String?.self, forKey: CodingKeys.strIngredient3)
        self.strIngredient4 = try valueContainer.decode(String?.self, forKey: CodingKeys.strIngredient4)
        self.strIngredient5 = try valueContainer.decode(String?.self, forKey: CodingKeys.strIngredient5)
        self.strIngredient6 = try valueContainer.decode(String?.self, forKey: CodingKeys.strIngredient6)
        self.strIngredient7 = try valueContainer.decode(String?.self, forKey: CodingKeys.strIngredient7)
        self.strIngredient8 = try valueContainer.decode(String?.self, forKey: CodingKeys.strIngredient8)
        self.strIngredient9 = try valueContainer.decode(String?.self, forKey: CodingKeys.strIngredient9)
        self.strIngredient10 = try valueContainer.decode(String?.self, forKey: CodingKeys.strIngredient10)
        self.strIngredient11 = try valueContainer.decode(String?.self, forKey: CodingKeys.strIngredient11)
        self.strIngredient12 = try valueContainer.decode(String?.self, forKey: CodingKeys.strIngredient12)
        self.strIngredient13 = try valueContainer.decode(String?.self, forKey: CodingKeys.strIngredient13)
        self.strIngredient14 = try valueContainer.decode(String?.self, forKey: CodingKeys.strIngredient14)
        self.strIngredient15 = try valueContainer.decode(String?.self, forKey: CodingKeys.strIngredient15)
        
        self.strMeasure1 = try valueContainer.decode(String?.self, forKey: CodingKeys.strMeasure1)
        self.strMeasure2 = try valueContainer.decode(String?.self, forKey: CodingKeys.strMeasure2)
        self.strMeasure3 = try valueContainer.decode(String?.self, forKey: CodingKeys.strMeasure3)
        self.strMeasure4 = try valueContainer.decode(String?.self, forKey: CodingKeys.strMeasure4)
        self.strMeasure5 = try valueContainer.decode(String?.self, forKey: CodingKeys.strMeasure5)
        self.strMeasure6 = try valueContainer.decode(String?.self, forKey: CodingKeys.strMeasure6)
        self.strMeasure7 = try valueContainer.decode(String?.self, forKey: CodingKeys.strMeasure7)
        self.strMeasure8 = try valueContainer.decode(String?.self, forKey: CodingKeys.strMeasure8)
        self.strMeasure9 = try valueContainer.decode(String?.self, forKey: CodingKeys.strMeasure9)
        self.strMeasure10 = try valueContainer.decode(String?.self, forKey: CodingKeys.strMeasure10)
        self.strMeasure11 = try valueContainer.decode(String?.self, forKey: CodingKeys.strMeasure11)
        self.strMeasure12 = try valueContainer.decode(String?.self, forKey: CodingKeys.strMeasure12)
        self.strMeasure13 = try valueContainer.decode(String?.self, forKey: CodingKeys.strMeasure13)
        self.strMeasure14 = try valueContainer.decode(String?.self, forKey: CodingKeys.strMeasure14)
        self.strMeasure15 = try valueContainer.decode(String?.self, forKey: CodingKeys.strMeasure15)
    }
}
