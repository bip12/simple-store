//
//  DatabaseHandler.h
//  SimpleStore
//
//  Created by bipul on 7/17/14.
//  Copyright (c) 2014 bipul. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "Product.h"
#import "ProductAvailableAtStore.h"

@interface DatabaseHandler : NSObject

@property (strong ,nonatomic) NSString *databasePath;
@property (nonatomic) sqlite3 *productDb;

- (void) insertProductData:(Product*)product;
- (NSString *) insertProductAvailableAtStoreData:(ProductAvailableAtStore*)stores;
- (NSString *)createDb;
//- (NSArray*) selectData:(Product*)ProductId;
//- (NSString *) updateData:(Product*)product;
//- (NSString *) deleteData:(NSString*)productId;
-(void)insertProductsFromJSON: (NSArray*)products;



@end
