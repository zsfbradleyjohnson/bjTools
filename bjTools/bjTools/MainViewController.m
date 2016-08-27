//
//  MainViewController.m
//  bjTools
//
//  Created by bradleyjohnson on 16/8/27.
//  Copyright © 2016年 bradleyjohnson. All rights reserved.
//

#import "MainViewController.h"
#import "bjTools/bjTools.h"

@interface MainViewController ()

@property (nonatomic , strong) UIButton * validationButton;

@end

@implementation MainViewController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBarHidden = YES;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    
    [self.view addSubview:self.validationButton];
    
}




#pragma mark - private method

-(void)validation
{
//    NSLog(@"%@",[bjFoundation isString:@"da" inString:@"cdfda"]?@"YES":@"NO");
//    NSLog(@"%@",[bjFoundation isStringIncludeSpace:@"avs "]?@"YES":@"NO");
//    NSLog(@"%@",[bjFoundation isStringIncludeChinese:@"asdfasdf深asd"]?@"YES":@"NO");
    NSLog(@"%@",[bjFoundation isStringPureNumber:@"133"]?@"YES":@"NO");

}






#pragma mark - initializes attributes

-(UIButton *)validationButton
{
    if (!_validationButton) {
        _validationButton = [[UIButton alloc] init];
        _validationButton.bounds = CGRectMake(0, 0, 200, 50);
        _validationButton.center = CGPointMake(self.view.center.x, 50);
        _validationButton.layer.masksToBounds = YES;
        _validationButton.layer.cornerRadius = 5.0f;
        _validationButton.backgroundColor = [UIColor orangeColor];
        [_validationButton setTitle:@"验 证" forState:UIControlStateNormal];
        [_validationButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_validationButton setTitleColor:[UIColor grayColor]  forState:UIControlStateHighlighted];
        [_validationButton addTarget:self action:@selector(validation) forControlEvents:UIControlEventTouchUpInside];
    }
    return _validationButton;
}

@end