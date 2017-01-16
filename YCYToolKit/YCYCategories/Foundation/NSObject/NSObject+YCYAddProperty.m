//
//  NSObject+YCYAddProperty.m
//
//  Created by Jakey on 14/12/15.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import "NSObject+YCYAddProperty.h"
#import <objc/runtime.h>

//objc_getAssociatedObject和objc_setAssociatedObject都需要指定一个固定的地址，这个固定的地址值用来表示属性的key，起到一个常量的作用。
static const void *YCYStringProperty = &YCYStringProperty;
static const void *YCYIntegerProperty = &YCYIntegerProperty;
//static char IntegerProperty;
@implementation NSObject (YCYAddProperty)

@dynamic ycy_stringProperty;
@dynamic ycy_integerProperty;

//set
/**
 *  @brief  catgory runtime实现get set方法增加一个字符串属性
 */
-(void)setycy_stringProperty:(NSString *)ycy_stringProperty{
    //use that a static const as the key
    objc_setAssociatedObject(self, YCYStringProperty, ycy_stringProperty, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    //use that property's selector as the key:
    //objc_setAssociatedObject(self, @selector(stringProperty), stringProperty, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
//get
-(NSString *)ycy_stringProperty{
    return objc_getAssociatedObject(self, YCYStringProperty);
}

//set
/**
 *  @brief  catgory runtime实现get set方法增加一个NSInteger属性
 */
-(void)setycy_integerProperty:(NSInteger)ycy_integerProperty{
    NSNumber *number = [[NSNumber alloc]initWithInteger:ycy_integerProperty];
    objc_setAssociatedObject(self,YCYIntegerProperty, number, OBJC_ASSOCIATION_ASSIGN);
}
//get
-(NSInteger)ycy_integerProperty{
    return [objc_getAssociatedObject(self, YCYIntegerProperty) integerValue];
}

@end
