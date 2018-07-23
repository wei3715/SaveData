数据存储的几种方式
sql，FMDB,CoreData
CoreData：ios5之后才出现的一个框架，它提供了对象-关系型映射（ORM）的功能，即能够将OC对象转化为数据，保存在SQLite数据文件中，也能够将保存在数据库中的数据还原成OC对象。在此数据操作期间，我们不需要编写任何SQL语句.但底层实现还是SQL
模型文件：
在CoreData，需要进行映射的对象成为实体（entity）,而且需要使用CoreData的模型文件来描述app中的所有实体和实体属性

xcode 项目中设置可以看到对应的SQLite的语句：
1:打开Product，点击EditScheme
2.点击Arguments,在ArgumentsPassed On Launch 中添加两项
1>-com.apple.CoreData.SQLDebug
2>1


数据库迁移步骤
1.选中Model.xcdatamodeld模型文件，在顶部菜单栏中选择:Editor->Add Model Version,添加一个新的模型文件Model2.xcdatamodeld
2.然后在xcode右侧导航栏中，Mode Version中选择要切换的模型文件Model2
3.在创建数据持久调度的代码中添加option选项
 [_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:sqlLiteURL options:nil error:&error];
 
 修改为：
 //数据库版本迁移
 NSDictionary *options = @{NSMigratePersistentStoresAutomaticallyOption:@YES, NSInferMappingModelAutomaticallyOption:@YES};
 
 [_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:sqlLiteURL options:options error:&error];
