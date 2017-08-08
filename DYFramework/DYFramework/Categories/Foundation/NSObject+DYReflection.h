//
//  NSObject+DYReflection.h
//  DYFramework
//
//  Created by 黄德玉 on 2017/8/8.
//  Copyright © 2017年 Dorin Huang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (DYReflection)

//类名
- (NSString *)dy_className;
+ (NSString *)dy_className;
//父类名称
- (NSString *)dy_superClassName;
+ (NSString *)dy_superClassName;

//实例属性字典
-(NSDictionary *)dy_propertyDictionary;

//属性名称列表
- (NSArray*)dy_propertyKeys;
+ (NSArray *)dy_propertyKeys;

//属性详细信息列表
- (NSArray *)dy_propertiesInfo;
+ (NSArray *)dy_propertiesInfo;

//格式化后的属性列表
+ (NSArray *)dy_propertiesWithCodeFormat;

//方法列表
-(NSArray*)dy_methodList;
+(NSArray*)dy_methodList;

-(NSArray*)dy_methodListInfo;

//创建并返回一个指向所有已注册类的指针列表
+ (NSArray *)dy_registedClassList;
//实例变量
+ (NSArray *)dy_instanceVariable;

//协议列表
-(NSDictionary *)dy_protocolList;
+ (NSDictionary *)dy_protocolList;


- (BOOL)dy_hasPropertyForKey:(NSString*)key;
- (BOOL)dy_hasIvarForKey:(NSString*)key;


@end
