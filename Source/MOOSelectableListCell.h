//
// Created by Liam Nichols on 01/07/2013.
// Copyright (c) 2013 Mubaloo Ltd. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

/**
 UITableViewCell subclass designed for use with MOOSelectableListViewController to provide update functions

 
 ***Subclassing Notes:***
 You should override the updateCellWithTitle:value:selected: method and use the information passed to this to update your interface.
 */

@interface MOOSelectableListCell : UITableViewCell


/**
 Called on tableView:cellForRowAtIndexPath: with information about the cell.
 
 Updates textLabel.text to title and accessoryType to selected
 
        self.textLabel.text = [title description];
        self.accessoryType = selected ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
 
 @param title The value that should be displayed in the textLabel.text
 @param value Not used in this subclass.
 @param selected Indicates if the cell should display as selected or not.
 */
-(void)updateCellWithTitle:(id)title value:(id)value selected:(BOOL)selected;

@end