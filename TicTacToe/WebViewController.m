//
//  WebViewController.m
//  TicTacToe
//
//  Created by Jaehee Chung on 7/16/15.
//  Copyright (c) 2015 seanallen.co. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *myWebView;

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.myWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://en.wikipedia.org/wiki/Tic-tac-toe"]]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
