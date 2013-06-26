//
//  AppDelegate.m
//  CustomerSystem
//
//  Created by wzg on 13-4-22.
//  Copyright (c) 2013年 denglei. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
//    PDDebugger *debugger = [PDDebugger defaultInstance];
//    
//    // Enable Network debugging, and automatically track network traffic that comes through any classes that NSURLConnectionDelegate methods.
//    [debugger enableNetworkTrafficDebugging];
//    [debugger forwardAllNetworkTraffic];
//    
//    // Enable Core Data debugging, and broadcast the main managed object context.
//    [debugger enableCoreDataDebugging];
//    //    [debugger addManagedObjectContext:self.managedObjectContext withName:@"Twitter Test MOC"];
//    
//    // Enable View Hierarchy debugging. This will swizzle UIView methods to monitor changes in the hierarchy
//    // Choose a few UIView key paths to display as attributes of the dom nodes
//    [debugger enableViewHierarchyDebugging];
//    [debugger setDisplayedViewAttributeKeyPaths:@[@"frame", @"hidden", @"alpha", @"opaque"]];
//    
//    // Connect to a specific host
//    [debugger connectToURL:[NSURL URLWithString:@"ws://localhost:9000/device"]];
//    // Or auto connect via bonjour discovery
//    //[debugger autoConnect];
//    // Or to a specific ponyd bonjour service
//    //[debugger autoConnectToBonjourServiceNamed:@"MY PONY"];
//    
//    // Enable remote logging to the DevTools Console via PDLog()/PDLogObjects().
//    [debugger enableRemoteLogging];
    
    // Override point for customization after application launch.
    
//    [Tool getSeachDateByYear:2013 quarter:2];
    //网络观察者
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reachabilityChanged:)name: kReachabilityChangedNotification object: nil];
    Reachability *hostReach = [Reachability reachabilityWithHostName:kCheckNetworkWebsite];
    [hostReach startNotifier];
    
    if (IS_Pad) {
        self.storyboard = [UIStoryboard storyboardWithName:@"Storyboard_iPad" bundle:nil];
    }else if (IS_IPHONE_5){
        self.storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone5" bundle:nil];
    }else{
        self.storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    }
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController =[self.storyboard instantiateInitialViewController];
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
    [self updateInterfaceWithReachability];
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


- (BOOL)isExistenceNetwork
{
	BOOL isExistenceNetwork;
	Reachability *r = [Reachability reachabilityWithHostName:kCheckNetworkWebsite];
    switch ([r currentReachabilityStatus]) {
        case NotReachable:
			isExistenceNetwork=FALSE;
            break;
        case ReachableViaWWAN:
			isExistenceNetwork=TRUE;
            break;
        case ReachableViaWiFi:
			isExistenceNetwork=TRUE;
            break;
    }
	return isExistenceNetwork;
}

- (void) updateInterfaceWithReachability
{
    //对连接改变做出响应的处理动作。
    if (![self isExistenceNetwork]) {  //没有连接到网络就弹出提实况
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"警告" message:@"网络未连接，请检查您的网络" delegate:self cancelButtonTitle:@"确认" otherButtonTitles:nil,nil];
		[alert show];
    }
    
}
@end
