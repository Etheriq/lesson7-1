//
//  Product.h
//  Lesson7_task2
//
//  Created by Yuriy T on 28.11.15.
//  Copyright © 2015 Yuriy T. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Product : NSObject

@property(strong, nonatomic) NSString *title;
@property(assign, nonatomic) BOOL isBuyed;

-(Product*) initWithTitle: (NSString *) title andBuyedType: (BOOL) buyed;

@end
