//
//  ViewController.m
//  LO_DownLoad
//
//  Created by wjn on 15/8/21.
//  Copyright (c) 2015年 WJN. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)startButtonDidPress:(id)sender {
    
    /**
     *  当不存在下载的时候创建下载任务
     *  存在的时候继续下载
     */
    if (self.download) {
        
        [self.download resume];
    } else {
        
        self.download = [[LO_DownLoadTask alloc] init];
        [self.download downloadTaskWithURL:[NSURL URLWithString:@"http://61.155.212.122/hc.yinyuetai.com/uploads/videos/common/5B86014C1334A89EB08B30D386FAA9C1.flv?sc=1c7a66a8a8bf0612&br=783&rd=iOS"]];
    }
    
    
}

- (IBAction)pasueButtonDidPress:(id)sender {
    
    if (self.download) {
//        调用暂停任务
        [self.download pasue];
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
