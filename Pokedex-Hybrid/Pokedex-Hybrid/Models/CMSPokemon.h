//
//  CMSPokemon.h
//  Pokedex-Hybrid
//
//  Created by Apps on 8/20/19.
//  Copyright © 2019 Apps. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CMSPokemon : NSObject

// @Declare a propert (give property attributes) Set its Type *give it a name;
// readwrite(var) is default. readonly needs to be specified for a "let".
// For now, if it is a NSStrings, assume it needs a property attribute of "copy".
// <> is called generics, in <NSString *> NSString is called a generic type. Helps set Type-Safety.
// <NSString *> does not need a pointer name, because we just need it to ba a string, we dont need to name the strings. NSArray *abilities, however, we are naming our array.
@property (nonatomic, copy, readonly) NSString *name;
// let name: String
@property (nonatomic, readonly) NSInteger identifier;
// let identifier: Int
@property (nonatomic, copy, readonly) NSArray<NSString *> *abilities;
//let abilities: [String]

//This is our initializer for our CMSPokemon object.
/*
1    2             3            4      5  6       7         8          9                                   10        11      12    13  14  15     16
 */
- (instancetype)initWithName:(NSString *)name identifier:(NSInteger)identifier abilities:(NSArray<NSString *> *)abilities;
/*
 1) - Declare the method type. - is an instance method (you must have an instance to use (like a singleton)), a + is a class method.
 2) Declare the return type. If out method didnt return anything it would be (void).
 3) Method name (it is convention to declare the first parameter external name inside the method name).
 4) The type of the first parameter.
 5) Pointer for the first parameter.
 6) The first parameter's name.
 7) The external name for the second parameter.
 8) The type of the second parameter.
 9) The second parameter's name.
 10) The external name for the third parameter.
 11) The type of the third parameter.
 12) Declaring the type of objects parameter 3 can interact with. < generic type >
 13) Pointer for the generic type.
 14) Pointer for the second parameter.
 15) The third parameter's name.
 16) Semi-colon.
 
 Swift (static if method is a class method) func initWith(name: String, identifier: Int, abilities: [String]) -> (model) {
 }
 
 */

@end

// This is like an extension in Swift.
        // call this on CMSPokemon
                    // Naming the extension.
@interface CMSPokemon (JSONConvertable)

// id is short hand for "Any" ObjC object or in this case Any.
// https://developer.apple.com/swift/blog/?id=39
                                // This is a dictionary of String:Any
- (instancetype)initWithDictionary:(NSDictionary <NSString *, id>* )dictionary;

@end

NS_ASSUME_NONNULL_END
