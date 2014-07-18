//
//  CreateProductViewController.m
//  SimpleStore
//
//  Created by bipul on 7/16/14.
//  Copyright (c) 2014 bipul. All rights reserved.
//

#import "CreateProductViewController.h"
#import "JSONLoader.h"
#import "Product.h"
#import "DatabaseHandler.h"

@interface CreateProductViewController ()

@end

@implementation CreateProductViewController {
    NSArray *_products;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Create a new JSONLoader with a local file
    NSString *jsonFilePath = [[NSBundle mainBundle] pathForResource:@"products" ofType:@"json"];
    JSONLoader *jsonLoader = [[JSONLoader alloc] init];
    
    // Load the data on a background queue...
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        _products = [jsonLoader productsFromJSONFile:jsonFilePath];

    });
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)loadProductsFromFile:(UIButton *)sender {
    NSLog(@"products second time: %@", _products[0]);
    DatabaseHandler* dbHandler = [[DatabaseHandler alloc]init];
    NSString* dbMessage = [dbHandler createDb];
    [dbHandler insertProductsFromJSON:_products];
    NSLog(@"%@",dbMessage);
}
@end
