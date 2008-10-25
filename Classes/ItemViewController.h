//
//  ItemViewController.h
//  Food
//
//  Created by Samuel Goodwin on 10/25/08.
//  Copyright 2008 Goodwinlabs. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ItemViewController : UIViewController {
	NSArray *listContent;
}

- (IBAction)goBack:(id)sender;
@property(nonatomic, retain) NSArray *listContent;
@end
