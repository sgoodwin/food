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
@synthesize subTotal, basket, theTableView, subTotalBox, startTouchPosition, removeButton;

- (void)addToBasket:(NSDictionary *)itemToAdd{
	[basket addObject:itemToAdd];
	[self subtotal];
	[theTableView reloadData];
	[[self view] setNeedsDisplay];
}

- (void)emptyBasket{
	[basket removeAllObjects];
	[self subtotal];
	[theTableView reloadData];
	[[self view] setNeedsDisplay];
}

- (void)subtotal
{
	NSDecimalNumber *sub = [NSDecimalNumber zero];
	for(NSDictionary *item in basket){
		NSDecimalNumber *add = [[NSDecimalNumber alloc] initWithString:[item objectForKey:@"price"]];
		sub = [sub decimalNumberByAdding:add];
		[add release];
	}
	NSString *total = [[NSString alloc] initWithFormat:@"$%1.2f", [sub doubleValue]];
	subTotalBox.text = total;
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

#define NAME_TAG 1
#define PRICE_TAG 2
#define IMAGE_TAG 3



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//	//FoodAppDelegate *delegate = (FoodAppDelegate *)[[UIApplication sharedApplication] delegate];
//	static NSString *CellIdentifier = @"Cell";
//
//	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//	if (cell == nil) {
//		cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
//	}
//
//	// Set up the cell
//	//UIImage *displayImage = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:[displayItem icon] ofType:@"png"]];
//	//if(!testing){
//	//	NSLog(@"Failed to load image.");
//	//}
//	//cell.image = displayImage;
//	//NSLog(@"Index Path requested: %d", [indexPath indexAtPosition:1]);
//	//NSLog(@"Categories contains this many: %d", [[delegate categories] count]);
//	NSDictionary* item = [basket objectAtIndex:indexPath.row];
//	cell.text = [item objectForKey:@"itemTitle"];
//	return cell;

	static NSString *CellIdentifier = @"FoodCell";

	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

	if (cell == nil) {
		cell = [self tableviewCellWithReuseIdentifier:CellIdentifier];
	}

	[self configureCell:cell forIndexPath:indexPath];
	return cell;


}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[tableView deselectRowAtIndexPath:indexPath animated:NO]; 
}



- (UITableViewCell *)tableviewCellWithReuseIdentifier:(NSString *)identifier {

	/*
	Create an instance of UITableViewCell and add tagged subviews for the name, price, and image.
	*/
		CGRect rect;

	#define ROW_HEIGHT 44
	rect = CGRectMake(0.0, 0.0, 320.0, ROW_HEIGHT);

	UITableViewCell *cell = [[[UITableViewCell alloc] initWithFrame:rect reuseIdentifier:identifier] autorelease];

	#define LEFT_COLUMN_OFFSET 10.0
	#define LEFT_COLUMN_WIDTH 30.0

	#define MIDDLE_COLUMN_OFFSET 50.0
	#define MIDDLE_COLUMN_WIDTH 215.0

	#define RIGHT_COLUMN_OFFSET 265.0
	#define RIGHT_COLUMN_WIDTH 50.0

	#define MAIN_FONT_SIZE 18.0
	#define PRICE_FONT_SIZE 14.0
	#define LABEL_HEIGHT 26.0


	// Create an image view for the quarter image
	rect = CGRectMake(LEFT_COLUMN_OFFSET, (ROW_HEIGHT - LEFT_COLUMN_WIDTH) / 2.0, LEFT_COLUMN_WIDTH, LEFT_COLUMN_WIDTH);
	UIImageView *imageView = [[UIImageView alloc] initWithFrame:rect];
	imageView.tag = IMAGE_TAG;
	[cell.contentView addSubview:imageView];
	[imageView release];


	/*
	Create labels for the text fields; set the highlight color so that when the cell is selected it changes appropriately.
	*/
		UILabel *label;
	rect = CGRectMake(MIDDLE_COLUMN_OFFSET, (ROW_HEIGHT - LABEL_HEIGHT) / 2.0, MIDDLE_COLUMN_WIDTH, LABEL_HEIGHT);
	label = [[UILabel alloc] initWithFrame:rect];
	label.tag = NAME_TAG;
	label.font = [UIFont boldSystemFontOfSize:MAIN_FONT_SIZE];
	label.adjustsFontSizeToFitWidth = YES;
	[cell.contentView addSubview:label];
	label.highlightedTextColor = [UIColor whiteColor];
	[label release];


	rect = CGRectMake(RIGHT_COLUMN_OFFSET, (ROW_HEIGHT - LABEL_HEIGHT) / 2.0, RIGHT_COLUMN_WIDTH, LABEL_HEIGHT);
	label = [[UILabel alloc] initWithFrame:rect];
	label.tag = PRICE_TAG;
	label.font = [UIFont systemFontOfSize:PRICE_FONT_SIZE];
	label.adjustsFontSizeToFitWidth = YES;
	label.textAlignment = UITextAlignmentRight;
	[cell.contentView addSubview:label];
	label.highlightedTextColor = [UIColor whiteColor];
	[label release];




	return cell;
}


