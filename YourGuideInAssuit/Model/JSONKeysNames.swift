//
//  File.swift
//  YourGuideInAssuit
//
//  Created by Mostafa AbdEl Fatah on 10/24/18.
//  Copyright © 2018 Mostafa AbdEl Fatah. All rights reserved.
//

import Foundation

struct JSONKeysNames {
    
    public static let ID      = "ID";
    public static let NAME    = "Name";
    public static let ADDRESS = "Address";
    public static let PHONE   = "Phone";
    
    public static let CLINICS     = "clinics";
    public static let DEPARTMENTS = "departments";
    public static let HOSPITALS   = "hospitals";
    public static let HOTELS      = "hotels";
    public static let LABS        = "labs";
    public static let PHARMACY    = "pharmacy";
    public static let RESTAURANTS = "Restaurants";
    public static let S_HOSPITALS = "s_hospitals";
    public static let SEMSARS     = "semsars";
    public static let SUB_BRANCH  = [ CLINICS, HOSPITALS, PHARMACY, LABS, HOTELS, RESTAURANTS, SEMSARS]
}
