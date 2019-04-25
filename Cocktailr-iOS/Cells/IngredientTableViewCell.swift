import UIKit

class IngredientTableViewCell: UITableViewCell {
    
    @IBOutlet weak var ingredientLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var ingredientView: UIView!
    @IBOutlet weak var amountView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        ingredientView.layer.borderWidth = 1
        ingredientView.layer.borderColor = UIColor.black.cgColor
        amountView.layer.borderWidth = 1
        amountView.layer.borderColor = UIColor.black.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
