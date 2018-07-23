//
//  ZWWSQLiteMoreViewController.m
//  SaveData
//
//  Created by mac on 2018/6/20.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "ZWWSQLiteMoreViewController.h"
#import "ZWWStudentDB.h"
#import "FMDB.h"
#import "NSString+CachePath.h"
#import <CoreData/CoreData.h>
#import "Person+CoreDataClass.h"
#import "Book+CoreDataClass.h"
@interface ZWWSQLiteMoreViewController ()

@property (nonatomic, strong)FMDatabase *dataBase;

//coreData
@property (nonatomic, strong) NSManagedObjectModel          *managedObjectModel;
@property (nonatomic, strong) NSPersistentStoreCoordinator  *persistentStoreCoordinator;

//上下文
@property (nonatomic, strong) NSManagedObjectContext        *context;

@end

@implementation ZWWSQLiteMoreViewController

//sqlite
- (IBAction)sqliteDo:(id)sender{
    
}
//增
- (IBAction)add:(id)sender {
    NSString *name = [NSString stringWithFormat:@"zhao%02d",arc4random_uniform(100)];
    NSString *sqlStr =  [NSString stringWithFormat:@"insert into t_student (name,age) values ('%@',%d);",name,arc4random()%100];
    BOOL result = [ZWWStudentDB execSqliteWithSql:sqlStr type:@"增加"];
    ZWWLog(@"增加语句执行结果%d",result);
}

//删
- (IBAction)delete:(id)sender {
    NSString *sqlStr = [NSString stringWithFormat:@"delete from t_student where age > %d;",40];
    BOOL result = [ZWWStudentDB execSqliteWithSql:sqlStr type:@"删除"];
    ZWWLog(@"删除语句执行结果%d",result);
}

//更新
- (IBAction)alter:(id)sender {
    NSString *sqlStr = [NSString stringWithFormat:@"update t_student set age = 18 where name ='%@';",@"zhaoweiwei"];
    BOOL result = [ZWWStudentDB execSqliteWithSql:sqlStr type:@"更新"];
    ZWWLog(@"更新语句执行结果%d",result);
}

//查
- (IBAction)query:(id)sender {
    //查询语句
    NSString *sqlStr = @"select * from t_student order by age desc";
    NSArray *result = [ZWWStudentDB querySqliteWithSql:sqlStr];
    ZWWLog(@"查语句执行结果%@",result);
}

//fmdb操作
- (IBAction)fmdbDo:(id)sender{
    //打开或者创建数据库
    if ([self.dataBase open]) {
        //打开数据库成功，创建表
        NSString *sql = @"create table if not exists t_student (id integer primary key autoincrement, name text, age integer)";
        //执行SQL语句
        BOOL result =  [self.dataBase executeUpdate:sql];
        if (result) {
            ZWWLog(@"FMDB数据库创建成功");
        } else {
            ZWWLog(@"FMDB数据库创建失败");
        }
    }else {
        ZWWLog(@"打开数据库失败");
    }
    
}

