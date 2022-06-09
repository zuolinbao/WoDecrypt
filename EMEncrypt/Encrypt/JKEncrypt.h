//
//  main.m
//  3DES研究
//
//  Created by apple on 15/10/22.
//  Copyright © 2015年 apple. All rights reserved.
//


#import <Foundation/Foundation.h>

#define gkey            @"123456789012345678901234"

@interface JKEncrypt : NSObject

+ (JKEncrypt*) shared;
- (NSString*) encrypt:(NSString*)encryptStr;
- (NSString*) decEncrypt:(NSString *)encryptStr;

@end
