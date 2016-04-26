//
//  ViewController.m
//  NetRequest
//
//  Created by G.Z on 16/4/25.
//  Copyright © 2016年 GZ. All rights reserved.
//

#import "ViewController.h"
#import "BaseHttpClient.h"
#define URL @"http://10.0.8.8/sns/my/user_list.php"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //    self.view.backgroundColor = [UIColor lightGrayColor];
    //1.创建
    UIActivityIndicatorView *activity = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 80, 80)];
    
    //2.设置中心点
    activity.center = self.view.center;
    
    
    //3.设置样式
    activity.activityIndicatorViewStyle =
    UIActivityIndicatorViewStyleGray;
    
    
    
    [self.view addSubview:activity];
    
    [activity startAnimating];
    
    [BaseHttpClient httpType:GET andUrl:URL andParam:nil andSuccessBlock:^(NSURL *url, id data) {
        
        [activity stopAnimating];
        NSLog(@"%@",data);
        
    } andFailBlock:^(NSURL *url, NSError *error) {
        
        [activity stopAnimating];
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:error.localizedDescription preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            
            [alert dismissViewControllerAnimated:YES completion:nil];
        }];
        
        [alert addAction:action];
        
        [self presentViewController:alert animated:YES completion:nil];
        
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

