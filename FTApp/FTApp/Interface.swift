//
//  Interface.swift
//  FTApp
//
//  Created by Mario Sandoval on 1/29/22.
//

import Foundation

struct financial_info {
    var income : Int = get_income();
    var rent : Int = 0;
    var utilities : Int = 0;
    var groceries : Int = 0;
    var dinning : Int = 0;
    var entretainment : Int = 0;
    var personal_expenses : Int = 0;
}

class user_info{
    // implement the 50/30/20 rule
    
    var expected_essential : Int = 0;
    var acutal_essentials : Int = 0;
    
}

func get_income() -> Int{
    
    return 0;
}
