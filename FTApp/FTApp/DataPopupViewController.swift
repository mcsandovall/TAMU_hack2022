//
//  DataPopupViewController.swift
//  FTApp
//
//  Created by Justin Thompson on 1/30/22.
//

import UIKit

class DataPopupViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet var Table: UITableView!
    @IBOutlet var pgTextView: UILabel!
    
    var userData = user_info()
    var data : [Double] = []
    var percent : Double = 0.0
    var monthlySavings : Double = 0.0
    var finalValue : Double = 0.0
    var age = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Table.delegate = self
        Table.dataSource = self
        setup()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setup()
    }
    
    func setup(){
        // Do any additional setup after loading the view.
        if let NC = navigationController as? NavController{
            userData = NC.userData!
            print("assigned")
        }
        
        age = userData.age
        
        if(userData.choice == 0){
            percent = userData.actual_percent
            data = userData.acutal_retiremnet(age: age)
            monthlySavings = userData.actual_savings
        }
        else{
            percent = 20
            monthlySavings = userData.expected_savings
            data = userData.acutal_retiremnet(age: age)
        }
        finalValue = data[data.count-1]
        
        pgTextView.text = "By investing " + user_info.toString(doubleValue: percent) + "% of your income($" + user_info.toString(doubleValue: monthlySavings) + ") each month, you will have acrued $" + user_info.toString(doubleValue: finalValue) + " by age " + String(userData.retirementAge) + ". See full data below."
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Table.dequeueReusableCell(withIdentifier: "dataCell")
        if let C = cell as? DataCell {
            C.setContent(amount: data[indexPath.row], year: indexPath.row + age)
        }
        return cell!
    }
    

    

}
