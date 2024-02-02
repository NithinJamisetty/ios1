//
//  WomenGirlViewController.swift
//  Sweater Shop try
//
//  Created by Nithin on 24/10/23.
//

import UIKit

class WomenGirlViewController: UIViewController {
    var name: String?
    var listsweater = [SweaterData]()

    @IBOutlet weak var mytable: UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let sweater1 = SweaterData(sName: "Blue TeddyBear Sweater", cName: 850, rName: 4.5, photoSweater: "go1")
        listsweater.append(sweater1)
        let sweater2 = SweaterData(sName: "Biscuit Sweater", cName: 600, rName: 4, photoSweater: "go2")
        listsweater.append(sweater2)
        let sweater3 = SweaterData(sName: "Biscuit Black Sweater", cName: 920, rName: 5, photoSweater: "go3")
        listsweater.append(sweater3)
        let sweater4 = SweaterData(sName: "Brown Flowers Sweater", cName: 780, rName: 5, photoSweater: "go4")
        listsweater.append(sweater4)
        let sweater5 = SweaterData(sName: "Red Choclate Sweater", cName: 590, rName: 4, photoSweater: "go5")
        listsweater.append(sweater5)
        let sweater6 = SweaterData(sName: "Red Sweater", cName: 890, rName: 4, photoSweater: "go6")
        listsweater.append(sweater6)
        let sweater7 = SweaterData(sName: "Yellow Sweater", cName: 900, rName: 4.5, photoSweater: "go7")
        listsweater.append(sweater7)
        let sweater8 = SweaterData(sName: "Blue Dragon Sweater", cName: 870, rName: 5, photoSweater: "go8")
        listsweater.append(sweater8)
        let sweater9 = SweaterData(sName: "Blue Sea Sweater", cName: 730, rName: 4, photoSweater: "go9")
        listsweater.append(sweater9)
        let sweater10 = SweaterData(sName: "Yellow Checks Sweater", cName: 630, rName: 4, photoSweater: "go10")
        listsweater.append(sweater10)
        
        mytable.tableFooterView = UIView(frame: .zero)
        
        mytable.delegate = self
        mytable.dataSource = self

        
    }

}
extension WomenGirlViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listsweater.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = mytable.dequeueReusableCell(withIdentifier: "girl1", for: indexPath) as! GirlTableViewCell
        cell.ranklabel.text = "\(indexPath.row + 1)"
        cell.namelabel.text = listsweater[indexPath.row].sweatername
        cell.costlabel.text = String(listsweater[indexPath.row].cost)
        cell.ratinglabel.text = String(listsweater[indexPath.row].rating)
        cell.sweaterimage.image = UIImage(named: listsweater[indexPath.row].sweaterPhoto)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            if let cell = tableView.cellForRow(at: indexPath) as? GirlTableViewCell {
                let selectedSweater = listsweater[indexPath.row]
                let okhandler = {
                    (action:UIAlertAction) -> Void in
                    var new_item:cart = cart(name: "\(selectedSweater.sweatername)", cost:selectedSweater.cost, size: "\(cell.sizeTextField.text ?? "")", image: selectedSweater.sweaterPhoto)
                    cartmanager.shared.addcart(new_item)
                }
                let alertController = UIAlertController(title: "Sweater Details", message: "Sweater: \(selectedSweater.sweatername)\nSize: \(cell.sizeTextField.text ?? "")\nCost: \(selectedSweater.cost)", preferredStyle: .alert)
                
                alertController.addAction(UIAlertAction(title: "Close", style: .cancel, handler: nil))
                alertController.addAction(UIAlertAction(title: "ADD TO CART", style: .default, handler:okhandler))
                present(alertController, animated: true, completion: nil)
            }
        }


}
