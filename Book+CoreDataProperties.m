//
//  Book+CoreDataProperties.m
//  
//
//  Created by mac on 2018/7/21.
//
//

#import "Book+CoreDataProperties.h"

@implementation Book (CoreDataProperties)

+ (NSFetchRequest<Book *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"Book"];
}

@dynamic name;
@dynamic price;

@end
