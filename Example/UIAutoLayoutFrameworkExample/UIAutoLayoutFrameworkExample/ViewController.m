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
    
    NSString *autoLayoutVersion = UIAutoLayout.callVersion;
    NSLog(@"Framework version: %@", autoLayoutVersion);
    
    NSLog(@"Screen width: %f  height: %f", kscreenWidth, kscreenHeight);
    
    [self.view adaptScreenWidthType:BSAdaptScreenWidthTypeAll exceptViews:nil];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    NSLog(@"testLbl textSize: %f", self.testLbl.font.pointSize);
}

@end
