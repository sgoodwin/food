//
//  FoodViewController.m
//  Food
//
//  Created by Samuel Goodwin on 10/21/08.
//  Copyright Goodwinlabs 2008. All rights reserved.
//

#import "FoodViewController.h"
#import "FoodAppDelegate.h"
#import "RootViewController.h"

@implementation FoodViewController
@synthesize subTotal, basket;

- (void)awakeFromNib
{
	NSLog(@"Food View Controller has awakened.");
}
/*
- (id)init
{
	self = [super init];
	basket = [[NSMutableArray alloc ] initWithCapacity:1];
	return self;
}

*/
// Override initWithNibName:bundle: to load the view using a nib file then perform additional customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
		basket = [[NSMutableArray alloc] initWithCapacity:1];
    }
    return self;
}

/*
// Implement loadView to create a view hierarchy programmatically.
- (void)loadView {
}
*/


/*
// Implement viewDidLoad to do additional setup after loading the view.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


- (void)dealloc {
    [super dealloc];
}

//Code for UITableView data source protocol:

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [basket count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	//FoodAppDelegate *delegate = (FoodAppDelegate *)[[UIApplication sharedApplication] delegate];
	static NSString *CellIdentifier = @"Cell";

	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (cell == nil) {
		cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
	}

	// Set up the cell
	//UIImage *displayImage = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[displayItem icon] ofType:@"png"]];
	//if(!testing){
	//	NSLog(@"Failed to load image.");
	//}
	//cell.image = displayImage;
	//NSLog(@"Index Path requested: %d", [indexPath indexAtPosition:1]);
	//NSLog(@"Categories contains this many: %d", [[delegate categories] count]);
	NSDictionary* item = [basket objectAtIndex:indexPath.row];
	cell.text = [item objectForKey:@"itemTitle"];
	return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	// Navigation logic -- create and push a new view controller
}

//Code for actions recieved by the controller:

- (IBAction)addItem:(id)sender{
	FoodAppDelegate *delegate = (FoodAppDelegate *)[[UIApplication sharedApplication] delegate];
	//Setup root menu controller and push it so that they can find a menu item.
	RootViewController *rootView = [[RootViewController alloc] initWithNibName:@"RootViewController" bundle:[NSBundle mainBundle]];
	NSArray *toplevelContent = [[delegate menu] objectForKey:@"itemChildren"];
	rootView.listContent = toplevelContent;

    // Push the detail view controller
    [[self navigationController] pushViewController:rootView animated:YES];
    [rootView release];
}
- (IBAction)checkout:(id)sender{
	NSLog(@"You been checked out.", _cmd);
}
@end
