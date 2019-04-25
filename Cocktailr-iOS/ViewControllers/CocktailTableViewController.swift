import UIKit

class CocktailTableViewController: UITableViewController {
    
    var cocktails: [Cocktail] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "CocktailTableViewCell", bundle: nil), forCellReuseIdentifier: "CocktailCell")
        
        cocktails = CocktailRepository.instance.cocktails
    }
    
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(onReceiveNotification(_:)), name: .didFetchCocktailsByIngredient, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self, name: .didFetchCocktailsByIngredient, object: nil)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cocktails.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CocktailCell", for: indexPath) as? CocktailTableViewCell else {
            fatalError("Could not dequeue a cell.")
        }
        
        let cocktail = cocktails[indexPath.row]
        
        cell.cocktailNameLabel.text = cocktail.name
        cell.cocktailIdLabel.text = "ID: \(cocktail.id)"
        
        DispatchQueue.main.async {
            self.fetchImage(url: URL(string: cocktail.imageUrl)!) { (image) in
                guard let image = image else { return }
                DispatchQueue.main.async {
                    cell.cocktailImageView.image = image
                }
            }
        }

        return cell
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
    
    @objc func onReceiveNotification(_ notification:Notification) {
        DispatchQueue.main.async {
            self.cocktails = CocktailRepository.instance.cocktails
            self.tableView.reloadData()
        }
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cocktail = cocktails[indexPath.row]
        CocktailRepository.instance.getCocktailById(cocktail: cocktail)
        self.performSegue(withIdentifier: "CocktailDetailSegue", sender: indexPath);
    }

    @IBAction func searchBarButtonClick(_ sender: Any) {
        self.performSegue(withIdentifier: "SearchTableViewSegue", sender: self);
    }
    
}
