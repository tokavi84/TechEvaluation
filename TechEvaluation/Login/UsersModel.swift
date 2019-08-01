//
//  UsersModel.swift
//  TechEvaluation
//
//  Created by kavimani on 01/08/19.
//  Copyright © 2019 kavimani. All rights reserved.
// 

import UIKit

internal class UsersModel: NSObject,UserDetails {
    var name: String = ""
    var idbarahno: String = ""
    var eid: String = ""
    var emailId: String = ""
    var unifiednumber: String = ""
    var mobileno: String = ""
}

protocol UserDetails{
    var name:String{get set}
    var idbarahno:String{get set}
    var eid:String{get set}
    var emailId:String{get set}
    var unifiednumber:String{get set}
    var mobileno:String{get set}
}
