//
//  SecondViewController.swift
//  To Do List
//
//  Created by Sedrick Cashaw Jr on 1/3/18.
//  Copyright © 2018 Sedrick Cashaw Jr. All rights reserved.
//

import UIKit

class AddItemsVC: UIViewController , UITextFieldDelegate{

    @IBOutlet weak var itemTextField: UITextField!
    var items : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addItemToList(_ sender: Any) {
        let itemsObject = UserDefaults.standard.object(forKey: "items")
        if let tempitems = itemsObject as? [String]{
            items = tempitems
            items.append(itemTextField.text!)
            print(items)
        }else{
            items = [itemTextField.text!]
        }
        UserDefaults.standard.set(items, forKey: "items")
        itemTextField.text = ""
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let itemsObject = UserDefaults.standard.object(forKey: "items")
        if let tempitems = itemsObject as? [String]{
            items = tempitems
            
        }
            
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
