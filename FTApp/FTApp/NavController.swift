//
//  NavController.swift
//  FTApp
//
//  Created by Justin Thompson on 1/29/22.
//

import UIKit

class NavController: UINavigationController {
    var finances : financial_info = financial_info()
    var userData : user_info? = nil
    
    init(){
        //userData = user_info(info: finances)
        super.init(navigationBarClass: nil, toolbarClass: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        //userData = user_info(info: finances)
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func setFinances(finances f : financial_info){
        self.finances = f
        
    }

}
