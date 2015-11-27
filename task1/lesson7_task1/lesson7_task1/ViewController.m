//
//  ViewController.m
//  lesson7_task1
//
//  Created by Yuriy T on 27.11.15.
//  Copyright © 2015 Yuriy T. All rights reserved.
//

#import "ViewController.h"
#import "GalleryViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *imageCountLabel;
@property (weak, nonatomic) IBOutlet UIStepper *stepper;
@property (weak, nonatomic) IBOutlet UIButton *showButton;

@property(strong, nonatomic) NSMutableArray *picturesArray;
@property(assign, nonatomic) NSUInteger firstStepperValue;

-(void) addRandomPictureName;
-(NSString *) getRandomPictureName;
-(void) showCurrentPictureCount;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.picturesArray = [[NSMutableArray alloc] init];
    self.firstStepperValue = self.stepper.value;
    
    for (int i = 1; i <= self.stepper.value; i++) {
        [self addRandomPictureName];
    }
    
    [self showCurrentPictureCount];
    
    self.showButton.layer.borderWidth = 1.f;
    self.showButton.layer.cornerRadius = 10.f;
    self.showButton.layer.borderColor = [[UIColor blackColor] CGColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Custom methods

-(void) addRandomPictureName {
      
        [self.picturesArray addObject: [NSString stringWithFormat:@"%@", self.getRandomPictureName]];
}

-(NSString *) getRandomPictureName {
    NSUInteger pictureName = arc4random() % 14 + 1;
    
    return [NSString stringWithFormat:@"%lu", pictureName];
}

-(void) showCurrentPictureCount {
    self.imageCountLabel.text = [NSString stringWithFormat:@"%lu images", [self.picturesArray count]];
}

#pragma mark - Actions

- (IBAction)changePictureCountAtepper:(UIStepper *)sender {
    
    if (self.stepper.value > self.firstStepperValue) {
        self.firstStepperValue += 1;
        //  Plus pressed

        [self addRandomPictureName];
        
    } else {
        self.firstStepperValue -= 1;
        //  Minus pressed
        
        [self.picturesArray removeObject:[self.picturesArray lastObject]];
        
    }

    [self showCurrentPictureCount];
    self.stepper.value = [self.picturesArray count];

    NSLog(@"%@", self.picturesArray);
}

- (IBAction)showPictureButton:(UIButton *)sender {
    
    [self performSegueWithIdentifier:@"show_galery" sender:nil];
    
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"show_galery"]) {
        
        GalleryViewController *controller = segue.destinationViewController;
        controller.picturesArray = self.picturesArray;
        
    }
}

@end
