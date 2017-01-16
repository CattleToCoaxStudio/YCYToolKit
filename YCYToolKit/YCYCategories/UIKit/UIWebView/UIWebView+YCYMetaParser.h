//
//  UIWebView+YCYMetaParser.h
//
//  Created by Hirose Tatsuya on 2013/09/15.
//  Copyright (c) 2013年 Tatyusa. All rights reserved.
//



#import <UIKit/UIKit.h>
//元解析器
@interface UIWebView (YCYMetaParser)
/**
 *  @brief  获取网页meta信息
 *
 *  @return meta信息
 */
-(NSArray *)ycy_getMetaData;
@end
