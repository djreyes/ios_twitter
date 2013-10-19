//
//  Tweet.m
//  twitter
//
//  Created by Timothy Lee on 8/5/13.
//  Copyright (c) 2013 codepath. All rights reserved.
//

#import "Tweet.h"

@implementation Tweet

- (NSString *)text {
    return [self.data valueOrNilForKeyPath:@"text"];
}

- (NSString *)username {
    NSString *username = [NSString stringWithFormat:@"@%@", [[self.data valueOrNilForKeyPath:@"user"] valueOrNilForKeyPath:@"screen_name"]];
    return username;
}

- (NSString *)profilePicture {
    return [[self.data valueOrNilForKeyPath:@"user"] valueOrNilForKeyPath:@"profile_image_url"];
}

- (NSString *)timestamp {
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"eee MMM dd HH:mm:ss ZZZZ yyyy"];
    NSString *createdAt =[self.data valueOrNilForKeyPath:@"created_at"];
    NSDate *date = [df dateFromString:createdAt];
    return [date timeAgo];
}

+ (NSMutableArray *)tweetsWithArray:(NSArray *)array {
    NSMutableArray *tweets = [[NSMutableArray alloc] initWithCapacity:array.count];
    for (NSDictionary *params in array) {
        [tweets addObject:[[Tweet alloc] initWithDictionary:params]];
    }
    return tweets;
}

@end
