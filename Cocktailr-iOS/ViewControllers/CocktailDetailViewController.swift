import UIKit

class CocktailDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var cocktail: Cocktail?
    
    @IBOutlet weak var cocktailImageView: UIImageView!
    @IBOutlet weak var cocktailNameLabel: UILabel!
    @IBOutlet weak var cocktailCategoryLabel: UILabel!
    @IBOutlet weak var cocktailInstructionsLabel: UILabel!
    @IBOutlet weak var ingredientTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        cocktail = CocktailRepository.instance.selectedCocktail
        
        updateUI()
        
        ingredientTableView.delegate = self
        ingredientTableView.dataSource = self
        ingredientTableView.register(UINib(nibName: "IngredientTableViewCell", bundle: nil), forCellReuseIdentifier: "IngredientCell")
        ingredientTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        NotificationCenter.default.addObserver(self, selector: #selector(onReceiveNotification(_:)), name: .didFetchCocktailById, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self, name: .didFetchCocktailById, object: nil)
    }
    
    @objc func onReceiveNotification(_ notification:Notification) {
        cocktail = CocktailRepository.instance.selectedCocktail
        updateUI()
    }
    
    private func updateUI() {
        DispatchQueue.main.async {
            if let cocktail = self.cocktail {
                self.navigationItem.title = cocktail.name
                
                self.fetchImage(url: URL(string: cocktail.imageUrl)!) { (image) in
                    guard let image = image else { return }
                    DispatchQueue.main.async {
                        self.cocktailImageView.image = image
                    }
                }
                
                self.cocktailNameLabel.text = cocktail.name
                self.cocktailCategoryLabel.text = "Category:  \(cocktail.category)"
                self.cocktailInstructionsLabel.text = cocktail.instructions
                self.ingredientTableView.reloadData()
            }
        }
    }
    
    func fetchImage(url: URL, completion: @escaping (UIImage?) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data, let image = UIImage(data: data) {
                completion(image)
            } else {
                completion(nil)
            }
        }
        task.resume()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ((cocktail != nil) ? cocktail!.ingredients.count : 0) + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "IngredientCell", for: indexPath) as? IngredientTableViewCell else {
            fatalError("Could not dequeue a cell.")
        }
        
        if indexPath.row == 0 {
            cell.ingredientLabel.text = "INGREDIENT"
            cell.amountLabel.text = "AMOUNT"
        } else {
            cell.ingredientLabel.text = cocktail!.ingredients[indexPath.row - 1]
            cell.amountLabel.text = (cocktail!.measurements.count > indexPath.row - 1) ? cocktail!.measurements[indexPath.row - 1] : ""
        }
        
        return cell
    }
    
}
