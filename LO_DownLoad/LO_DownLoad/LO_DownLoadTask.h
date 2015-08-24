//
//  LO_DownLoadTask.h
//  LO_DownLoad
//
//  Created by wjn on 15/8/21.
//  Copyright (c) 2015年 WJN. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LO_DownLoadTask : NSObject<NSURLSessionDownloadDelegate>

/**
 *  下载任务
 */
@property (strong, nonatomic)NSURLSessionDownloadTask *task;

/**
 *  创建下载任务的属性
 */
@property (strong, nonatomic)NSURLSession *session;

/**
 *  保存以完成的文件
 */
@property (strong, nonatomic)NSData *resumeData;

/**
 *  创建下载任务
 */

- (void)downloadTaskWithURL:(NSURL *)url;
/**
 *  暂停
 */
- (void)pasue;

/**
 *  继续下载
 */
- (void)resume;

@end
