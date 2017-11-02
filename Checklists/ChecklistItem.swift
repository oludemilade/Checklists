//
//  ChecklistItem.swift
//  Checklists
//
//  Created by Oludemilade Raji on 10/19/17.
//  Copyright © 2017 donrajon. All rights reserved.
//

import Foundation

class ChecklistItem: NSObject {
    var text = ""
    var checked = false

    func toggleChecked() {
        checked = !checked
    }
}
