//
//  Book+CoreDataProperties.h
//  
//
//  Created by mac on 2018/7/21.
//
//

#import "Book+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Book (CoreDataProperties)

+ (NSFetchRequest<Book *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *name;
@property (nonatomic) double price;

@end

NS_ASSUME_NONNULL_END