- (void)configureCell:(UITableViewCell *)cell forIndexPath:(NSIndexPath *)indexPath {

	NSDictionary* item = [basket objectAtIndex:indexPath.row];

	UILabel *label;

	// Get the name
	label = (UILabel *)[cell viewWithTag:NAME_TAG];
	label.text = [item objectForKey:@"itemTitle"];

	// Get the price
	label = (UILabel *)[cell viewWithTag:PRICE_TAG];
	label.text = [[NSString alloc] initWithFormat:@"$%1.2f", [[item objectForKey:@"price"] doubleValue]];

	// Get the image
	UIImageView *imageView = (UIImageView *)[cell viewWithTag:IMAGE_TAG];
//	imageView.image = [UIImage imageNamed:@"cone.jpg"];

	imageView.image = [UIImage imageNamed:[item objectForKey:@"image"]];

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

- (IBAction)removeItem:(id)sender
{
	NSLog(@"%s Enabling editing", _cmd);
	NSLog(@"%@",  removeButton);
	if(theTableView.editing == YES){
		[removeButton setTitle:@"Remove Item" forState:UIControlStateNormal];
		[theTableView setEditing:NO animated:YES];
	}
	else {
		[removeButton setTitle:@"Done" forState:UIControlStateNormal];
		[theTableView setEditing:YES animated:YES];
	}
	
}

- (IBAction)checkout:(id)sender{
	//present alert
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Order Placed" message:@"Your order will be ready in 1 minute."
		delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
	//Build a URL Request of the ordered items to Matt can show it.
	NSString *post = @"item=";
	for(NSDictionary *item in basket){
		post = [post stringByAppendingString:[item objectForKey:@"itemTitle"]];
		post = [post stringByAppendingString:@","];
	}
	NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
	NSString *postLength = [NSString stringWithFormat:@"%d", [postData length]];

	NSMutableURLRequest *request = [[[NSMutableURLRequest alloc] init] autorelease];
	[request setURL:[NSURL URLWithString:@"http://dlzip.com/food/order.php"]];
	[request setHTTPMethod:@"POST"];
	[request setValue:postLength forHTTPHeaderField:@"Content-Length"];
	[request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
	[request setHTTPBody:postData];

	NSURLConnection *connectionResponse = [[NSURLConnection alloc] initWithRequest:request delegate:self];
	if (!connectionResponse) {
		NSLog(@"Failed to submit request");
	} else {
		NSLog(@"Request submitted");
	}
	
	NSLog(@"post = %@", post);
	[alert show];	
	[alert release];

	//clear list
	[self emptyBasket];
}

//Code to handle removing objects from the table:

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
	//Actuallly remove
	if(UITableViewCellEditingStyleDelete == editingStyle){
		[basket removeObjectAtIndex:indexPath.row];
	}
	[self subtotal];
	[theTableView reloadData];
	[[self view] setNeedsDisplay];
}

@end
