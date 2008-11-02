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
	UITextView *nutrition;
	UIImageView *imageView;
	UILabel *thetitle;
}

- (IBAction)addItem:(id)sender;
- (IBAction)goBack:(id)sender;

@property (nonatomic, retain) NSDictionary *item;
@property (nonatomic, retain) IBOutlet UITextView *nutrition;
@property (nonatomic, retain) IBOutlet UIImageView *imageView;
@property (nonatomic, retain) IBOutlet UILabel *thetitle;
@end
