//
//  MultiSelectItem.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-09-17.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import UIKit

/**
`MultiSelectItem` can be used whenever a user should be able
 to select one or several items in a menu.
 
 The `group` property can be set to group items together. It
 can be used together with the `MultiSelectToggleItem` which
 can toggle the selected state of all items in that group.
*/
open class MultiSelectItem: SelectItem {

    
    // MARK: - Initialization
    
    public init(
        title: String,
        subtitle: String? = nil,
        isSelected: Bool,
        group: String = "",
        value: Any? = nil,
        image: UIImage? = nil) {
        super.init(
            title: title,
            subtitle: subtitle,
            isSelected: isSelected,
            group: group,
            value: value,
            image: image,
            tapBehavior: .none
        )
    }
    
    
    // MARK: - Functions
    
    open override func handleSelection(in menu: Menu) {
        super.handleSelection(in: menu)
        let toggleItems = menu.items.compactMap { $0 as? MultiSelectToggleItem }
        let items = toggleItems.filter { $0.group == group }
        items.forEach { $0.refresh(for: menu) }
    }
}
