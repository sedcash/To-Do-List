//
//  ViewController.swift
//  To Do List
//
//  Created by Sedrick Cashaw Jr on 1/3/18.
//  Copyright © 2018 Sedrick Cashaw Jr. All rights reserved.
//

import UIKit

class ToDoListVC: UIViewController, UITableViewDataSource, UITableViewDelegate{
    var cellContent: [String] = []
    @IBOutlet weak var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let itemsObject = UserDefaults.standard.object(forKey: "items")
        if let tempitems = itemsObject as? [String]{
            cellContent = tempitems
            
        }
        
    }
    
    @IBAction func unwindToToDoList(sender: UIStoryboardSegue){
        if let source = sender.source as? AddItemsVC{
            if let tempitems = source.items as? [String]{
                cellContent = tempitems
            }
        table.reloadData()
        }
    }
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return cellContent.count
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        cell.textLabel?.text = cellContent[indexPath.row]
        return cell
    }
    
    @objc func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete{
            cellContent.remove(at: indexPath.row)
            table.reloadData()
            UserDefaults.standard.set(cellContent, forKey: "items")
        }
    }

}

