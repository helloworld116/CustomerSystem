//
//  Tool.m
//  CustomerSystem
//
//  Created by wzg on 13-4-22.
//  Copyright (c) 2013年 denglei. All rights reserved.
//

#import "Tool.h"

@implementation Tool

+ (void)cancelRequest:(ASIHTTPRequest *)request
{
    if (request != nil) {
        [request cancel];
        [request clearDelegatesAndCancel];
    }
}

+(NSString *)timeIntervalToString:(NSTimeInterval)interval dateformat:(NSString *)dateformat{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:dateformat];
    return [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:interval]];
}

+ (NSString *)secondsToHour:(long) second{
    return [NSString stringWithFormat:@"%.1f小时",second/3600.0];
}

//2013第一季度得到起止日期
+ (SearchDate *)getSeachDateByYear:(NSUInteger)year quarter:(NSUInteger)quarter
{
    SearchDate *searchDate = [[SearchDate alloc] initWithBeginDate:@"" endDate:@""];
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    [comps setYear:year];
    [comps setQuarter:quarter];
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
    NSDate *date = [gregorian dateFromComponents:comps];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSLog(@"Date%@", [dateFormatter stringFromDate:date]);
    return searchDate;
}

//2013年起止日期

+ (SearchDate *)getSeachDateByYear:(NSUInteger)year
{
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    [comps setYear:year];
    SearchDate *searchDate = [[SearchDate alloc] initWithBeginDate:@"" endDate:@""];
    return searchDate;
}


+ (NSDictionary *)stringToDictionary:(NSString *)str{
    NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
    __autoreleasing NSError* error = nil;
    id result = [NSJSONSerialization JSONObjectWithData:data
                                                options:kNilOptions error:&error];
    if (error != nil) return nil;
    return result;
}
@end
