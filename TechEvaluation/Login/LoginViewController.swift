//
//  LoginViewController.swift
//  TechEvaluation
//
//  Created by kavimani on 31/07/19.
//  Copyright © 2019 kavimani. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var eidText: UITextField!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var idbarahnoText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var unifiednoText: UITextField!
    @IBOutlet weak var mobileText: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    
    private var loginViewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTargets()
        
        
    } 
    private func addTargets(){
        for subview in view.subviews as [UIView] {
            if let textField = subview as? UITextField {
                textField.addTarget(self, action: #selector(self.didEnterDatas), for: UIControl.Event.editingChanged)
            }
        }
        loginBtn.addTarget(self, action: #selector(self.didClickSignup), for: UIControl.Event.touchUpInside)
    }
    @objc func didClickSignup(){
        loginViewModel.validateLoginInputs { (status, message) in
            if(status){
                //Get response
                self.performSegue(withIdentifier: "newsSegue", sender: nil)
            }else{ 
                alertUtil.alertInstance.showAlert(view: self, title: "Error:", message: message)
            }
        }
    }
    
    @objc func didEnterDatas(){
        loginViewModel.eid = eidText.text!
        loginViewModel.name = nameText.text!
        loginViewModel.idbarahno = idbarahnoText.text!
        loginViewModel.emailId = emailText.text!
        loginViewModel.unifiednumber = unifiednoText.text!
        loginViewModel.mobileno = mobileText.text!
    }
}
