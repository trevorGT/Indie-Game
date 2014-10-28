//
//  SendMsgToWeChatViewController.h
//  ApiClient
//
//  Created by Tencent on 12-2-27.
//  Copyright (c) 2012年 Tencent. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WXApiObject.h"
#import "WXApi.h"


@interface SendMsgToWeChatViewController : NSObject
{

}

+ (void) sendImageContent:(NSString *)url;
+ (void) copyPasteboard:(NSString *)text;
+ (UIImage *) getImage: (UIImage *) image centerInSize: (CGSize) viewsize;
+(UIImage *)compressImageWith:(UIImage *)image width:(float)width height:(float)height;
@end
