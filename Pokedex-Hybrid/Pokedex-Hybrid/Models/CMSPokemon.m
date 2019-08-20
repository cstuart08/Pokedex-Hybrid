//
//  CMSPokemon.m
//  Pokedex-Hybrid
//
//  Created by Apps on 8/20/19.
//  Copyright © 2019 Apps. All rights reserved.
//

#import "CMSPokemon.h"

//Magic Strings
static NSString * const nameKey = @"name";
static NSString * const idKey = @"id";
static NSString * const abilitiesKey = @"abilities";
static NSString * const abilityKey = @"ability";



@implementation CMSPokemon

- (instancetype)initWithName:(NSString *)name identifier:(NSInteger)identifier abilities:(NSArray<NSString *> *)abilities {
    // ALL OBJC initializers are failable
    self = [super init];
    // if (self) { is the same thing as the below line.
    if (self != nil) {
        _name = name;
        _identifier = identifier;
        _abilities = abilities;
    }
    return self;
}

@end

@implementation CMSPokemon (JSONConvertable)

-(instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary {
    
    // Get our name from the Top-Level-Dictionary
    NSString *name = dictionary[nameKey];
    // Get our identifier from the Top-Level-Dictionary
    NSInteger identifier = [dictionary[idKey] integerValue];
    
    // Get our abilities from the Top-Level-Dictionary by digging down into it....
    NSArray *abilitiesDictionaryArray = dictionary[abilitiesKey];
    
    // Safety check...
    if (![name isKindOfClass:[NSString class]] || ![abilitiesDictionaryArray isKindOfClass:[NSArray class]]) {
        return nil;
    }
    
    // Create an array location to store the ability names we pull (because there can be multiple names)
    NSMutableArray<NSString *> *abilities = [[NSMutableArray alloc] init];
    
    // Use a for loop to iterate through an array of dictionaries (drilling down).
    for (NSDictionary *abilitiesDictionary in abilitiesDictionaryArray) {
        // Grab the dictionary inside the abilitiesDictionary
        NSDictionary *nestedAbilityDictionary = abilitiesDictionary[abilityKey];
        // Grab the ability name inside the dictionary we grabbed in above line.
        NSString *abilityname = nestedAbilityDictionary[nameKey];
        // Send the ability name we grabbed to the above NSMutableArray to store it somewhere.
        [abilities addObject:abilityname];
    }
    return [self initWithName:name identifier:identifier abilities:abilities];
}

@end
