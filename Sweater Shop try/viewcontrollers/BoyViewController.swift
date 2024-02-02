//
//  BoyViewController.swift
//  Sweater Shop try
//
//  Created by Nithin on 27/10/23.
//

import UIKit

class BoyViewController: UIViewController {
    var name: String?
    var listsweater = [SweaterData]()

    @IBOutlet weak var mytable: UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let sweater1 = SweaterData(sName: "White Green Mix  Sweater", cName: 800, rName: 4.5, photoSweater: "bo1")
        listsweater.append(sweater1)
        let sweater2 = SweaterData(sName: "Green Biscuit Mix Sweater", cName: 600, rName: 4, photoSweater: "bo2")
        listsweater.append(sweater2)
        let sweater3 = SweaterData(sName: "Biscuit Black Sweater", cName: 900, rName: 5, photoSweater: "bo3")
        listsweater.append(sweater3)
        let sweater4 = SweaterData(sName: "Red Blue Sweater", cName: 750, rName: 5, photoSweater: "bo4")
        listsweater.append(sweater4)
        let sweater5 = SweaterData(sName: "Biscuit Brown Sweater", cName: 650, rName: 4, photoSweater: "bo5")
        listsweater.append(sweater5)
        let sweater6 = SweaterData(sName: "White Black Brown Mix Sweater", cName: 900, rName: 4, photoSweater: "bo6")
        listsweater.append(sweater6)
        let sweater7 = SweaterData(sName: "Biscuit Red White Mix Sweater", cName: 650, rName: 4.5, photoSweater: "bo7")
        listsweater.append(sweater7)
        let sweater8 = SweaterData(sName: "Light Biscuit White Sweater", cName: 820, rName: 5, photoSweater: "bo8")
        listsweater.append(sweater8)
        let sweater9 = SweaterData(sName: "White Silver Sweater", cName: 700, rName: 4, photoSweater: "bo9")
        listsweater.append(sweater9)
        let sweater10 = SweaterData(sName: "Orange Green Black Mix Sweater", cName: 700, rName: 4, photoSweater: "bo10")
        listsweater.append(sweater10)
        
        mytable.tableFooterView = UIView(frame: .zero)
        
        mytable.delegate = self
        mytable.dataSource = self

       
    }

}
extension BoyViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listsweater.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = mytable.dequeueReusableCell(withIdentifier: "boy1", for: indexPath) as! BoyTableViewCell
        cell.ranklabel.text = "\(indexPath.row + 1)"
        cell.namelabel.text = listsweater[indexPath.row].sweatername
        cell.costlabel.text = String(listsweater[indexPath.row].cost)
        cell.ratinglabel.text = String(listsweater[indexPath.row].rating)
        cell.sweaterimage.image = UIImage(named: listsweater[indexPath.row].sweaterPhoto)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? BoyTableViewCell {
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
