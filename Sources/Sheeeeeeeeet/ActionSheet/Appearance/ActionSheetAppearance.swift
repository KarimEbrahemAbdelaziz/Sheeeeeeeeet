//
//  ActionSheetAppearance.swift
//  Sheeeeeeeeet
//
//  Created by Daniel Saidi on 2019-08-12.
//  Copyright © 2019 Daniel Saidi. All rights reserved.
//

import Foundation
import UIKit

/**
 This is the base class for all action sheet appearances.

 Just call `ActionSheet.applyAppearance(.standard)` to apply
 the standard appearance.
 
 You can inherit this class to create your own custom action
 sheet appearances. However, to avoid a lot of work, you can
 inherit `StandardActionSheetAppearance` instead and add any
 customizations to the standard appearance.
 
 To apply a custom appearance, simply call the same function
 as before, with your custom appearance as parameter instead
 of `.standard`.
 */
open class ActionSheetAppearance {

    
    // MARK: - Initialization
    
    public init() {}
    
    
    // MARK: - Properties
    
    /**
     Get an instance of the standard action sheet appearance.
     */
    public static var standard: ActionSheetAppearance {
        ActionSheetAppearance()
    }
    
    
    /**
     Apply the appearance to be used globally for all sheets.
     */
    open func apply() {
        applyColors()
        applyCornerRadii()
        applyFonts()
        applyHeights()
        applyIcons()
        applySeparatorInsets()
    }
    
    open func applyColors() {
        background.backgroundColor = .sheetColor(.overlay)
        header.backgroundColor = .clear
        table.separatorColor = .sheetColor(.separator)
        table.backgroundColor = .sheetColor(.background)
        
        item.backgroundColor = .clear
        item.tintColor = .sheetColor(.text)
        item.titleColor = .sheetColor(.text)
        item.subtitleColor = .sheetColor(.text)
        
        selectItem.selectedIconColor = .sheetColor(.text)
        selectItem.selectedTintColor = .sheetColor(.text)
        selectItem.selectedTitleColor = .sheetColor(.text)
        selectItem.tintColor = .sheetColor(.discreteText)
        selectItem.titleColor = .sheetColor(.discreteText)
        selectItem.unselectedIconColor = .sheetColor(.discreteText)
        multiSelectToggle.selectAllSubtitleColor = .sheetColor(.actionText)
        multiSelectToggle.deselectAllSubtitleColor = .sheetColor(.actionText)

        cancelButton.titleColor = .sheetColor(.discreteText)
        dangerButton.titleColor = .sheetColor(.danger)
    }
    
    open func applyCornerRadii() {
        header.cornerRadius = 10
        table.cornerRadius = 10
    }
    
    open func applyFonts() {
        item.titleFont = .systemFont(ofSize: 17)
        item.subtitleFont = .systemFont(ofSize: 14)
        multiSelectToggle.titleFont = .boldSystemFont(ofSize: 13)
        sectionTitle.titleFont = .boldSystemFont(ofSize: 14)
        title.titleFont = .boldSystemFont(ofSize: 15)
        button.titleFont = .boldSystemFont(ofSize: 17)
        cancelButton.titleFont = .systemFont(ofSize: 17)
    }
    
    open func applyHeights() {
        let standard = 50.0
        let title = 25.0
        ActionSheetItemCell.appearance().height = standard
        ActionSheetButtonCell.appearance().height = standard
        
        ActionSheetCancelButtonCell.appearance().height = standard
        ActionSheetDangerButtonCell.appearance().height = standard
        ActionSheetOkButtonCell.appearance().height = standard
        
        ActionSheetCollectionItemCell.appearance().height = standard
        ActionSheetLinkItemCell.appearance().height = standard
        ActionSheetMultiSelectItemCell.appearance().height = standard
        ActionSheetMultiSelectToggleItemCell.appearance().height = standard
        ActionSheetSelectItemCell.appearance().height = standard
        ActionSheetSingleSelectItemCell.appearance().height = standard
        
        ActionSheetTitleCell.appearance().height = standard
        ActionSheetSectionTitleCell.appearance().height = title
        ActionSheetSectionMarginCell.appearance().height = title
    }
    
    open func applyIcons() {
        guard #available(iOS 13.0, *) else { return }
        link.linkIcon = UIImage(systemName: "chevron.right")
        selectItem.selectedIcon = UIImage(systemName: "checkmark")
    }
    
    open func applySeparatorInsets() {
        item.separatorInset = .zero
        title.separatorInset = .hiddenSeparator
        sectionTitle.separatorInset = .hiddenSeparator
        sectionMargin.separatorInset = .hiddenSeparator
        multiSelectToggle.separatorInset = .hiddenSeparator
    }
}

public extension ActionSheetAppearance {
    
    var background: ActionSheetBackgroundView { ActionSheetBackgroundView.appearance() }
    var button: ActionSheetButtonCell { ActionSheetButtonCell.appearance() }
    var buttonsTable: ActionSheetButtonTableView { ActionSheetButtonTableView.appearance() }
    var cancelButton: ActionSheetCancelButtonCell { ActionSheetCancelButtonCell.appearance() }
    var dangerButton: ActionSheetDangerButtonCell { ActionSheetDangerButtonCell.appearance() }
    var header: ActionSheetHeaderContainerView { ActionSheetHeaderContainerView.appearance() }
    var link: ActionSheetLinkItemCell { ActionSheetLinkItemCell.appearance() }
    var item: ActionSheetItemCell { ActionSheetItemCell.appearance() }
    var itemsTable: ActionSheetItemTableView { ActionSheetItemTableView.appearance() }
    var multiSelectItem: ActionSheetMultiSelectItemCell { ActionSheetMultiSelectItemCell.appearance() }
    var multiSelectToggle: ActionSheetMultiSelectToggleItemCell { ActionSheetMultiSelectToggleItemCell.appearance() }
    var okButton: ActionSheetOkButtonCell { ActionSheetOkButtonCell.appearance() }
    var sectionMargin: ActionSheetSectionMarginCell { ActionSheetSectionMarginCell.appearance() }
    var sectionTitle: ActionSheetSectionTitleCell { ActionSheetSectionTitleCell.appearance() }
    var selectItem: ActionSheetSelectItemCell { ActionSheetSelectItemCell.appearance() }
    var singleSelectItem: ActionSheetSingleSelectItemCell { ActionSheetSingleSelectItemCell.appearance() }
    var table: ActionSheetTableView { ActionSheetTableView.appearance() }
    var title: ActionSheetTitleCell { ActionSheetTitleCell.appearance() }
}
