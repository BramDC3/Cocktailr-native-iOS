import Foundation

struct Cocktail {
    let id: String
    let name: String
    var category: String = ""
    var instructions: String = ""
    let imageUrl: String
    var ingredients: [String] = []
    var measurements: [String] = []
}
