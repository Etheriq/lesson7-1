//
//  GalleryViewController.m
//  lesson7_task1
//
//  Created by Yuriy T on 27.11.15.
//  Copyright © 2015 Yuriy T. All rights reserved.
//

#import "GalleryViewController.h"

@interface GalleryViewController ()

@property (weak, nonatomic) IBOutlet UIPageControl *pager;

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


@end
