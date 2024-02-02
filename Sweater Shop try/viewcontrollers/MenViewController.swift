//
//  MenViewController.swift
//  Sweater Shop try
//
//  Created by Nithin on 24/10/23.
//

import UIKit

class MenViewController: UIViewController {
    var name: String?
    var listsweater = [SweaterData]()

    @IBOutlet weak var mytable: UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let sweater1 = SweaterData(sName: "White Grey Sweater", cName: 700, rName: 4.5, photoSweater: "m2")
        listsweater.append(sweater1)
        let sweater2 = SweaterData(sName: "Orange Silver Sweater", cName: 800, rName: 4, photoSweater: "m3")
        listsweater.append(sweater2)
        let sweater3 = SweaterData(sName: "Orange Grey Sweater", cName: 600, rName: 5, photoSweater: "m4")
        listsweater.append(sweater3)
        let sweater4 = SweaterData(sName: "Brown Blue Sweater", cName: 650, rName: 5, photoSweater: "m5")
        listsweater.append(sweater4)
        let sweater5 = SweaterData(sName: "Grey Wite Sweater", cName: 750, rName: 4, photoSweater: "m6")
        listsweater.append(sweater5)
        let sweater6 = SweaterData(sName: "White Blue Sweater", cName: 700, rName: 4, photoSweater: "m7")
        listsweater.append(sweater6)
        let sweater7 = SweaterData(sName: "Biscuit Grey Sweater", cName: 650, rName: 4.5, photoSweater: "m8")
        listsweater.append(sweater7)
        let sweater8 = SweaterData(sName: "Red Grey Sweater", cName: 720, rName: 5, photoSweater: "m9")
        listsweater.append(sweater8)
        let sweater9 = SweaterData(sName: "White Green Sweater", cName: 600, rName: 4, photoSweater: "m10")
        listsweater.append(sweater9)
        let sweater10 = SweaterData(sName: "Orange White Sweater", cName: 600, rName: 4, photoSweater: "m1")
        listsweater.append(sweater10)
        
        mytable.tableFooterView = UIView(frame: .zero)
        
        mytable.delegate = self
        mytable.dataSource = self

        
    }

}
extension MenViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listsweater.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = mytable.dequeueReusableCell(withIdentifier: "men1", for: indexPath) as! MenSweaterTableViewCell
        cell.ranklabel.text = "\(indexPath.row + 1)"
        cell.namelabel.text = listsweater[indexPath.row].sweatername
        cell.costlabel.text = String(listsweater[indexPath.row].cost)
        cell.ratinglabel.text = String(listsweater[indexPath.row].rating)
        cell.sweaterimage.image = UIImage(named: listsweater[indexPath.row].sweaterPhoto)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? MenSweaterTableViewCell {
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



