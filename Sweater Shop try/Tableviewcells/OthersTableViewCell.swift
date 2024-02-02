//
//  OthersTableViewCell.swift
//  Sweater Shop try
//
//  Created by Nithin on 29/10/23.
//

import UIKit

class OthersTableViewCell: UITableViewCell {
    @IBOutlet weak var sweaterimage: UIImageView!
    @IBOutlet weak var costlabel: UILabel!
    @IBOutlet weak var namelabel: UILabel!
    @IBOutlet weak var ratinglabel: UILabel!
    @IBOutlet weak var ranklabel: UILabel!
    @IBOutlet weak var sizeTextField:  UITextField!

    var sizeOptions: [String] = ["Medium+Medium","Medium+Large","Medium+XL","Medium+XXL", "Large+Medium","Large+Large","Large+XL","Large+XXL", "XL+Medium","XL+Large","XL+XL", "XL+XXL","XXL+Medium","XXL+Large","XXL+XL","XXL+XXL"]

    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureSizePicker()
    }

    func configureSizePicker() {
        let sizePicker = UIPickerView()
        sizePicker.delegate = self
        sizePicker.dataSource = self
        sizeTextField.inputView = sizePicker
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
}

extension OthersTableViewCell: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return sizeOptions.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return sizeOptions[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        sizeTextField.text = sizeOptions[row]
        sizeTextField.resignFirstResponder() 
    }
}
