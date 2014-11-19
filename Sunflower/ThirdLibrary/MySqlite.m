//
//  MySqlite.m
//  TestCoreData1
//
//  Created by hanyazhou on 14-6-30.
//  Copyright (c) 2014年 rumi. All rights reserved.
//

#import "MySqlite.h"

@implementation MySqlite

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

//插入数据
//创建数据上下文，调用insertNewObjectForName方法，创建两个数据记录NSManagedObject，然后就可以对之前数据模型编辑视图中定义的属性进行赋值。此时的数据只在内存中被修改，最后调用数据上下文的save方法，保存到持久层
- (void)insertCoreData:(NSDictionary *)informationDictionary tableName:(NSString *)tableName
{
    NSManagedObjectContext *context = [self managedObjectContextWithableName:tableName];
    
    NSManagedObject *contactInfo = [NSEntityDescription insertNewObjectForEntityForName:tableName inManagedObjectContext:context];
    [contactInfo setValuesForKeysWithDictionary:informationDictionary];
    NSError *error;
    if(![context save:&error])
        {
        NSLog(@"不能保存：%@",[error localizedDescription]);
        }
}
//更新数据，如果已有数据就更新数据，如果没有，直接插入一行数据
- (void)updataCoreData:(NSDictionary *)informationDictionary tableName:(NSString *)tableName{
    NSFetchRequest *fetcheRequest = [[NSFetchRequest alloc] init];
    NSManagedObjectContext *context = [self managedObjectContextWithableName:tableName];
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:tableName inManagedObjectContext:context];
    NSError *error;
    [fetcheRequest setEntity:entityDescription];
    NSArray *array =[context executeFetchRequest:fetcheRequest error:&error];
    NSManagedObject *contactInfo = nil;
    if ([array count] > 0) {
        contactInfo = [array objectAtIndex:0];
        [contactInfo setValuesForKeysWithDictionary:informationDictionary];
    }else {
        [self insertCoreData:informationDictionary tableName:tableName];
    }
    [context save:&error];
}
//查询数据
//在调用了insertCoreData之后，可以调用自定的查询方法dataFetchRequest来查询插入的数据
- (NSArray *)dataFetchRequestWithTableName:(NSString *)tableName
{
    NSManagedObjectContext *context = [self managedObjectContextWithableName:tableName];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:tableName inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    NSError *error;
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    if ([fetchedObjects count] >0) {
        return fetchedObjects;
    }else{
        [self insertCoreData:nil tableName:tableName];
        return fetchedObjects;
    }
}
//删除数据
- (void)delCoreDataWithTableName:(NSString *)tableName{
    NSManagedObjectContext *context = [self managedObjectContextWithableName:tableName];
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:tableName inManagedObjectContext:context];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    [fetchRequest setEntity:entityDescription];
    NSError *error;
    NSArray *array = [context executeFetchRequest:fetchRequest error:&error];
    if (!error) {
        if ([tableName isEqualToString:@"UserInformation"]) {
            for (UserInformation *object in array) {
                [context deleteObject:object];
            }
        }else if ([tableName isEqualToString:@"HasLogin"]){
            for (UserInformation *object in array) {
                [context deleteObject:object];
            }
        }else{
            NSLog(@"another tableView");
        }
    }
    if ([context hasChanges]) {
        [context save:&error];
    }
}

- (void)saveContext
{
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}
#pragma mark  - Core Data stack
#pragma mark  -
//被管理的数据上下文;初始化的后，必须设置持久化存储助理
- (NSManagedObjectContext *)managedObjectContextWithableName:(NSString *)tableName
{
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinatorWithableName:tableName];
    if (coordinator != nil) {
        _managedObjectContext = [[NSManagedObjectContext alloc] init];
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return _managedObjectContext;
}
//被管理的数据模型;初始化必须依赖.momd文件路径，而.momd文件由.xcdatamodeld文件编译而来
- (NSManagedObjectModel *)managedObjectModelWithableName:(NSString *)tableName
{
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"UserInformation" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}
//持久化存储助理;初始化必须依赖NSManagedObjectModel，之后要指定持久化存储的数据类型，默认的是NSSQLiteStoreType，即SQLite数据库；并指定存储路径为Documents目录下，以及数据库名称
- (NSPersistentStoreCoordinator *)persistentStoreCoordinatorWithableName:(NSString *)tableName
{
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"UserInformation.sqlite"];
    NSError *error = nil;
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModelWithableName:tableName]];
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    return _persistentStoreCoordinator;
}

#pragma mark - Application's Documents directory
//Documents目录路径
- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

@end
