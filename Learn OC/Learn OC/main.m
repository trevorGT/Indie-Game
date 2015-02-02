//
//  main.m
//  Learn OC
//
//  Created by 蒋国太 on 14/11/2.
//  Copyright (c) 2014年 trevor. All rights reserved.
//

#import <Foundation/Foundation.h>

BOOL areIntsDifferent(int thing1, int thing2) {
    if (thing1 == thing2) {
        return YES;
    }
    else {
        return NO;
    }
}

NSString *boolString(BOOL yesNo) {
    if  (yesNo == NO) {
        return (@"NO");
    }
    else {
        return (@"YES");
    }
}

int main(int argc, const char * argv[]) {
    NSLog(@"booString output:%@", boolString(areIntsDifferent(16, 1)));
    if (areIntsDifferent(3, 1) == YES) {
        NSLog(@"NSLog YES");
    }
    
    return (0);
}