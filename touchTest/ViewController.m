//
//  ViewController.m
//  touchTest
//
//  Created by kyasu on 2015/09/26.
//  Copyright © 2015年 kyasu. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _photo.alpha = 0.0;

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(applicationDidBecomeActive)
                                                 name:UIApplicationDidBecomeActiveNotification
                                               object:nil];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)applicationDidBecomeActive
{
    AppDelegate *applicationDelegate = [[UIApplication sharedApplication] delegate];
    if (applicationDelegate.kind == 0) {
        _photo.image = [UIImage imageNamed:@"chara.jpg"];
    } else {
        _photo.image = [UIImage imageNamed:@"rebi.jpg"];
    }
    
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [[event allTouches] anyObject];
    double force = touch.force;
    double max = touch.maximumPossibleForce;
    double level = 0;
    if (max != 0 ) level = force/max;
    NSLog(@"touchesMoved Max:%f Force:%f level:%f",max,force,level);
    
    if (level < 0.3) {
        level = 0.0;
    }
    _photo.alpha = level;

}

@end
