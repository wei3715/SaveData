//
//  Person+CoreDataProperties.h
//  
//
//  Created by mac on 2018/7/21.
//
//

#import "Person+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Person (CoreDataProperties)

+ (NSFetchRequest<Person *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *name;
@property (nonatomic) int16_t age;
@property (nullable, nonatomic, retain) Book *book;

@end

NS_ASSUME_NONNULL_END
