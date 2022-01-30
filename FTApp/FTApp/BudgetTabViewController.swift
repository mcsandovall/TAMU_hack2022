//
//  BudgetTabViewController.swift
//  FTApp
//
//  Created by Justin Thompson on 1/29/22.
//

import UIKit

class BudgetTabViewController: UIViewController {

    @IBOutlet weak var IncomeLabel: UILabel!
    @IBOutlet weak var RentLabel: UILabel!
    @IBOutlet weak var UtilitiesLabel: UILabel!
    @IBOutlet weak var GroceriesLabel: UILabel!
    @IBOutlet weak var DinningLabel: UILabel!
    @IBOutlet weak var EntertainmentLabel: UILabel!
    @IBOutlet weak var OtherLabel: UILabel!
    @IBOutlet weak var SavingsLabel: UILabel!
    @IBOutlet weak var TotalExpensesLabel: UILabel!
    @IBOutlet weak var SavingsTextLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.navigationItem.title = self.tabBarItem.title
        self.navigationController?.navigationBar.isHidden = true;
        
        var finances : financial_info = financial_info()
        var userData : user_info = user_info()
        
        if let NC = navigationController as? NavController{
            finances = NC.finances
            userData = NC.userData!
        }
        print(finances.rent)
        
        IncomeLabel.text = "$" + user_info.toString(doubleValue: (finances.income))
        RentLabel.text = "$" + user_info.toString(doubleValue: finances.rent)
        UtilitiesLabel.text = "$" + user_info.toString(doubleValue: finances.utilities)
        GroceriesLabel.text = "$" + user_info.toString(doubleValue: finances.groceries)
        DinningLabel.text = "$" + user_info.toString(doubleValue: finances.dinning)
        EntertainmentLabel.text = "$" + user_info.toString(doubleValue: finances.entretainment)
        OtherLabel.text = "$" + user_info.toString(doubleValue: finances.personal_expenses)
        TotalExpensesLabel.text = "$" + user_info.toString(doubleValue: userData.acutal_non_essentils + userData.acutal_essentials)
        SavingsLabel.text = "$" + user_info.toString(doubleValue: userData.actual_savings)
        var colorToUse : UIColor = RentLabel.textColor
        if userData.actual_savings > 0 {
            colorToUse = IncomeLabel.textColor
        }
        SavingsLabel.textColor = colorToUse
        SavingsTextLabel.textColor = colorToUse
        
    }
    
    
    @IBAction func EditDataButtonPushed(_ sender: Any) {
        performSegue(withIdentifier: "EditDataSegue", sender: self)
    }
    
}
