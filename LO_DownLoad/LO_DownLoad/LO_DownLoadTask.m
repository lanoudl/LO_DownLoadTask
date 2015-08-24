//
//  LO_DownLoadTask.m
//  LO_DownLoad
//
//  Created by wjn on 15/8/21.
//  Copyright (c) 2015年 WJN. All rights reserved.
//

#import "LO_DownLoadTask.h"

@implementation LO_DownLoadTask

- (void)downloadTaskWithURL:(NSURL *)url {
    
    self.task = [self.session downloadTaskWithURL:url];
//    开始下载任务
    [self.task resume];
}

/**
 *  暂停
 */

- (void)pasue {
    NSLog(@"暂停任务");
    
    __weak typeof(self) one = self;
    [self.task cancelByProducingResumeData:^(NSData *resumeData) {
        one.resumeData = resumeData;
    }];
}

/**
 *  继续下载
 */

- (void)resume {
    NSLog(@"继续下载");
    self.task = [self.session downloadTaskWithResumeData:self.resumeData];
    [self.task resume];
}

- (NSURLSession *)session {
    
    if (!_session) {
        
        NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        self.session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    }
    return _session;
}

#pragma mark - NSURLSesssionDownLoadDelegate

/**
 *  下载完成
 */

- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location {
    NSLog(@"文件下载完成");
}

/**
 *  正在下载
 */

- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didWriteData:(int64_t)bytesWritten totalBytesWritten:(int64_t)totalBytesWritten totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite {
    NSLog(@"%f", (float)totalBytesWritten / totalBytesExpectedToWrite);
}

@end
