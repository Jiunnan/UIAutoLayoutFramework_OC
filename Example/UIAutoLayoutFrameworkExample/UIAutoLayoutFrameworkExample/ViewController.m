//
//  ViewController.m
//  UIAutoLayoutFrameworkExample
//
//  Created by 林俊男 on 2021/09/14.
//

#import "ViewController.h"
#import <UIAutoLayoutFramework_OC/UIAutoLayoutFramework_OC.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIAutoLayout *testAL = [[UIAutoLayout alloc]init];
    [testAL printLog];
    // Do any additional setup after loading the view.
}


@end
