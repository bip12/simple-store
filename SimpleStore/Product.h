//
//  Product.h
//  SimpleStore
//
//  Created by bipul on 7/16/14.
//  Copyright (c) 2014 bipul. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Product : NSObject


@property (nonatomic) NSNumber *productId;
@property (nonatomic) NSString *name;
@property (nonatomic) NSString *description;
@property (nonatomic) NSNumber *regularPrice;
@property (nonatomic) NSNumber *salePrice;
@property (nonatomic) NSString *imageLocation;

/**
 In this test, I will add just two colors and not create separate table for colorList
*/
@property (nonatomic) NSString *color1;
@property (nonatomic) NSString *color2;

/**
 It will be the FK to ProductAvailableAtStore Table
 */ 
@property (nonatomic) NSNumber *storesListNumber;


@end
