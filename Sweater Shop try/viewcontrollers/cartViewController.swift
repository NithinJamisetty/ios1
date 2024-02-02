//
//  cartViewController.swift
//  Sweater Shop try
//
//  Created by Nithin on 30/10/23.
//

import UIKit

class cartViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    
    
    @IBOutlet weak var label2: UILabel!
    
    @IBOutlet weak var itemImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var total = 0.0
        for cart in cartmanager.shared.carts{
            total = total + cart.cost
        }
        label2.text = " Your Total Cost is :\(total)"
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartmanager.shared.carts.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var obj = tableView.dequeueReusableCell(withIdentifier: "cart", for: indexPath)
        
        obj.textLabel?.text = "\(cartmanager.shared.carts[indexPath.row].name)  \(cartmanager.shared.carts[indexPath.row].cost)   \(cartmanager.shared.carts[indexPath.row].size)"
        return obj
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == .delete {
                cartmanager.shared.carts.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
                var total = 0.0
                for cart in cartmanager.shared.carts {
                    total += cart.cost
                }
                label2.text = " Your Total Cost Is :\(total)"
            }
        }
    
    
    @IBOutlet weak var slid: UISlider!
    
    @IBAction func payfunc(_ sender: Any) {
        
        var alt2 = UIAlertController(title: "CHECKOUT", message: "\(label2.text!)", preferredStyle: UIAlertController.Style.alert)
        
        alt2.addAction(UIAlertAction(title: "Go To Phone Pay", style: UIAlertAction.Style.default, handler: nil));
        alt2.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.destructive, handler: nil));

        present(alt2,animated: true);
    }
    
    
    @IBOutlet weak var img: UIImageView!
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        if (Int(slid.value) == 0){
            img.image = UIImage(named: "1")
        }else if(Int(slid.value) == 1){
            img.image = UIImage(named: "1")
        }else if(Int(slid.value) == 2){
            img.image = UIImage(named: "2")
        }else if(Int(slid.value) == 3){
            img.image = UIImage(named: "3")
        }else if(Int(slid.value) == 4){
            img.image = UIImage(named: "4")
        }
        else{
            img.image = UIImage(named: "5")
        }
        
    }
    
    
    @IBAction func rating(_ sender: Any) {
        let rating = round(slid.value)
        let message = "Thank You For Your Rating: \(rating)"
        
        let alert = UIAlertController(title: "Rating", message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(okAction)
        
        self.present(alert, animated: true, completion: nil)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let selectedItem = cartmanager.shared.carts[indexPath.row]
            itemImageView.image = UIImage(named: selectedItem.image) 
        }
    
    
    
    
}
