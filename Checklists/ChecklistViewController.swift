//
//  ViewController.swift
//  Checklists
//
//  Created by Oludemilade Raji on 10/19/17.
//  Copyright © 2017 donrajon. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {
    var row0item: ChecklistItem
    var row1item: ChecklistItem
    var row2item: ChecklistItem
    var row3item: ChecklistItem
    var row4item: ChecklistItem
    var items: [ChecklistItem]
    
    required init?(coder aDecoder: NSCoder) {
        items = [ChecklistItem]()
        
        row0item = ChecklistItem()
        row0item.text = "Walk the Dog"
        row0item.checked = false
        items.append(row0item)
        
        row1item = ChecklistItem()
        row1item.text = "Brush My Teeth"
        row1item.checked = true
        items.append(row1item)
        
        row2item = ChecklistItem()
        row2item.text = "Learn iOS Development"
        row2item.checked = true
        items.append(row2item)
        
        row3item = ChecklistItem()
        row3item.text = "Soccer Practice"
        row3item.checked = false
        items.append(row3item)
        
        row4item = ChecklistItem()
        row4item.text = "Eat some Ice Cream"
        row4item.checked = true
        items.append(row4item)
        
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        let item = items[indexPath.row]
        
        configureText(for: cell, with: item)
        configureCheckmark(for: cell, with: item)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            let item = items[indexPath.row]
            item.toggleChecked()
            configureCheckmark(for: cell, with: item)
        }
    tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        //Remove the item from the data model
        items.remove(at: indexPath.row)
        
        //Delete the corresponding row from the table view
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic)
    }
    
    func configureCheckmark(for cell: UITableViewCell, with item:ChecklistItem){
        if item.checked {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
    }
    
    func configureText(for cell: UITableViewCell, with item:ChecklistItem){
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = item.text
    }
    
    @IBAction func addItem() {
        let newRowIndex = items.count
        
        let item = ChecklistItem()
        item.text = "I am a new row"
        item.checked = false
        
        items.append(item)
        
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)
    }
}

