//
//  LoginViewModel.swift
//  TechEvaluation
//
//  Created by kavimani on 01/08/19.
//  Copyright © 2019 kavimani. All rights reserved.
//

import UIKit
import Alamofire

internal class LoginViewModel: NSObject,UserDetails {
    var name: String = ""
    var idbarahno: String = ""
    var eid: String = ""
    var emailId: String = ""
    var unifiednumber: String = ""
    var mobileno: String = ""
    
    private var userModel = UsersModel()
    
    private var isValidName:Bool{
        return name.count != 0
    }
    
    private var isValidUnifiednumber:Bool{
        if unifiednumber.count != 0,Int(unifiednumber) != nil{
            return true
        }
        return false
    }
    
    private var isValidIdbarahno:Bool{
        if idbarahno.count != 0,Int(idbarahno) != nil{
            return true
        }
        return false
    }
    
    private var isValidEid:Bool{
        if  eid.count != 0,Int(eid) != nil {
            return true
        }
        return false
    }
    
    private var isValidMailId:Bool{
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: emailId)
    }
    private var isValidMobileNumber:Bool {
        let phoneNumberRegex = "^[6-9]\\d{11}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneNumberRegex)
        return phoneTest.evaluate(with: mobileno)
    }
    
    public func validateLoginInputs(completion:@escaping (_ status:Bool,_ message:String) ->()){
        if (!isValidEid) {
            completion(false,"Invalid Eid")
        }else if(!isValidName) {
            completion(false,"Invalid Name")
        }else if (!isValidIdbarahno){
            completion(false,"Invalid Idbarah Number")
        }else if (!isValidMailId){
            completion(false,"Invalid Email-Id")
        }else if (!isValidUnifiednumber){
            completion(false,"Invalid Unified Number")
        }else if (!isValidMobileNumber){
            completion(false,"Invalid Mobile Number")
        }else{
            let api_url = API_URL + "iskan/v1/certificates/towhomitmayconcern?local=enx"
            let header:HTTPHeaders = ["consumer-key": CONSUMER_KEY, "consumer-secret": CONSUMER_SECRET ]
            let parameters: Parameters = ["eid": eid, "name": name, "idbarahno": idbarahno, "emailaddress": emailId, "unifiednumber": unifiednumber, "mobileno": mobileno]
            Alamofire.request(api_url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: header).responseJSON { response in 
                switch response.result {
                case .success:
                    UserDefaults.standard.set(self.eid, forKey: "EID")
                    UserDefaults.standard.set(self.name, forKey: "NAME")
                    UserDefaults.standard.set(self.idbarahno, forKey: "IDBARAHNO")
                    UserDefaults.standard.set(self.emailId, forKey: "EMAILID")
                    UserDefaults.standard.set(self.unifiednumber, forKey: "UNIFIEDNO")
                    UserDefaults.standard.set(self.mobileno, forKey: "MOBILENO")
                    UserDefaults.standard.set("A", forKey: "LOGIN_STAT")
                    completion(true,"input verified")
                case .failure(_):
                    UserDefaults.standard.set("N", forKey: "LOGIN_STAT")
                    completion(false,"input Error")
                }
            }
        }
    }
    
}
