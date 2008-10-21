//
//  FoodViewController.h
//  Food
//
//  Created by Samuel Goodwin on 10/21/08.
//  Copyright Goodwinlabs 2008. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FoodViewController : UIViewController {
	IBOutlet UITextField *subTotal;
	NSMutableArray *basket;
}

- (IBAction)addItem:(id)sender;
- (IBAction)checkout:(id)sender;
@property(nonatomic, retain) UITextField *subTotal;
@property(nonatomic, retain) NSMutableArray *basket;
@end