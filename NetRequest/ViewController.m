//
//  ViewController.m
//  NetRequest
//
//  Created by G.Z on 16/4/25.
//  Copyright © 2016年 GZ. All rights reserved.
//

#import "ViewController.h"
#import "BaseHttpClient.h"
#import "NSString+URLEncoding.h"
//#define PATH @"http://123.56.189.59/englishStudy/queryMoviesbyName?"
#define PATH @"http://123.56.189.59/englishStudy/queryMoviesbyName?info=%7B%22movieName%22:%22%E7%9A%84%22%7D%20"
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
    activity.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    
    [self.view addSubview:activity];
    
    [activity startAnimating];
    
//    NSDictionary *info = [[NSMutableDictionary alloc] init];
//    
//    [info setValue:@"的" forKey:@"movieName"];
    
    
    //http://123.56.189.59/englishStudy/queryMoviesbyName?info={"movieName":"的"}
    NSString *URL = @"http://123.56.189.59/englishStudy/queryMoviesbyName?info={\"movieName\":\"的\"}";//-->\解决双引号引用问题
    NSString * encodedString = CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(NULL, (CFStringRef)URL, NULL, (CFStringRef)@"'\'", kCFStringEncodingUTF8));
    NSString *str = [NSString stringWithContentsOfURL:[NSURL URLWithString:encodedString] encoding:NSUTF8StringEncoding error:nil];
    NSLog(@"%@",str);

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

