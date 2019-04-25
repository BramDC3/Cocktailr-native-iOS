import UIKit

class SearchTableViewCell: UITableViewCell {

    @IBOutlet weak var ingredientLabel: UILabel!
    @IBOutlet weak var ingredientImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let image = UIImage(named: "ic_local_bar_24px")?.withRenderingMode(.alwaysTemplate)
        ingredientImageView.tintColor = UIColor.darkGray
        ingredientImageView.image = image
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
