import UIKit

class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var ingredients: [String] = []

    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ingredients = CocktailRepository.instance.ingredients

        searchTableView.delegate = self
        searchTableView.dataSource = self
        searchTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        searchTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        
        NotificationCenter.default.addObserver(self, selector: #selector(onReceiveNotification(_:)), name: .didFetchIngredients, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self, name: .didFetchIngredients, object: nil)
    }
    
    @objc func onReceiveNotification(_ notification:Notification) {
        filterIngredients(filter: "")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ingredients.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SearchCell", for: indexPath) as? SearchTableViewCell else {
            fatalError("Could not dequeue a cell.")
        }
        
        cell.ingredientLabel.text = ingredients[indexPath.row]
        
        return cell
    }
    
    func filterIngredients(filter: String) {
        if (filter == "") {
            ingredients = CocktailRepository.instance.ingredients
        } else {
            ingredients = CocktailRepository.instance.ingredients.filter({ $0.lowercased().contains(filter.lowercased()) })
        }
        searchTableView.reloadData()
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        filterIngredients(filter: textField.text!)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let ingredient = ingredients[indexPath.row]
        CocktailRepository.instance.getCocktailsByIngredient(ingredient: ingredient)
        navigationController?.popViewController(animated: true)
    }

}
