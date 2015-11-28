//
//  Product.m
//  Lesson7_task2
//
//  Created by Yuriy T on 28.11.15.
//  Copyright © 2015 Yuriy T. All rights reserved.
//

#import "Product.h"

@implementation Product

- (instancetype) initWithTitle: (NSString *) title andBuyedType: (BOOL) buyed {
    self = [super init];
    if (self) {
        self.title = title;
        self.isBuyed = buyed;
    }
    
    return self;
}

@end
