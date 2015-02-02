//
//  Card.h
//  Machismo
//
//  Created by 蒋国太 on 14/12/22.
//  Copyright (c) 2014年 trevor. All rights reserved.
//
@import Foundation;

@interface Card : NSObject

@property (strong, nonatomic) NSString *contents;
@property (nonatomic, getter=isChosen) BOOL chosen;
@property (nonatomic, getter=isMatched) BOOL matched;

-(int)match:(NSArray *)otherCards;

@end
