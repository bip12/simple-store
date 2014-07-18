//
//  JSONLoader.h
//  SimpleStore
//
//  Created by bipul on 7/17/14.
//  Copyright (c) 2014 bipul. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSONLoader : NSObject

// Return an array of Product objects from the JSON file from the URL location
- (NSArray *)productsFromJSONFile:(NSString *)url;


@end
