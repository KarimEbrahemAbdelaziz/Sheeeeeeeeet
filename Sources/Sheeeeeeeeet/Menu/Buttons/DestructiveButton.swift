//
//  DestructiveButton.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-09-17.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import UIKit

/**
 A destributive button is just an OK button that can be used
 to indicate that tapping it has a destructive effect.
 
 The `value` of a destructive button is `.ok`.
 */
open class DestructiveButton: OkButton {
    
    open override func actionSheetCell(for tableView: UITableView) -> ActionSheetItemCell {
        ActionSheetDangerButtonCell(style: .default)
    }
    
    open override var actionSheetCellType: ActionSheetItemCell.Type {
        ActionSheetDangerButtonCell.self
    }
}