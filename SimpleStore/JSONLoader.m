//
//  JSONLoader.m
//  SimpleStore
//
//  Created by bipul on 7/17/14.
//  Copyright (c) 2014 bipul. All rights reserved.
//

#import "JSONLoader.h"

#define bgQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)

@implementation JSONLoader

- (NSArray *)productsFromJSONFile:(NSString *)filePath {
    NSError* error = nil;
    NSData *parseData = [[NSData alloc] initWithData:[NSData dataWithContentsOfFile:filePath]];
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:parseData options:NSJSONReadingAllowFragments  error:&error];
    NSArray *products = [[NSArray alloc] initWithArray:[jsonDictionary objectForKey:@"Products"]];
    NSLog(@"url: %@", filePath);
    return products;
}


@end
