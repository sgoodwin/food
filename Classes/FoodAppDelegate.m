//
//  FoodAppDelegate.m
//  Food
//
//  Created by Samuel Goodwin on 10/21/08.
//  Copyright Goodwinlabs 2008. All rights reserved.
//

#import "FoodAppDelegate.h"
#import "FoodViewController.h"

@implementation FoodAppDelegate

@synthesize window;
@synthesize viewController;
@synthesize menu;

- (id)init
{
	self = [super init];
	if(self)
	{
		NSString *path = [[NSBundle mainBundle] bundlePath];
		NSString *finalPath = [path stringByAppendingPathComponent:@"menu.plist"];
		menu = [[NSDictionary dictionaryWithContentsOfFile:finalPath] retain];
	}
	return self;
}

- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
