MOOSelectableList
=================

About
-----

``MOOSelectableListViewController`` is a ``UITableViewControler`` subclass that offers easy managment of selecting an item from within a specified list.

Basic Usage
-----------
A basic example can be be found below:

    
    //Build a list of dummy values, each item should be an NSDictionary with the values 'title' and 'value'
    NSMutableArray *items = [NSMutableArray new];
    for (int i = 0; i < 10; i ++)
        [items addObject:@{ @"title" : @"Item Title", @"value" : @(i) }];
    
    //initalise the view controller (using basic settings), see readme or header for more advanced options
    
    MOOSelectableListViewController *rootViewController = [[MOOSelectableListViewController alloc] initWithItems:items changedBlock:^(id title, id value) {
        
        NSLog(@"Selected item: %@ (%@)",title, value);
        
    }];
    
    [self presentViewController:rootViewController animated:YES completion:nil];

Items Array
-----------


The array of items passed to the view controller must contain `NSDictionary` objects what contain `title` and `value` keys. `title` should be a `NSString` and `value` can be any `NSObject` but it must be unique.

    
Advanced Usage
--------------


    - (id)initWithItems:(NSArray *)items changedBlock:(didSelectItemBlock)block selectedItem:(id)selected cellClass:(Class)cellClass tableViewStyle:(UITableViewStyle)style;

You can also specify the following information for more advanced usage:

- `UITableViewStyle` (defaults to `UITableViewStylePlain`)
- Custom `UITableViewCell` class (must be a subclass of `MOOSelectableListCell`)
- Default selected item, the item with a value what `isEqual:` to the selectedItem will be marked as selected


MOOSelectableListCell
---------------------

The `MOOSelectableListCell` is a basic subclass of `UITableViewCell` and subclassing it is very easy. 

Your custom subclass should implement the `updateCellWithTitle:value:selected:` method. This is called every time `tableView:cellForRowAtIndexPath:` is called.

the `selected` boolean is used to specify if the `[value isEqualTo:selectedValue]`.

selectionUpdatesIndicator
-------------------------


This property is used to specify if the `selectedValue` property should be updated. It is defaulted to `YES` but when set to `NO` the cells will not reload to display the selection, only the `didSelectItemBlock` will be called to indicate that an item has been selected.

If you specify a `selectedItem` then this property should be left set to `YES`. 


Support
-------

This has only been tested on iOS 6.1 but feel free to adapt for iOS 5 if it needs it.


License
-------

If it breaks, its your problem, its distributed without warranty and what not.. Feel free to tweak it and use it for whatever you want.





