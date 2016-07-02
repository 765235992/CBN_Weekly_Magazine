//
//  CBNHomePageNewsRequest.h
//  CBNWeeklyMagazine
//
//  Created by Jim on 16/7/1.
//  Copyright © 2016年 上海第一财经报业有限公司. All rights reserved.
//

#import "CBNBaseNetworkAction.h"

@interface CBNHomePageNewsRequest : CBNBaseNetworkAction
/*
 *  获取频道请求连接
 */
+ (NSString *)getHomePageNewsURL;
/*
 *  获取频道请求参数
 */
+ (NSDictionary *)getHomePageNewsParameters;
@end
