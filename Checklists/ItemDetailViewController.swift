//
//  ItemDetailViewController.swift
//  Checklists
//
//  Created by Oludemilade Raji on 10/31/17.
//  Copyright © 2017 donrajon. All rights reserved.
//

import Foundation
import UIKit

protocol ItemDetailViewControllerDelegate: class {
    func itemDetailViewControllerDidCancel( _ controller: ItemDetailViewController)
    func itemDetailViewController( _ controller: ItemDetailViewController, didFinishAdding item: ChecklistItem)
    func itemDetailViewController( _ controller: ItemDetailViewController, didFinishEditing item: ChecklistItem)
}
class ItemDetailViewController: UITableViewController, UITextFieldDelegate {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    weak var delegate: ItemDetailViewControllerDelegate?
    var itemToEdit: ChecklistItem?
    
    @IBAction func done() {
        if let item = itemToEdit{
            item.text = textField.text!
            delegate?.itemDetailViewController(self, didFinishEditing: item)
        } else {
            let item = ChecklistItem()
            item.text = textField.text!
            item.checked = false
            delegate?.itemDetailViewController(self, didFinishAdding: item)
        }
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
    @IBAction func cancel() {
        delegate?.itemDetailViewControllerDidCancel(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let item = itemToEdit {
            //This changes the title on the Navigation bar
            title = "Edit Item"
            textField.text = item.text
            doneBarButton.isEnabled = true
        }
    }
    // To allow keyboard to automatically appear once the screen appears
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textField.becomeFirstResponder()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let oldText = textField.text! as NSString
        let newText = oldText.replacingCharacters(in: range, with: string) as NSString
       /*
        if newText.length > 0 {
            doneBarButton.isEnabled = true
        } else {
            doneBarButton.isEnabled = false
        }*/
        
        //Entire line above replace
        doneBarButton.isEnabled = (newText.length > 0)
        return true
    }
}

