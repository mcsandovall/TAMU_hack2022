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
    var expected_essential : Int = 0;
    var expected_non_essentials : Int = 0;
    var expected_savings : Int = 0;
    
    // vars of actual calculations, from the user
    var acutal_essentials : Int = 0;
    var acutal_non_essentils : Int = 0;
    var actual_savings : Int = 0;
    
    init(){
    }
    
    func set_financialInfo(info : financial_info){
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
    
    // save for retirement functions ASUME 5% return on the market
    
    // based on expected info
    func expected_retiremnet(age : Int) -> [Int]{
        var temp: Int = 0;
        var array : [Int] = [];
        for year in age...65{
            array[year - age] = Int( Double( Double(temp + expected_savings) * 1.05));
            temp = array[year - age];
        }
                    
        return array;
    }
    
    func acutal_retiremnet(age: Int) -> [Int]{
        var temp2 : Int = 0;
        var array : [Int] = [];
        for year in age...65{
            array[year - age] = Int( Double( Double(temp2 + actual_savings) * 1.05));
            temp2 = array[year - age];
        }
        return array;
    }
    
    // make a savings
    func expected_savingFund(goal : Int) -> Int{
        var time : Int = 0;
        var _goal : Int = goal;
        while(_goal > 0){
            _goal -= expected_savings;
            time += 1;
        }
        return time;
    }
    
    func actual_savingFund(goal : Int) -> Int{
        var time : Int = 0;
        var _goal : Int = goal;
        while(_goal > 0){
            _goal -= actual_savings;
            time += 1;
        }
        return time;
    }
    
    // repay the debt
    func expected_repay(debt : Int) -> Int{
        var time : Int = 0;
        var _debt : Int = debt;
        while(_debt > 0){
            _debt -= expected_savings;
            time += 1;
        }
        return time;
    }
    
    func actual_repay(debt : Int) -> Int{
        var time : Int = 0;
        var _debt : Int = debt;
        while(_debt > 0){
            _debt -= actual_savings;
            time += 1;
        }
        return time;
    }
}
