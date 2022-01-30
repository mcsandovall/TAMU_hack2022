//
//  NavController.swift
//  FTApp
//
//  Created by Justin Thompson on 1/29/22.
//

import UIKit

class NavController: UINavigationController {
    var finances : financial_info
    var userData : user_info?
    var gotExpenses : Bool = false
    var gotIncome : Bool = false
    
    init(){
        finances = financial_info()
        print("new controller")
        userData = user_info()
        super.init(navigationBarClass: nil, toolbarClass: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        finances = financial_info()
        print("new controller")
        userData = user_info()
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func setFinances(finances f : financial_info){
        self.finances = f
        userData!.set_financialInfo(info: finances)
    }
    
    func setIncome(income i : Double){
        finances.income = i
        userData!.set_financialInfo(info: finances)
    }

}
