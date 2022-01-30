//
//  ConfirmBudgetViewController.swift
//  FTApp
//
//  Created by Justin Thompson on 1/29/22.
//

import UIKit

class ConfirmBudgetViewController: UIViewController {

    @IBOutlet weak var RentLabel: UILabel!
    @IBOutlet weak var UtilitiesLabel: UILabel!
    @IBOutlet weak var GroceriesLabel: UILabel!
    @IBOutlet weak var DinningLabel: UILabel!
    @IBOutlet weak var EntertainmentLabel: UILabel!
    @IBOutlet weak var OtherLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Confirm Budget"
        var finances : financial_info = financial_info()
        if let NC = navigationController as? NavController{
            finances = NC.finances
        }
        
        RentLabel.text = "Rent : $"  + user_info.toString(doubleValue: finances.rent)
        UtilitiesLabel.text = "Utilities : $"  + user_info.toString(doubleValue: finances.utilities)
        GroceriesLabel.text = "Groceries : $"  + user_info.toString(doubleValue: finances.groceries)
        DinningLabel.text = "Dinning : $"  + user_info.toString(doubleValue: finances.dinning)
        EntertainmentLabel.text = "Entertainment : $"  + String(finances.entretainment)
        OtherLabel.text = "Other : $"  + user_info.toString(doubleValue: finances.personal_expenses)
        
        // Do any additional setup after loading the view.
    }
    

    

}
