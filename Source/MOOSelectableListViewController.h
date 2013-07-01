//
// Created by Liam Nichols on 01/07/2013.
// Copyright (c) 2013 Mubaloo Ltd. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

typedef void (^didSelectItemBlock)(id title, id value);

@interface MOOSelectableListViewController : UITableViewController

@property (nonatomic, readonly) NSArray *items;
@property (nonatomic, readonly) id selectedItem;
@property (copy) didSelectItemBlock selectionBlock;
@property (nonatomic) BOOL selectionUpdatesIndicator;

- (id)initWithItems:(NSArray *)items;
- (id)initWithItems:(NSArray *)items changedBlock:(didSelectItemBlock)block;
- (id)initWithItems:(NSArray *)items changedBlock:(didSelectItemBlock)block selectedItem:(id)selected;
- (id)initWithItems:(NSArray *)items changedBlock:(didSelectItemBlock)block selectedItem:(id)selected cellClass:(Class)cellClass;
- (id)initWithItems:(NSArray *)items changedBlock:(didSelectItemBlock)block selectedItem:(id)selected cellClass:(Class)cellClass tableViewStyle:(UITableViewStyle)style;

@end