//
//  GetBudgetViewController.swift
//  FTApp
//
//  Created by Justin Thompson on 1/29/22.
//

import UIKit

class GetBudgetViewController: UIViewController {
    @IBOutlet weak var RentTextField: UITextField!
    @IBOutlet weak var UtilitiesTextField: UITextField!
    @IBOutlet weak var GroceriesTextField: UITextField!
    @IBOutlet weak var DinningTextField: UITextField!
    @IBOutlet weak var EntertainmentTextField: UITextField!
    @IBOutlet weak var OtherTextField: UITextField!
    var finances : financial_info = financial_info()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Set Budget"
        RentTextField.keyboardType = UIKeyboardType.decimalPad
        UtilitiesTextField.keyboardType = UIKeyboardType.decimalPad
        GroceriesTextField.keyboardType = UIKeyboardType.decimalPad
        DinningTextField.keyboardType = UIKeyboardType.decimalPad
        EntertainmentTextField.keyboardType = UIKeyboardType.decimalPad
        OtherTextField.keyboardType = UIKeyboardType.decimalPad
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.navigationController?.navigationBar.isHidden = false
        
        if let NC = navigationController as? NavController{
            if(NC.gotExpenses){
                finances = NC.finances
                RentTextField.text = String(finances.rent)
                UtilitiesTextField.text = String(finances.utilities)
                GroceriesTextField.text = String(finances.groceries)
                DinningTextField.text = String(finances.dinning)
                EntertainmentTextField.text = String(finances.entretainment)
                OtherTextField.text = String(finances.personal_expenses)
            }
            NC.gotExpenses = true
        }
    }


    @IBAction func submitButtonPressed(_ sender: Any) {
        finances.rent = Double(RentTextField.text!) ?? -1
        finances.utilities = Double(UtilitiesTextField.text!) ?? -1
        finances.groceries = Double(GroceriesTextField.text!) ?? -1
        finances.dinning = Double(DinningTextField.text!) ?? -1
        finances.entretainment = Double(EntertainmentTextField.text!) ?? -1
        finances.personal_expenses = Double(OtherTextField.text!) ?? -1
        if let NC = navigationController as? NavController{
            NC.setFinances(finances: finances)
        }
        
    }
}
