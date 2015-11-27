//
//  GalleryViewController.h
//  lesson7_task1
//
//  Created by Yuriy T on 27.11.15.
//  Copyright © 2015 Yuriy T. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GalleryViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource>

@property(strong, nonatomic) NSMutableArray *picturesArray;

@end
