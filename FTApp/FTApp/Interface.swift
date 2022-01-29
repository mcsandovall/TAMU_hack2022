//
//  Interface.swift
//  FTApp
//
//  Created by Mario Sandoval on 1/29/22.
//

import Foundation

struct financial_info {
    var income : Int = 0;
    var rent : Int = 0;
    var utilities : Int = 0;
    var groceries : Int = 0;
    var dinning : Int = 0;
    var entretainment : Int = 0;
    var personal_expenses : Int = 0;
}

class user_info{
    // implement the 50/30/20 rule
    
    // var of expected essentials (perfect world scenario)
    var expected_essential : Int;
    var expected_non_essentials : Int;
    var expected_savings : Int;
    
    // vars of actual calculations, from the user
    var acutal_essentials : Int;
    var acutal_non_essentils : Int;
    var actual_savings : Int;
    
    init(info : financial_info){
        // work with expected variables
        expected_essential = Int( Double(info.income) * 0.5 );
        expected_non_essentials = Int( Double(info.income) * 0.3);
        expected_savings = Int ( Double(info.income) * 0.2);
        
        //actual values
        let sum : Int = info.rent + info.utilities + info.groceries + info.dinning + info.entretainment + info.personal_expenses;
        
        acutal_essentials = Int (Double( (info.rent + info.utilities + info.groceries) / sum));
        acutal_non_essentils = Int ( Double( (info.dinning + info.entretainment + info.personal_expenses) / sum));
        actual_savings = info.income - (acutal_essentials + acutal_non_essentils);
    }
    
    func get_essential_differnece() -> Int{
        return acutal_essentials - expected_essential;
    }
    
    func get_non_essential_difference() -> Int{
        return acutal_non_essentils - expected_non_essentials;
    }
    
    func get_savings_difference() -> Int{
        return expected_savings - expected_savings;
    }
}
