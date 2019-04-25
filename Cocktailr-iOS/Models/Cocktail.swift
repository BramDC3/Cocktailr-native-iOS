import Foundation

class Cocktail {
    var id: String = ""
    var name: String = ""
    var category: String = ""
    var instructions: String = ""
    var imageUrl: String = ""
    var ingredients: [String?] = []
    var measurements: [String?] = []
}

extension Cocktail {
    convenience init(id: String, name: String, imageUrl: String) {
        self.init()
        self.id = id
        self.name = name
        self.imageUrl = imageUrl
    }
}
