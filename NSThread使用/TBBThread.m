//
//  TBBThread.m
//  NSThread使用
//
//  Created by YiGuo on 2017/10/18.
//  Copyright © 2017年 tbb. All rights reserved.
//

#import "TBBThread.h"

@implementation TBBThread
- (void)dealloc
{
    //当线程完成任务后线程释放
    NSLog(@"XMGThread -- dealloc");
}
@end
