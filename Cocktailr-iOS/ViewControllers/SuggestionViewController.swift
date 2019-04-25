import UIKit

class SuggestionViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    let pickerData: [String] = ["Cocktail", "Ordinary Drink", "Beer", "Punch / Party Drink", "Other / Unknown", "Shot"]
    
    var imagePicker: UIImagePickerController!
    
    @IBOutlet weak var suggestionImageView: UIImageView!
    @IBOutlet weak var suggestionNameTextField: UITextField!
    @IBOutlet weak var suggestionTextView: UITextView!
    @IBOutlet weak var categoryPickerView: UIPickerView!
    @IBOutlet weak var makeSuggestionButton: UIButton!
    @IBOutlet weak var takeImageButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        suggestionNameTextField.layer.borderColor = UIColor.darkGray.cgColor
        suggestionNameTextField.layer.borderWidth = 1.0;
        
        suggestionTextView.layer.borderColor = UIColor.darkGray.cgColor
        suggestionTextView.layer.borderWidth = 1.0;
        
        categoryPickerView.layer.borderColor = UIColor.darkGray.cgColor
        categoryPickerView.layer.borderWidth = 1.0;
        
        self.categoryPickerView.delegate = self
        self.categoryPickerView.dataSource = self
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    @IBAction func takeImageButtonClick(_ sender: UIButton) {
        imagePicker =  UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    
    @IBAction func makeSuggestionButtonClick(_ sender: UIButton) {
        if suggestionNameTextField.text != ""  && suggestionTextView.text != "" {
            let alert = UIAlertController(title: "Make suggestion", message: "Thank you for your suggestion", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title:"Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imagePicker.dismiss(animated: true, completion: nil)
        suggestionImageView.image = info[.originalImage] as? UIImage
    }
}
