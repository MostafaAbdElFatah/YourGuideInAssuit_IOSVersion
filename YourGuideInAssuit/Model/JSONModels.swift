//
//  JSONModels.swift
//  YourGuideInAssuit
//
//  Created by Mostafa AbdEl Fatah on 10/24/18.
//  Copyright © 2018 Mostafa AbdEl Fatah. All rights reserved.
//

import Foundation

class Department: Codable {
    var result:String = ""
    var data:[DepartmentData] = []
    class DepartmentData: Codable {
        var ID:String = ""
        var Name:String = ""
    }
}

class Place: Codable {
    var result:String = ""
    var data:[PlaceData] = []
    class PlaceData: Codable {
        var Name:String = ""
        var Address:String = ""
        var Phone:String = ""
    }
}
