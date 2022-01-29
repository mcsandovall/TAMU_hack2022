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
        var finances : financial_info = financial_info()
        if let NC = navigationController as? NavController{
            finances = NC.finances
        }
        
        RentLabel.text = "Rent : $"  + String(finances.rent)
        UtilitiesLabel.text = "Utilities : $"  + String(finances.utilities)
        GroceriesLabel.text = "Groceries : $"  + String(finances.groceries)
        DinningLabel.text = "Dinning : $"  + String(finances.dinning)
        EntertainmentLabel.text = "Entertainment : $"  + String(finances.entretainment)
        OtherLabel.text = "Other : $"  + String(finances.personal_expenses)
        
        // Do any additional setup after loading the view.
    }
    

    

}
