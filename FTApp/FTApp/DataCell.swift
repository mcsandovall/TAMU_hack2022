//
//  DataCell.swift
//  FTApp
//
//  Created by Justin Thompson on 1/30/22.
//

import UIKit

class DataCell: UITableViewCell {
    var amount : Double = 0
    var year : Int = 0

    @IBOutlet var YearLabel: UILabel!
    @IBOutlet var AmountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setContent(amount a : Double, year y : Int){
        self.amount = a
        self.year = y
        
        YearLabel.text = String(y)
        AmountLabel.text = "$" + user_info.toString(doubleValue: a)
    }

}
