//
//  GalleryViewController.m
//  lesson7_task1
//
//  Created by Yuriy T on 27.11.15.
//  Copyright © 2015 Yuriy T. All rights reserved.
//

#import "GalleryViewController.h"
#import "CustomImageCollectionViewCell.h"

@interface GalleryViewController ()

@property (weak, nonatomic) IBOutlet UIPageControl *pager;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionview;

@end

@implementation GalleryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    NSLog(@"in Game VC now %@", self.picturesArray);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CustomImageCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"img" forIndexPath:indexPath];
    
    NSString *imageName = [self.picturesArray objectAtIndex:indexPath.row];
    cell.image.image = [UIImage imageNamed:imageName];
    
    return cell;
}

-(NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return [self.picturesArray count];
}


@end
