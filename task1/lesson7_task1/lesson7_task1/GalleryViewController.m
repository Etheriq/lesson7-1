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
@property (assign, nonatomic) int currentIndex;

@end

@implementation GalleryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.pager.numberOfPages = [self.picturesArray count];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CustomImageCollectionViewCell *cell = (CustomImageCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"img" forIndexPath:indexPath];
    NSString *imageName = [self.picturesArray objectAtIndex:indexPath.row];
//    
//    UIImage *image = [UIImage imageNamed:imageName];
//    [cell.image setContentMode:UIViewContentModeScaleAspectFit];
//    [cell.image setImage:image];
    
    cell.image.image = [UIImage imageNamed:imageName];
    
    return cell;
}

#pragma mark - UICollectionViewDelegateFlowLayout

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(self.collectionview.frame.size.width, self.collectionview.frame.size.height);
}

-(UIEdgeInsets) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    
    return UIEdgeInsetsMake(5.f, 5.f, 5.f, 5.f);
//    return UIEdgeInsetsMake(0, 0, 0, 0);
}

#pragma mark - UICollectionViewDataSource

-(NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return [self.picturesArray count];
}

#pragma mark - UICollectionViewDelegate

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    self.pager.currentPage = [[[self.collectionview indexPathsForVisibleItems] firstObject] row];
}

-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    
    *targetContentOffset = scrollView.contentOffset; // set acceleration to 0.0
    float pageWidth = (float)self.collectionview.bounds.size.width;
    int minSpace = 10;
    
    int cellToSwipe = (scrollView.contentOffset.x)/(pageWidth + minSpace) + 0.5; // cell width + min spacing for lines
    if (cellToSwipe < 0) {
        cellToSwipe = 0;
    } else if (cellToSwipe >= self.picturesArray.count) {
        cellToSwipe = (int)self.picturesArray.count - 1;
    }
    [self.collectionview scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:cellToSwipe inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
}

#pragma mark - Rotation

-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    [self.collectionview setAlpha:0.0f];
    
    [self.collectionview.collectionViewLayout invalidateLayout];
    
    CGPoint currentOffset = [self.collectionview contentOffset];
    self.currentIndex = currentOffset.x / self.collectionview.frame.size.width;
}

-(void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:self.currentIndex inSection:0];
    
    [self.collectionview scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
    
    [UIView animateWithDuration:0.3f animations:^{
        [self.collectionview setAlpha:1.0f];
    }];
}

@end
