//
//  PurchasesTableViewController.m
//  Lesson7_task2
//
//  Created by Yuriy T on 28.11.15.
//  Copyright © 2015 Yuriy T. All rights reserved.
//

#import "PurchasesTableViewController.h"
#import "Product.h"

@interface PurchasesTableViewController () <UIAlertViewDelegate>

@property(strong, nonatomic) NSMutableArray *purchases;

@end

@implementation PurchasesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.purchases = [[NSMutableArray alloc] init];
    
    [self.purchases addObject:[self getNewProduct:@"Milk" withBuyedParam:NO]];
    [self.purchases addObject:[self getNewProduct:@"Cheese" withBuyedParam:NO]];
    [self.purchases addObject:[self getNewProduct:@"Fish" withBuyedParam:YES]];
    
     self.navigationItem.leftBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Product

-(Product *) getNewProduct: (NSString *) title withBuyedParam: (BOOL) buyed  {
    Product *product = [[Product alloc] initWithTitle:title andBuyedType:buyed];
    
    return product;
}

#pragma mark - Actions

- (IBAction)addNewProduct:(UIBarButtonItem *)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Adding new product" message:@"Enter product title" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Add", nil];
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    [alert show];
}

#pragma mark - UIAlertViewDelegate

// Called when a button is clicked. The view will be automatically dismissed after this call returns
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 1) {
        UITextField *title = [alertView textFieldAtIndex:0];
        [self.purchases addObject:[self getNewProduct:title.text withBuyedParam:NO]];
        [self.tableView reloadData];
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [self.purchases count];
}

- (void)tableView:(UITableView *)tableView didHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    Product *product = [self.purchases objectAtIndex:indexPath.row];
    product.isBuyed = !product.isBuyed;
    [tableView reloadData];
    
    NSLog(@"taped at %ld, title = %@", (long)indexPath.row, product.title);
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    Product *product = [self.purchases objectAtIndex:indexPath.row];
    
    cell.textLabel.text = product.title;
    
    if (product.isBuyed) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    
    return YES;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [self.purchases removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

@end
