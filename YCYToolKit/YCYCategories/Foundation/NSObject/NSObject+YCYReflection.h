//
//  NSObject+YCYReflection.h
//
//  Created by Jakey on 15/12/22.
//  Copyright © 2015年 Jakey. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (YCYReflection)
//类名
- (NSString *)ycy_className;
+ (NSString *)ycy_className;
//父类名称
- (NSString *)ycy_superClassName;
+ (NSString *)ycy_superClassName;

//实例属性字典
-(NSDictionary *)ycy_propertyDictionary;

//属性名称列表
- (NSArray*)ycy_propertyKeys;
+ (NSArray *)ycy_propertyKeys;

//属性详细信息列表
- (NSArray *)ycy_propertiesInfo;
+ (NSArray *)ycy_propertiesInfo;

//格式化后的属性列表
+ (NSArray *)ycy_propertiesWithCodeFormat;

//方法列表
-(NSArray*)ycy_methodList;
+(NSArray*)ycy_methodList;

-(NSArray*)ycy_methodListInfo;

//创建并返回一个指向所有已注册类的指针列表
+ (NSArray *)ycy_registedClassList;
//实例变量
+ (NSArray *)ycy_instanceVariable;

//协议列表
-(NSDictionary *)ycy_protocolList;
+ (NSDictionary *)ycy_protocolList;


- (BOOL)ycy_hasPropertyForKey:(NSString*)key;
- (BOOL)ycy_hasIvarForKey:(NSString*)key;

@end
