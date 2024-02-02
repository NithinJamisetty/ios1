//
//  WomenViewController.swift
//  Sweater Shop try
//
//  Created by Nithin on 24/10/23.
//

import UIKit

class WomenViewController: UIViewController {
    var name: String?
    var listsweater = [SweaterData]()

    @IBOutlet weak var mytable: UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let sweater1 = SweaterData(sName: "White Pink Mix  Sweater", cName: 900, rName: 4.5, photoSweater: "wo1")
        listsweater.append(sweater1)
        let sweater2 = SweaterData(sName: "Silver Silver Mix Sweater", cName: 700, rName: 4, photoSweater: "wo2")
        listsweater.append(sweater2)
        let sweater3 = SweaterData(sName: "Orange Red Mix Sweater", cName: 950, rName: 5, photoSweater: "wo3")
        listsweater.append(sweater3)
        let sweater4 = SweaterData(sName: "Dark Blue Mix Sweater", cName: 750, rName: 5, photoSweater: "wo4")
        listsweater.append(sweater4)
        let sweater5 = SweaterData(sName: "Light Brown Wite Sweater", cName: 850, rName: 4, photoSweater: "wo5")
        listsweater.append(sweater5)
        let sweater6 = SweaterData(sName: "White Green Sweater", cName: 600, rName: 4, photoSweater: "wo6")
        listsweater.append(sweater6)
        let sweater7 = SweaterData(sName: "Biscuit Grey Sweater", cName: 950, rName: 4.5, photoSweater: "wo7")
        listsweater.append(sweater7)
        let sweater8 = SweaterData(sName: "Light Pink Sweater", cName: 880, rName: 5, photoSweater: "wo8")
        listsweater.append(sweater8)
        let sweater9 = SweaterData(sName: "White Grey Sweater", cName: 500, rName: 4, photoSweater: "wo9")
        listsweater.append(sweater9)
        let sweater10 = SweaterData(sName: "Orange White Sweater", cName: 660, rName: 4, photoSweater: "wo10")
        listsweater.append(sweater10)
        
        mytable.tableFooterView = UIView(frame: .zero)
        
        mytable.delegate = self
        mytable.dataSource = self

        
    }

}
extension WomenViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listsweater.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = mytable.dequeueReusableCell(withIdentifier: "women1", for: indexPath) as! WomenTableViewCell
        cell.ranklabel.text = "\(indexPath.row + 1)"
        cell.namelabel.text = listsweater[indexPath.row].sweatername
        cell.costlabel.text = String(listsweater[indexPath.row].cost)
        cell.ratinglabel.text = String(listsweater[indexPath.row].rating)
        cell.sweaterimage.image = UIImage(named: listsweater[indexPath.row].sweaterPhoto)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            if let cell = tableView.cellForRow(at: indexPath) as? WomenTableViewCell {
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
