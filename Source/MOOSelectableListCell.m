//
// Created by Liam Nichols on 01/07/2013.
// Copyright (c) 2013 Mubaloo Ltd. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "MOOSelectableListCell.h"


@implementation MOOSelectableListCell

- (void)updateCellWithTitle:(id)title value:(id)value selected:(BOOL)selected {

    self.textLabel.text = [title description];
    self.accessoryType = selected ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;

}

@end