- (IBAction)fmdb_add:(id)sender {
    //因为FMDB用？？做占位符是面向对象的，所以要用@(20)对象类型而不能直接用20数值类型
    NSString *name = [NSString stringWithFormat:@"zhao%d",arc4random_uniform(20)];
    NSInteger age = arc4random_uniform(100);
    if ([self.dataBase open]) {
        //打开数据库成功
        ZWWLog(@"打开数据库成功");
        BOOL result = [self.dataBase executeUpdate: @"insert into t_student (name,age) values(?,?);",name,@(age)];
        if (result) {
            ZWWLog(@"插入成功");
        } else {
            ZWWLog(@"插入失败");
        }
        [self.dataBase close];
    } else {
        [self.dataBase close];
        ZWWLog(@"打开数据库失败");
    }
   
    
}
- (IBAction)fmdb_delete:(id)sender {
    if ([self.dataBase open]) {
        ZWWLog(@"打开数据库成功");
        BOOL result = [self.dataBase executeUpdate: @"delete from t_student where age > ?;",@(40)];
        if (result) {
            ZWWLog(@"删除成功");
        } else {
            ZWWLog(@"删除失败");
        }
        [self.dataBase close];
    } else {
        [self.dataBase close];
        ZWWLog(@"打开数据库失败");
    }
    
}
- (IBAction)fmdb_alter:(id)sender {
    if ([self.dataBase open]) {
        ZWWLog(@"打开数据库成功");
        BOOL result = [self.dataBase executeUpdate: @"update t_student set name = ? where age < ?;",@"赵维维",@(20)];
        if (result) {
            ZWWLog(@"修改成功");
        } else {
            ZWWLog(@"修改失败");
        }
        [self.dataBase close];
    } else {
        [self.dataBase close];
        ZWWLog(@"打开数据库失败");
    }
    
}
- (IBAction)fmdb_query:(id)sender {
    if ([self.dataBase open]) {
        ZWWLog(@"打开数据库成功");
        //设置查询语句，返回结果集
        FMResultSet *set = [self.dataBase executeQuery:@"select * from t_student"];
        while ([set next]) {
            //根据列索引
//            NSString *name = [set stringForColumnIndex:1];
            //根据字段名
            NSString *name = [set stringForColumn:@"name"];
            NSInteger age = [set intForColumn:@"age"];
            ZWWLog(@"name == %@,age ==%zd",name,age);
        }
        [self.dataBase close];
    } else {
        [self.dataBase close];
        ZWWLog(@"打开数据库失败");
    }
}

//创建数据库操作对象
- (FMDatabase *)dataBase{
    if (!_dataBase) {
        NSString *dataBasePath = [NSString cachePathWithFileName:@"fmdb.sqlite"];
        _dataBase = [FMDatabase databaseWithPath:dataBasePath];
        ZWWLog(@"fmdb 数据库路径==%@",dataBasePath);
    }
    return _dataBase;
}

//coreData操作
- (IBAction)coreDataDO:(id)sender {
    ZWWLog(@"coreData创建结果%@",self.managedObjectModel);
    self.managedObjectModel = nil;
    self.persistentStoreCoordinator = nil;
    self.context = nil;
}

//创建模型文件
- (NSManagedObjectModel *)managedObjectModel{
    if (!_managedObjectModel) {
         // url 为Model.xcdatamodeld，注意扩展名为 momd，而不是 xcdatamodeld 类型
//        NSURL *modelURL = [[NSBundle mainBundle]URLForResource:@"Model" withExtension:@"momd"];
//        _managedObjectModel = [[NSManagedObjectModel alloc]initWithContentsOfURL:modelURL];
        //Bundles为nil，表示载入所有的模型文件
        _managedObjectModel = [NSManagedObjectModel mergedModelFromBundles:nil];
    }
    return _managedObjectModel;
}

//创建数据持久化调度
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator{
    if (!_persistentStoreCoordinator) {
        // 创建 coordinator 需要传入 managedObjectModel
        _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc]initWithManagedObjectModel:self.managedObjectModel];
        
        // 指定本地的 sqlite 数据库文件路径
        NSString *sqlLiteFileName = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)lastObject]stringByAppendingPathComponent:@"Model.sqlite"];
        ZWWLog(@"Coredata本地sqlite路径文件==%@",sqlLiteFileName);
        NSURL *sqlLiteURL = [NSURL fileURLWithPath:sqlLiteFileName];
        NSError *error;
        
        //数据库版本迁移
        NSDictionary *options = @{NSMigratePersistentStoresAutomaticallyOption:@YES, NSInferMappingModelAutomaticallyOption:@YES};
         // 为 persistentStoreCoordinator 指定本地存储的类型，这里指定的是 SQLite
      
        [_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:sqlLiteURL options:options error:&error];
        if (error) {
            ZWWLog(@"failes to create _persistentStoreCoordinator %@",error)
        } else {
            ZWWLog(@"success to create _persistentStoreCoordinator")
        }
        
    }
    return _persistentStoreCoordinator;
}

