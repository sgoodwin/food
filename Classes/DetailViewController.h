//
//  DetailViewController.h
//  Food
//
//  Created by Samuel Goodwin on 10/25/08.
//  Copyright 2008 Goodwinlabs. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DetailViewController : UIViewController {
	NSDictionary *item;
}

- (IBAction)addItem:(id)sender;
- (IBAction)goBack:(id)sender;

@property (nonatomic, retain) NSDictionary *item;
@end
