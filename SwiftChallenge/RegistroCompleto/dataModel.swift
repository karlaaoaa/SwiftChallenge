//
//  saveData.swift
//  SwiftChallenge
//
//  Created by Alumno on 07/06/25.
//

import Foundation

struct InputData: Codable {
    var HighBP: Bool?
    var HighChol: Bool?
    var GenHlth: Int?
    var Sex: Int?
    var Diabetes: Bool?
    var Age: Int?
    var BMI: Int?
    
    func isComplete() -> Bool {
        return HighBP != nil  &&
        HighChol != nil &&
        GenHlth != nil &&
        Sex != nil &&
        Diabetes != nil &&
        Age != nil &&
        BMI != nil
    }
    
    func toDictionary() -> [String: Any] {
        var dict: [String: Any] = [:]
        
        if let HighBP = HighBP { dict["HighBP"] = HighBP }
        if let HighChol = HighChol { dict["HighChol"] = HighChol }
        if let GenHlth = GenHlth { dict["GenHlth"] = GenHlth }
        if let Sex = Sex { dict["Sex"] = Sex }
        if let Diabetes = Diabetes { dict["Diabetes"] = Diabetes }
        if let Age = Age { dict["Age"] = Age }
        if let BMI = BMI {dict["BMI"] = BMI}
        
        return dict
    }
}

struct MLResponse: Codable {
    let cluster: Int
}
