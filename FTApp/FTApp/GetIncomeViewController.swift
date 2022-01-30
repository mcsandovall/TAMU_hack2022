//
//  GetIncomeViewController.swift
//  FTApp
//
//  Created by Justin Thompson on 1/29/22.
//

import UIKit

class GetIncomeViewController: UIViewController {

    @IBOutlet weak var TextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Set Income"
        TextField.keyboardType = UIKeyboardType.decimalPad
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.navigationController?.navigationBar.isHidden = false;
        
        if let NC = navigationController as? NavController{
            if(NC.gotIncome){
                TextField.text = String(NC.finances.income)
            }
            NC.gotIncome = true
        }
    }
    
    @IBAction func ButtonPushed(_ sender: Any) {
        if let NC = navigationController as? NavController{
            NC.setIncome(income: Double(TextField.text!) ?? -1)
        }
    }
}
