//
//  AppDelegate.m
//  xszsfinal
//
//  Created by 张思琪 on 16/7/27.
//  Copyright © 2016年 张思齐. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeViewController.h"
#import "SchoolViewController.h"
#import "MineViewController.h"
#import "AppConstant.h"
#import "MsgConstant.h"

#import <JSPatch/JSPatch.h>
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [NSThread sleepForTimeInterval:1.0];//设置启动页面时间
//    [JSPatch startWithAppKey:@"d4d5a251fa18ac67"];
//    [JSPatch sync];
//    [JSPatch testScriptInBundle];
    
    HomeViewController * root1=[[HomeViewController alloc]init];
    UINavigationController *home=[[UINavigationController alloc]initWithRootViewController:root1];
    SchoolViewController *root2=[[SchoolViewController alloc]init];
    UINavigationController * school=[[UINavigationController alloc]initWithRootViewController:root2];
    MineViewController *root3=[[MineViewController alloc]init];
    UINavigationController * mine=[[UINavigationController alloc]initWithRootViewController: root3];
    UITabBarController *viewcontroller=[[UITabBarController alloc]init];
    viewcontroller.viewControllers=@[home,school,mine];
    UITabBarItem *homeTabBarItem=[viewcontroller.tabBar.items objectAtIndex:0];
    UITabBarItem *schoolTabBarItem=[viewcontroller.tabBar.items objectAtIndex:1];
    UITabBarItem *mineTabBarItem=[viewcontroller.tabBar.items objectAtIndex:2];
    homeTabBarItem.title=@"生活";
    schoolTabBarItem.title=@"校园";
    mineTabBarItem.title=@"我的";
    UIImage * img1 = [UIImage imageNamed:@"img_bottom_life_normal"];
    UIImage *img1HL = [UIImage imageNamed:@"img_bottom_life_pressed"];
    UIImage * img2 = [UIImage imageNamed:@"img_bottom_school_normal"];
    UIImage *img2HL = [UIImage imageNamed:@"img_bottom_school_pressed"];
    UIImage * img3 = [UIImage imageNamed:@"img_bottom_mine_normal"];
    UIImage *img3HL = [UIImage imageNamed:@"img_bottom_mine_pressed"];
    img1 = [img1 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    img1HL = [img1HL imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    img2 = [img2 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    img2HL = [img2HL imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    img3 = [img3 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    img3HL = [img3HL imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    homeTabBarItem = [homeTabBarItem initWithTitle:@"生活" image:img1 selectedImage:img1HL];
    schoolTabBarItem = [schoolTabBarItem initWithTitle:@" 校园" image:img2 selectedImage:img2HL];
    mineTabBarItem = [mineTabBarItem initWithTitle:@"我的" image:img3 selectedImage:img3HL];
    

    [[UINavigationBar appearance] setBarTintColor:UIColorFromHEX(ColorCommonGreen)];
    [[UINavigationBar appearance] setTintColor:UIColorFromHEX(kCommonNavigationTintColor)];
    
    self.window.rootViewController=viewcontroller;

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}

#pragma mark - Core Data stack

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "Zhang.xszsfinal" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"xszsfinal" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and returns a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"xszsfinal.sqlite"];
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

@end
