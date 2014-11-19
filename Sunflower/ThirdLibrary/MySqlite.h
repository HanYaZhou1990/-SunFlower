//
//  MySqlite.h
//  TestCoreData1
//
//  Created by hanyazhou on 14-6-30.
//  Copyright (c) 2014年 rumi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserInformation.h"

@interface MySqlite : NSObject

//NSManagedObject（被管理的数据记录）
//相当于数据库中的表格记录
//NSFetchRequest（获取数据的请求）
//相当于查询语句
//NSEntityDescription（实体结构）
//相当于表格结构
//后缀为.xcdatamodeld的包
//里面是.xcdatamodel文件，用数据模型编辑器编辑
//编译后为.momd或.mom文件

    //NSManagedObjectContext（被管理的数据上下文）,操作实际内容（操作持久层）,作用：插入数据，查询数据，删除数据
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
    //NSManagedObjectModel（被管理的数据模型）,数据库所有表格或数据结构，包含各实体的定义信息;作用：添加实体的属性，建立属性之间的关系 ;操作方法：视图编辑器，或代码
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
    //NSPersistentStoreCoordinator（持久化存储助理）相当于数据库的连接器;作用：设置数据存储的名字，位置，存储方式，和存储时机
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
    //保存数据到持久层（数据库）
- (void)saveContext;
    //应用程序沙箱下的Documents目录路径;
- (NSURL *)applicationDocumentsDirectory;

//插入数据
- (void)insertCoreData:(NSDictionary *)informationDictionary tableName:(NSString *)tableName;
//更新数据
- (void)updataCoreData:(NSDictionary *)informationDictionary tableName:(NSString *)tableName;
//查询数据
- (NSArray *)dataFetchRequestWithTableName:(NSString *)tableName;
//删除数据
- (void)delCoreDataWithTableName:(NSString *)tableName;

@end
