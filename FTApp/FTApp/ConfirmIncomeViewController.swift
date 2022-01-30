//
//  ConfirmIncomeViewController.swift
//  FTApp
//
//  Created by Justin Thompson on 1/29/22.
//

import UIKit

class ConfirmIncomeViewController: UIViewController {
    @IBOutlet weak var Label: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Confirm Income"
        // Do any additional setup after loading the view.
        var finances : financial_info = financial_info()
        if let NC = navigationController as? NavController{
            finances = NC.finances
        }
        
        Label.text = "Income : $"  + user_info.toString(doubleValue: finances.income)
    }
    


}
