//
//  CBNHomePageNewsRequest.m
//  CBNWeeklyMagazine
//
//  Created by Jim on 16/7/1.
//  Copyright © 2016年 上海第一财经报业有限公司. All rights reserved.
//

#import "CBNHomePageNewsRequest.h"
#define URL_Key_Word @"GetIndexArticleList"

@implementation CBNHomePageNewsRequest
/*
 *  获取频道请求连接
 */
+ (NSString *)getHomePageNewsURL
{
    NSString *urlString = [NSString stringWithFormat:@"%@/%@/%@",sever_URL,Index,URL_Key_Word];
    
    return urlString;
}
/*
 *  获取频道请求参数
 */
+ (NSDictionary *)getHomePageNewsParameters
{
    NSString *secretStr = [NSString getTheMD5EncryptedStringWithString:[NSString stringWithFormat:@"%@%@",secret_key,URL_Key_Word]];
    
    NSMutableDictionary *parDic = [[NSMutableDictionary alloc] init];
    
    [parDic setObject:secretStr forKey:sever_key_Str];
    
    return parDic;
}
@end
