//
// Created by Liam Nichols on 01/07/2013.
// Copyright (c) 2013 Mubaloo Ltd. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

typedef void (^didSelectItemBlock)(id title, id value);


/**
 A UITableViewController subclass that provides an easy way to handle selecting an item from a list of items.
 */
@interface MOOSelectableListViewController : UITableViewController

/**
 The list of items provided in the classes initialisation
 */
@property (nonatomic, readonly) NSArray *items;

/**
 The block that is called when an item has been selected
 */
@property (copy) didSelectItemBlock selectionBlock;

/**
 Informs the view controller to update the currently selected cells interface to display indicate that it is selected.
 
 This property defaults to YES.
 
 @warning When set to NO, you should pass nil to the selectedItem when you initialise the view controller.
 */
@property (nonatomic) BOOL selectionUpdatesIndicator;


/**
 Creates a MOOSelectableListViewController object with a list of items
 @param items An Array of NSDictionarys what contain a title key and a value key
 */
- (id)initWithItems:(NSArray *)items;

/**
 Creates a MOOSelectableListViewController object with a list of items and a didSelectItemBlock
 @param items An Array of NSDictionarys what contain a title key and a value key
 @param block A block that is called when the user selects a cell
 */
- (id)initWithItems:(NSArray *)items changedBlock:(didSelectItemBlock)block;

/**
 Creates a MOOSelectableListViewController object with a list of items, didSelectItemBlock and a pre-selected value
 @param items An Array of NSDictionarys what contain a title key and a value key
 @param block A block that is called when the user selects a cell
 @param selected An object that should already be selected when the view controller appears
 */
- (id)initWithItems:(NSArray *)items changedBlock:(didSelectItemBlock)block selectedItem:(id)selected;

/**
 Creates a MOOSelectableListViewController object with a list of items, didSelectItemBlock, pre-selected value and a custom cell subclass
 @param items An Array of NSDictionarys what contain a title key and a value key
 @param block A block that is called when the user selects a cell
 @param selected An object that should already be selected when the view controller appears
 @param cellClass A MOOSelectableListCell subclass to be used to provide customisation of the cells.
 */
- (id)initWithItems:(NSArray *)items changedBlock:(didSelectItemBlock)block selectedItem:(id)selected cellClass:(Class)cellClass;

/**
 Creates a MOOSelectableListViewController object with a list of items, didSelectItemBlock, pre-selected value, custom cell subclass and a custom UITableViewStyle
 @param items An Array of NSDictionarys what contain a title key and a value key
 @param block A block that is called when the user selects a cell
 @param selected An object that should already be selected when the view controller appears
 @param cellClass A MOOSelectableListCell subclass to be used to provide customisation of the cells.
 @param style Specify a custom UITableViewStyle for addtional customisation.
 */
- (id)initWithItems:(NSArray *)items changedBlock:(didSelectItemBlock)block selectedItem:(id)selected cellClass:(Class)cellClass tableViewStyle:(UITableViewStyle)style;

@end