//
//  ALStudent.m
//  KVCTest
//
//  Created by Artyom Linnik on 11/28/16.
//  Copyright © 2016 Artyom Linnik. All rights reserved.
//

#import "ALStudent.h"

@implementation ALStudent

-(void)setName:(NSString *)name {
    
    _name = name;
    
    NSLog(@"student setName: %@", name);
}

-(void)setAge:(NSInteger)age {
    
    _age = age;
    
    NSLog(@"student setAge: %ld", (long)age);
}

-(NSString *)description {
    return [NSString stringWithFormat:@"Student: %@ %ld", self.name, (long)self.age];
}

-(void)setValue:(id)value forKey:(NSString *)key {
    NSLog(@"Student setValue: %@ forKey %@", value, key);
    [super setValue:value forKey:key];
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key {
    NSLog(@"Key: %@ is undefined", key);
}


- (void)changeName {
	[self willChangeValueForKey:@"name"];
	
	_name = @"FakeName";
	
//	[self didChangeValueForKey:@"name"];
}
/*
- (BOOL)validateValue:(inout id _Nullable * _Nonnull)ioValue forKey:(NSString *)inKey error:(out NSError **)outError {
	
	if ([inKey isEqualToString:@"name"]) {
		NSString *newName = *ioValue;
		
		if (![newName isKindOfClass:[NSString class]]) {
			*outError = [[NSError alloc] initWithDomain:@"Not NSString" code:123 userInfo:nil];
			return NO;
		}
		
		if ([newName rangeOfString:@"1"].location != NSNotFound) {
			*outError = [[NSError alloc] initWithDomain:@"Has numbers" code:324 userInfo:nil];
			return NO;
		}
	}
	return YES;
}
 */

- (BOOL)validateName:(inout id _Nullable * _Nonnull)ioValue error:(out NSError **)outError {
	NSLog(@"AAAAA");
	
	return YES;
}

@end
