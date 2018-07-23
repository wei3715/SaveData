//
//  Person+CoreDataProperties.m
//  
//
//  Created by mac on 2018/7/21.
//
//

#import "Person+CoreDataProperties.h"

@implementation Person (CoreDataProperties)

+ (NSFetchRequest<Person *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"Person"];
}

@dynamic name;
@dynamic age;
@dynamic book;

@end
