//
//  ProductAvailableAtStore.h
//  SimpleStore
//
//  Created by bipul on 7/17/14.
//  Copyright (c) 2014 bipul. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ProductAvailableAtStore : NSObject

@property (nonatomic) NSNumber *listId; // This is the PK on the RDB table
@property (nonatomic) NSNumber *productId; // This is the FK to Product table
@property (nonatomic) NSNumber *storeId; // This is the FK to Store table (not created for this test)
@property (nonatomic) NSNumber *productYesOrNo; //product available or not

@end