- (NSManagedObjectContext *)context{
    if (!_context) {
        // 指定 context 的并发类型： NSMainQueueConcurrencyType 或 NSPrivateQueueConcurrencyType
        _context = [[NSManagedObjectContext alloc]initWithConcurrencyType:NSMainQueueConcurrencyType];
        _context.persistentStoreCoordinator = self.persistentStoreCoordinator;
    }
    return _context;
}

//coreData对象型数据库增删改查
- (IBAction)coreData_add:(id)sender {
   //创建一个待插入的新的 NSManagedObject 对象
   Person *person = [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:self.context];
//    person.name = @"zww";
//    person.age = 18;
    person.name = @"zoe";
    person.age = 20;
    
    Book *book = [NSEntityDescription insertNewObjectForEntityForName:@"Book" inManagedObjectContext:self.context];
//    book.price = 5.0;
//    book.name = @"iOS开发大神成长记";
//    person.book = book;
    book.price = 15.0;
    book.name = @"咸鱼翻身";
    person.book = book;
    
    NSError *error;
    //保存上下文
   
    if ([self.context save:&error]) {
        ZWWLog(@"保存成功");
    } else {
        ZWWLog(@"保存失败%@",error);
    }
}
- (IBAction)coreData_delete:(id)sender {
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Person"];
    request.predicate = [NSPredicate predicateWithFormat:@"name CONTAINS %@",@"zoe"];
    NSArray *personList = [self.context executeFetchRequest:request error:NULL];
    for (Person *p in personList) {
//        ZWWLog(@"person.name = %@,person.age=%hd",p.name,p.age);
        //删除对象
        [self.context deleteObject:p];
        //同时删除p对应book对象属性
        [self.context deleteObject:p.book];
    }
    NSError *error;
    if ([self.context save:&error]) {
        ZWWLog(@"删除成功");
    } else {
        ZWWLog(@"删除失败%@",error);
    }
}

- (IBAction)coreData_alter:(id)sender {
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Person"];
    request.predicate = [NSPredicate predicateWithFormat:@"name CONTAINS %@",@"zoe"];
    NSArray *personList = [self.context executeFetchRequest:request error:NULL];
    for (Person *p in personList) {
//        ZWWLog(@"person.name = %@,person.age=%hd",p.name,p.age);
        p.age = 22;
    }
    NSError *error;
    if ([self.context save:&error]) {
        ZWWLog(@"修改成功");
    } else {
        ZWWLog(@"修改失败%@",error);
    }
    
}

- (IBAction)coreData_query:(id)sender {
    //第一种写法：较麻烦
    //第一步：实例化查询请求
//    NSFetchRequest *request = [[NSFetchRequest alloc]init];
//
//    //让某个实体执行请求
//    NSEntityDescription *desc = [NSEntityDescription entityForName:@"Person" inManagedObjectContext:self.context];
//    [request setEntity:desc];
    
    //第二种写法：
    NSFetchRequest *request = [[NSFetchRequest alloc]initWithEntityName:@"Person"];
    
    //条件查询，使用谓词Predicate查询==SQL里面的where
    //包含查询：模糊查询
//    request.predicate = [NSPredicate predicateWithFormat:@"name CONTAINS[c] %@",@"oe"];
    
    //根据键值查询
//    request.predicate = [NSPredicate predicateWithFormat:@"%K > %hd",@"age",18];
//    request.predicate = [NSPredicate predicateWithFormat:@"%K < %f",@"book.price",10.0];
    
    //设置查询限制
    //每页数据条数
//    [request setFetchLimit:1];
//    //数据偏移量（查询第五条记录）
//    [request setFetchOffset:4];
    
    NSError *error;
    //获取查询数据
    NSArray *personList = [self.context executeFetchRequest:request error:&error];
    
    

    for (Person *p in personList) {
        ZWWLog(@"p.name = %@,p.age = %hd,book.name=%@,book.price=%f",p.name,p.age,p.book.name,p.book.price);
    }
    
   
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
