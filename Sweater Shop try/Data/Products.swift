import UIKit
var name1 = String();
class Products: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet weak var contactus: UIButton!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!

    
    var productsimages: [String] = ["a", "b", "c", "d", "e"]
    var productsLabels: [String] = ["MEN", "WOMEN", "BOY", "GIRL", "COUPLES"]

    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "Welcome \(name1)"
        contactus.addTarget(self, action: #selector(showAlert), for: .touchUpInside)

        collectionView.delegate = self
        collectionView.dataSource = self
    }

    @objc func showAlert() {
        let alertView = UIAlertController(title: "Contact Us", message: "You can contact us through mobile number: 8978771345 or with mail id: rocknithin14@gmail.com", preferredStyle: .alert)
        alertView.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alertView, animated: true, completion: nil)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productsimages.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! myproductscollection
        cell.myproductsimages.image = UIImage(named: productsimages[indexPath.row])
        cell.myproductsimages.layer.cornerRadius = 50.0
        cell.mylabel.text = productsLabels[indexPath.row]

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        switch productsimages[indexPath.item] {
        case "a":
            if let menVC = storyboard.instantiateViewController(withIdentifier: "1") as? MenViewController {
                menVC.name = "Men"
                navigationController?.pushViewController(menVC, animated: true)
            }
        case "b":
            if let womenVC = storyboard.instantiateViewController(withIdentifier: "2") as? WomenViewController {
                womenVC.name = "Women"
                navigationController?.pushViewController(womenVC, animated: true)
            }
        case "c":
            if let menVC = storyboard.instantiateViewController(withIdentifier: "3") as? BoyViewController {
                menVC.name = "MenBoy"
                navigationController?.pushViewController(menVC, animated: true)
            }
        case "d":
            if let womenVC = storyboard.instantiateViewController(withIdentifier: "4") as? WomenGirlViewController {
                womenVC.name = "WomenGirl"
                navigationController?.pushViewController(womenVC, animated: true)
            }
        case "e":
            if let womenVC = storyboard.instantiateViewController(withIdentifier: "5") as? CouplesViewController {
                womenVC.name = "Couples"
                navigationController?.pushViewController(womenVC, animated: true)
            }
        
        default:
            break
        }
    }
    
    @IBAction func cart_button(_ sender: Any) {
        performSegue(withIdentifier: "cart", sender: nil)
    }
    
    
    
}
