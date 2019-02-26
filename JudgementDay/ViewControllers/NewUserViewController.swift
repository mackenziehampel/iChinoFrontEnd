//
//  NewUserViewController.swift
//  JudgementDay
//
//  Created by Ben Oliverson on 2/24/19.
//  Copyright © 2019 Weber State. All rights reserved.
//

import UIKit

class NewUserViewController: UIViewController {
    

    @IBOutlet weak var txtFirstName: UITextField!
    @IBOutlet weak var txtLastName: UITextField!
    @IBOutlet weak var txtPhone: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var userEmail: String = ""
    
    override func viewDidLoad() {
        txtEmail.text = userEmail
//        scrollView.contentSize = CGSize(width: 269.0, height: 100.0)
    }
    
    @IBAction func didSelectCancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func didSelectCreate(_ sender: Any) {
    }
    
    
}
