//
//  CouplesViewController.swift
//  Sweater Shop try
//
//  Created by Nithin on 29/10/23.
//

import UIKit

class CouplesViewController: UIViewController {
    var name: String?
    var listsweater = [SweaterData]()

    @IBOutlet weak var mytable: UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let sweater1 = SweaterData(sName: "Silver Couples Sweaters", cName: 1800, rName: 4.5, photoSweater: "co1")
        listsweater.append(sweater1)
        let sweater2 = SweaterData(sName: "Brown Couples Sweaters", cName: 1900, rName: 4, photoSweater: "co2")
        listsweater.append(sweater2)
        let sweater3 = SweaterData(sName: "Black Couples Sweaters", cName: 1600, rName: 5, photoSweater: "co3")
        listsweater.append(sweater3)
        let sweater4 = SweaterData(sName: "Blue Couples Sweaters", cName: 1700, rName: 5, photoSweater: "co4")
        listsweater.append(sweater4)
        let sweater5 = SweaterData(sName: "Green Couples Sweaters", cName: 1750, rName: 4, photoSweater: "co5")
        listsweater.append(sweater5)
        let sweater6 = SweaterData(sName: "White Black Sweaters", cName: 1700, rName: 4, photoSweater: "co6")
        listsweater.append(sweater6)
        let sweater7 = SweaterData(sName: "Silver Blue Sweaters", cName: 1650, rName: 4.5, photoSweater: "co7")
        listsweater.append(sweater7)
        let sweater8 = SweaterData(sName: "Pink Blue Sweater", cName: 1720, rName: 5, photoSweater: "co8")
        listsweater.append(sweater8)
        let sweater9 = SweaterData(sName: "Red Couple Sweaters", cName: 1600, rName: 4, photoSweater: "co9")
        listsweater.append(sweater9)
        let sweater10 = SweaterData(sName: "Light Green Couples Sweaters", cName: 1600, rName: 4, photoSweater: "co10")
        listsweater.append(sweater10)
        
        mytable.tableFooterView = UIView(frame: .zero)
        
        mytable.delegate = self
        mytable.dataSource = self

        
    }

}
extension CouplesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listsweater.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = mytable.dequeueReusableCell(withIdentifier: "couple1", for: indexPath) as! OthersTableViewCell
        cell.ranklabel.text = "\(indexPath.row + 1)"
        cell.namelabel.text = listsweater[indexPath.row].sweatername
        cell.costlabel.text = String(listsweater[indexPath.row].cost)
        cell.ratinglabel.text = String(listsweater[indexPath.row].rating)
        cell.sweaterimage.image = UIImage(named: listsweater[indexPath.row].sweaterPhoto)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            if let cell = tableView.cellForRow(at: indexPath) as? OthersTableViewCell {
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
