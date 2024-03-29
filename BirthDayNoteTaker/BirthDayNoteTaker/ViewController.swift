//
//  ViewController.swift
//  BirthDayNoteTaker
//
//  Created by Wanderson Dias Ferreira on 3/28/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var NameInput: UITextField!
    @IBOutlet weak var BirthDayInput: UITextField!
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var BirthdayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //After the user closes the App, and open again, we want the user to be able to get the data
        //get the data
        
        let storeName = UserDefaults.standard.object(forKey: "name")
        let storedBirthDay = UserDefaults.standard.object(forKey: "birthday")
        //This helps us to check if the data is right. it wont crash the app
        if let NewNameLabel = storeName as? String{
            NameLabel.text = "Name: \(NewNameLabel)"
            
        }
        if let NewBirthDay = storedBirthDay as? String{
            BirthdayLabel.text = "Birthday: \(NewBirthDay)"
        }
        
    }
    @IBAction func SaveButton(_ sender: Any) {
        
        
        UserDefaults.standard.setValue(NameInput.text!, forKey: "name")
        UserDefaults.standard.setValue(BirthDayInput.text!, forKey: "birthday")
        //UserDefaults.standard.synchronize()
        //Saving the data, in the database
        //The ! is for forcing casting the data
        
        NameLabel.text = "Name: \(NameInput.text!)"
        BirthdayLabel.text = "Birthday: \(BirthDayInput.text!)"
        
    }
    
    @IBAction func DeleteData(_ sender: Any) {
        let storedName = UserDefaults.standard.object(forKey: "name")
        let storedBirthday = UserDefaults.standard.object(forKey: "birthday")
        
        if (storedName as? String) != nil{
            UserDefaults.standard.removeObject(forKey: "name")
            NameLabel.text = "Name: "
        }
        
        if (storedBirthday as? String) != nil{
            UserDefaults.standard.removeObject(forKey: "birthday")
            BirthdayLabel.text = "Birthday: "
        }
        
    }
    
}

