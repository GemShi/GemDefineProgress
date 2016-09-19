//
//  ViewController.m
//  GemDefineProgress
//
//  Created by GemShi on 16/8/18.
//  Copyright © 2016年 GemShi. All rights reserved.
//

#import "ViewController.h"
#import "GemProgressView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property(nonatomic,strong)GemProgressView *gpView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.gpView = [[GemProgressView alloc]initWithFrame:CGRectMake(60, 60, 200, 200)];
    self.gpView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:self.gpView];
    
}

- (IBAction)slideChange:(id)sender
{
    self.gpView.progress = self.slider.value;
}

@end
