//
//  Interface.swift
//  FTApp
//
//  Created by Mario Sandoval on 1/29/22.
//

import Foundation

struct financial_info {
    var income : Double
    var rent : Double
    var utilities : Double
    var groceries : Double
    var dinning : Double
    var entretainment : Double
    var personal_expenses : Double
    init(){
        print("new finances")
        income = 1
        rent = 1
        utilities = 1
        groceries = 1
        dinning = 1
        entretainment = 1
        personal_expenses = 1
    }
}

class user_info{
    // implement the 50/30/20 rule
    
    // var of expected essentials (perfect world scenario)
    var expected_essential : Double = 0;
    var expected_non_essentials : Double = 0;
    var expected_savings : Double = 0;
    
    // vars of actual calculations, from the user
    var acutal_essentials : Double = 0;
    var acutal_non_essentils : Double = 0;
    var actual_savings : Double = 0;
    var actual_percent : Double = 0;
    
    var age = 0
    var retirementAge = 65
    var choice = 0//0 for actual, 1 for 20%
    
    init(){
    }
    
    func set_financialInfo(info : financial_info){
        // work with expected variables
        expected_essential = info.income * 0.5
        expected_non_essentials = info.income * 0.3
        expected_savings = info.income * 0.2
        
        //actual values
        let sum : Double = info.rent + info.utilities + info.groceries + info.dinning + info.entretainment + info.personal_expenses;
        
        acutal_essentials =  (info.rent + info.utilities + info.groceries)// / sum
        acutal_non_essentils = (info.dinning + info.entretainment + info.personal_expenses)// / sum
        actual_savings = info.income - (acutal_essentials + acutal_non_essentils);
        actual_percent = (actual_savings / info.income) * 100
        
    }
    
    static func toString(doubleValue d : Double) -> String{
        var str = String(d)
        while(str.firstIndex(of: ".")!.encodedOffset <= str.count - 4){
            str = str.substring(to: String.Index(encodedOffset: str.endIndex.encodedOffset - 1))
        }
        while(str.firstIndex(of: ".")!.encodedOffset >= str.count - 2){
            str = str + "0"
        }
        return str
    }
    
    func get_essential_differnece() -> Double{
        return acutal_essentials - expected_essential;
    }
    
    func get_non_essential_difference() -> Double{
        return acutal_non_essentils - expected_non_essentials;
    }
    
    func get_savings_difference() -> Double{
        return expected_savings - expected_savings;
    }
    
    // save for retirement functions ASSUME 5% return on the market
    
    // based on expected info
    func expected_retiremnet(age : Int) -> [Double]{
        var temp: Double = 0;
        var array : [Double] = [];
        for year in age...retirementAge{
            array.append((temp + expected_savings*12) * 1.04)
            temp = array[year - age];
        }
                    
        return array;
    }
    
    func acutal_retiremnet(age: Int) -> [Double]{
        var temp2 : Double = 0;
        var array : [Double] = []
        for year in age...retirementAge{
            array.append((temp2 + actual_savings*12) * 1.04)
            temp2 = array[year - age];
        }
        return array;
    }
    
    // make a savings
    func expected_savingFund(goal : Double) -> Int{
        var time : Int = 0;
        var _goal : Double = goal;
        while(_goal > 0){
            _goal -= expected_savings;
            time += 1;
        }
        return time;
    }
    
    func actual_savingFund(goal : Double) -> Int{
        var time : Int = 0;
        var _goal : Double = goal;
        while(_goal > 0){
            _goal -= actual_savings;
            time += 1;
        }
        return time;
    }
    
    // repay the debt
    func expected_repay(debt : Double) -> Int{
        var time : Int = 0;
        var _debt : Double = debt;
        while(_debt > 0){
            _debt -= expected_savings;
            time += 1;
        }
        return time;
    }
    
    func actual_repay(debt : Double) -> Int{
        var time : Int = 0;
        var _debt : Double = debt;
        while(_debt > 0){
            _debt -= actual_savings;
            time += 1;
        }
        return time;
    }
}
