//
//  AppDelegate.m
//  UIImageUITabBarStyleSampleApplication
//
//  Created by Oliver Letterer on 24.09.11.
//  Copyright (c) 2011 Home. All rights reserved.
//

#import "AppDelegate.h"
#import "SampleViewController.h"

@implementation AppDelegate
@synthesize window=_window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    NSArray *viewControllers = [NSArray arrayWithObjects:
                                [[UINavigationController alloc] initWithRootViewController:[[SampleViewController alloc] init] ], 
                                [[UINavigationController alloc] initWithRootViewController:[[SampleViewController alloc] init] ], 
                                nil];
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    tabBarController.viewControllers = viewControllers;
    self.window.rootViewController = tabBarController;
    
    [self.window makeKeyAndVisible];
    return YES;
}

@end
