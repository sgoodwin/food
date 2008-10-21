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
@synthesize navigationController;

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
	FoodViewController *mainMenu = [[FoodViewController alloc] initWithNibName:@"FoodViewController" bundle:[NSBundle mainBundle]];
	self.viewController = mainMenu;
	UINavigationController *navigation = [[UINavigationController alloc] initWithRootViewController:mainMenu];
	if(!navigation){
		NSLog(@"Failed to create navigation controller.");
	}
	self.navigationController = navigation;
	// Override point for customization after app launch 
	[navigationController setNavigationBarHidden:YES animated:NO];
	[window addSubview:[self.navigationController view]];
	[window makeKeyAndVisible];
	
	[navigation release];
	[mainMenu release];
}


- (void)dealloc {
	[viewController release];
	[window release];
	[super dealloc];
}


@end
