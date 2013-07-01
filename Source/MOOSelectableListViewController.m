//
// Created by Liam Nichols on 01/07/2013.
// Copyright (c) 2013 Mubaloo Ltd. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "MOOSelectableListViewController.h"
#import "MOOSelectableListCell.h"

NSString *const cellIdentifierKey = @"cellIdentifier";

@implementation MOOSelectableListViewController

- (id)initWithItems:(NSArray *)items {
    self = [self initWithItems:items changedBlock:NULL];
    return self;
}

- (id)initWithItems:(NSArray *)items changedBlock:(didSelectItemBlock)block {
    self = [self initWithItems:items changedBlock:block selectedItem:nil];
    return self;
}

- (id)initWithItems:(NSArray *)items changedBlock:(didSelectItemBlock)block selectedItem:(id)selected {
    self = [self initWithItems:items changedBlock:block selectedItem:selected cellClass:[MOOSelectableListCell class]];
    return self;
}

- (id)initWithItems:(NSArray *)items changedBlock:(didSelectItemBlock)block selectedItem:(id)selected cellClass:(Class)cellClass {
    self = [self initWithItems:items changedBlock:block selectedItem:selected cellClass:cellClass tableViewStyle:UITableViewStylePlain];
    return self;
}

- (id)initWithItems:(NSArray *)items changedBlock:(didSelectItemBlock)block selectedItem:(id)selected cellClass:(Class)cellClass tableViewStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    if (self)
    {
        NSAssert(items != nil, @"%s - items must not be nil", __FUNCTION__);
        NSAssert(cellClass != NULL, @"%s - cellClass must not be NULL", __FUNCTION__);

        _items = items;
        _selectedItem = selected;
        _selectionBlock = block;

        self.selectionUpdatesIndicator = YES;

        [self.tableView registerClass:cellClass forCellReuseIdentifier:cellIdentifierKey];
    }
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MOOSelectableListCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifierKey forIndexPath:indexPath];

    id title = _items[indexPath.row][@"title"];
    id value = _items[indexPath.row][@"value"];
    BOOL selected = [_selectedItem isEqual:value];

    if ([cell respondsToSelector:@selector(updateCellWithTitle:value:selected:)])
        [cell updateCellWithTitle:title value:value selected:selected];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    id newTitle = _items[indexPath.row][@"title"];
    id newValue = _items[indexPath.row][@"value"];

    if (self.selectionUpdatesIndicator) {
        id oldValue = _selectedItem;

        //don't do nothing if they're the same item
        if ([newValue isEqual:oldValue])
            return;

        //update the data source
        _selectedItem = newValue;

        //begin animations
        [tableView beginUpdates];

        //get old index path (and animate it if needed)
        NSInteger index = [[_items valueForKeyPath:@"value"] indexOfObject:oldValue];
        if (index != NSNotFound)
            [tableView reloadRowsAtIndexPaths:@[ [NSIndexPath indexPathForRow:index inSection:0] ] withRowAnimation:UITableViewRowAnimationFade];

        //animate the selection state changes
        [tableView reloadRowsAtIndexPaths:@[ indexPath ] withRowAnimation:UITableViewRowAnimationFade];

        //end animations
        [tableView endUpdates];
    }

    //call the block
    if (self.selectionBlock != NULL)
        self.selectionBlock(newTitle, newValue);
}

@end