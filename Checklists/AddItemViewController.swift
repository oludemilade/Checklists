//
//  AddItemViewController.swift
//  Checklists
//
//  Created by Oludemilade Raji on 10/31/17.
//  Copyright © 2017 donrajon. All rights reserved.
//

import Foundation
import UIKit

class AddItemViewController: UITableViewController, UITextFieldDelegate {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    
    @IBAction func done() {
        print("Contents of the text Field: \(textField.text!)")
        dismiss(animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
    @IBAction func cancel() {
        dismiss(animated: true, completion: nil)
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

