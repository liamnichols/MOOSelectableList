//
//  LNAppDelegate.m
//  SelectableListDemo
//
//  Created by Liam Nichols on 01/07/2013.
//  Copyright (c) 2013 Liam Nichols. All rights reserved.
//

#import "LNAppDelegate.h"
#import "MOOSelectableListViewController.h"

@implementation LNAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    //Build a list of dummy values, each item should be an NSDictionary with the values 'title' and 'value'
    NSMutableArray *items = [NSMutableArray new];
    for (int i = 0; i < 10; i ++)
        [items addObject:@{ @"title" : @"Item Title", @"value" : @(i) }];
    
    //initalise the view controller (using basic settings), see readme or header for more advanced options
    MOOSelectableListViewController *rootViewController = [[MOOSelectableListViewController alloc] initWithItems:items changedBlock:^(id title, id value) {
        
        NSLog(@"Selected item: %@ (%@)",title, value);
        
    }];
    
    //updates the interface when an item is selected (if set to NO, you can tap the currently "selected" value again if needed)
    rootViewController.selectionUpdatesIndicator = YES; //defaults to yes
    
    self.window.rootViewController = rootViewController;
    
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
