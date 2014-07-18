//
//  DatabaseHandler.m
//  SimpleStore
//
//  Created by bipul on 7/17/14.
//  Copyright (c) 2014 bipul. All rights reserved.
//

#import "DatabaseHandler.h"
#import "Product.h"

@interface DatabaseHandler ()

@end

@implementation DatabaseHandler;

@synthesize databasePath;
@synthesize productDb;


-(NSString *)getDatabasePath {
    NSString *docsDir;
    NSArray *dirPaths;
    dirPaths = NSSearchPathForDirectoriesInDomains (NSDocumentDirectory, NSUserDomainMask, YES);
    docsDir = dirPaths[0];
    // path to the database
    databasePath = [[NSString alloc]initWithString: [docsDir stringByAppendingPathComponent:@"simpleStore.db"]];
    return databasePath;
}

-(NSString *)createDb {
    const char *sql_stmt1 =
    "CREATE TABLE IF NOT EXISTS Product (id INTEGER PRIMARY KEY, productName TEXT, description TEXT, regularPrice NUMERIC, salePrice NUMERIC, imageURL TEXT, color1 TEXT, color2 Text, storeListNumber TEXT)";
    const char *sql_stmt2 =
    "CREATE TABLE IF NOT EXISTS ProductAvailableAtStore (listId INTEGER PRIMARY KEY, productId NUMERIC, storeId NUMERIC, productYesOrNo NUMERIC)";
    
    // get the db path and set it.
    [self getDatabasePath];
    
    NSFileManager *filemgr = [NSFileManager defaultManager];
    
    
    if ([filemgr fileExistsAtPath:databasePath ] == NO)
    {
        const char *dbpath = [databasePath UTF8String];
        
        if (sqlite3_open(dbpath, &productDb) == SQLITE_OK)
        {
            char *errMsg;
            if (sqlite3_exec(productDb, sql_stmt1, NULL, NULL, &errMsg) != SQLITE_OK)
            {
                NSLog(@"create table - failed");
            }
            if (sqlite3_exec(productDb, sql_stmt2, NULL, NULL, &errMsg) != SQLITE_OK)
            {
                NSLog(@"create table - failed");
            }

            sqlite3_close(productDb);
        } else {
            NSLog(@"open or create db error");
        }
    }
    return @"database created successfully";
   }

- (NSString *) insertProductAvailableAtStoreData:(ProductAvailableAtStore*)stores {
    
    return @"successful data insertion";
}


-(void)insertProductsFromJSON:(NSArray* ) productsArray {
    //for (NSDictionary *dict in productsArray) {
        //instantiate objs
    //}
}

- (void) insertProductData:(Product*)product {
    
    [self getDatabasePath]; //set databasePath
    sqlite3_stmt  *statement;
    const char *dbpath = [databasePath UTF8String];
        
    if (sqlite3_open(dbpath, &productDb) == SQLITE_OK)
    {
        NSString *insertSQL = [NSString stringWithFormat:@"insert into Products (id, productName, description, regularPrice, salePrice, imageURL, color1, color2, storeListNumber) values (\"%@\",\"%@\",\"%@\",\"%@\", \"%@\", \"%@\", \"%@\", \"%@\", \"%@\")",product.productId, product.name, product.description, product.regularPrice, product.salePrice, product.imageLocation, product.color1, product.color2, product.storesListNumber];
            
        const char *insert_stmt = [insertSQL UTF8String];
        sqlite3_prepare_v2(productDb, insert_stmt,
                               -1, &statement, NULL);
        if (sqlite3_step(statement) == SQLITE_DONE)
        {
            NSLog(@"data entry is successful");
                
        } else {
                NSLog(@"data entry failed");
        }
        sqlite3_finalize(statement);
        sqlite3_close(productDb);
    }

}




@end
