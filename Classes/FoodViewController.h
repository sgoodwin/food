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
	UITableView *theTableView;
}

- (IBAction)addItem:(id)sender;
- (IBAction)checkout:(id)sender;
- (void)addToBasket:(NSDictionary *)itemToAdd;
@property(nonatomic, retain) UITextField *subTotal;
@property(nonatomic, retain) NSMutableArray *basket;
@property(nonatomic, retain) IBOutlet UITableView *theTableView;
@end