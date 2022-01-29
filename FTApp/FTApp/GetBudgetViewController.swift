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
        RentTextField.keyboardType = UIKeyboardType.numberPad
        UtilitiesTextField.keyboardType = UIKeyboardType.numberPad
        GroceriesTextField.keyboardType = UIKeyboardType.numberPad
        DinningTextField.keyboardType = UIKeyboardType.numberPad
        EntertainmentTextField.keyboardType = UIKeyboardType.numberPad
        OtherTextField.keyboardType = UIKeyboardType.numberPad
    }


    @IBAction func submitButtonPressed(_ sender: Any) {
        finances.rent = Int(RentTextField.text!) ?? -1
        finances.utilities = Int(UtilitiesTextField.text!) ?? -1
        finances.groceries = Int(GroceriesTextField.text!) ?? -1
        finances.dinning = Int(DinningTextField.text!) ?? -1
        finances.entretainment = Int(EntertainmentTextField.text!) ?? -1
        finances.personal_expenses = Int(OtherTextField.text!) ?? -1
        if let NC = navigationController as? NavController{
            NC.setFinances(finances: finances)
        }
        
    }
}
