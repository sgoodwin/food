//
//  RootViewController.h
//  OrderFood
//
//  Created by Samuel "Artoo" Goodwin on 10/11/08.
//  Copyright Goodwinlabs 2008. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UITableViewController {
	NSArray *listContent;
}

@property(nonatomic, retain) NSArray *listContent;
@end