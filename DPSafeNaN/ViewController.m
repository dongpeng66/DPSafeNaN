//
//  ViewController.m
//  DPSafeNaN
//
//  Created by BJSTTLP185 on 2025/4/9.
//

#import "ViewController.h"
#import "UIView+NaNGuard.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIView *view =[[UIView alloc] init];
    CGFloat w = 2 / 0.0;
    view.frame = CGRectMake(0, 0, w, 2);
    [self.view addSubview:view];
    view.backgroundColor = [UIColor redColor];
    
    
    

}


@end
