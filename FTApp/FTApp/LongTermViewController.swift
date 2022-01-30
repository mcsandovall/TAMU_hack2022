//
//  LongTermViewController.swift
//  FTApp
//
//  Created by Justin Thompson on 1/29/22.
//

import UIKit

class LongTermViewController: UIViewController {
    @IBOutlet weak var AgeTextField: UITextField!
    @IBOutlet weak var ActualButton: UIButton!
    @IBOutlet var pgTextView: UILabel!
    var finances = financial_info()
    var userData = user_info()
    @IBOutlet var RetirementTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let NC = navigationController as? NavController{
            finances = NC.finances
            userData = NC.userData!
        }
        pgTextView.text = "Based on your savings of $" + user_info.toString(doubleValue: userData.actual_savings) + " per month, we can calculate how much money you will have in retirement based on your current age, your retirement age, and an assumed 4% annual return. Your savings make up " + user_info.toString(doubleValue: userData.actual_percent) + "% of your income. According to the 50/ 30/ 20 rule, savings should make up at least 20% of your income ($" + user_info.toString(doubleValue: userData.expected_savings) + "). See your retirement data for either of these percentages by entering your age below."
        
        AgeTextField.keyboardType = UIKeyboardType.numberPad
        ActualButton.setTitle(user_info.toString(doubleValue: userData.actual_percent) + "%", for: .normal)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let receiverVC = segue.destination as! DataPopupViewController
        receiverVC.userData = userData
    }

    @IBAction func ActualButtonPressed(_ sender: Any) {
        userData.age = Int(AgeTextField.text!) ?? 18
        userData.retirementAge = Int(RetirementTextField.text!) ?? 65
        performSegue(withIdentifier: "RetirementData", sender: self)
        userData.choice = 0
    }
    @IBAction func TwentyButtonPressed(_ sender: Any) {
        userData.age = Int(AgeTextField.text!) ?? 18
        userData.retirementAge = Int(RetirementTextField.text!) ?? 65
        userData.choice = 1
        performSegue(withIdentifier: "RetirementData", sender: self)
    }
}
