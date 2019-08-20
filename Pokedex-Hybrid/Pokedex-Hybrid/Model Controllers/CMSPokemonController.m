//
//  CMSPokemonController.m
//  Pokedex-Hybrid
//
//  Created by Apps on 8/20/19.
//  Copyright © 2019 Apps. All rights reserved.
//

#import "CMSPokemonController.h"
#import "CMSPokemon.h"

@implementation CMSPokemonController

//+ (CMSPokemonController *)sharedController {
//    static CMSPokemonController *sharedController = nil;
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        sharedController = [CMSPokemonController new];
//    });
//    return sharedController;
//}

+ (void)fetchPokemonWithSearchTerm:(NSString *)searchTerm completion:(void (^)(CMSPokemon * ))completion {
    
    NSURL *baseURL = [[NSURL alloc] initWithString:@"https://pokeapi.co/api/v2/pokemon"];
    NSURL *searchURL = [baseURL URLByAppendingPathComponent:searchTerm];
    // Always print the URL to test it.
    NSLog(@"searchURL: %@", searchURL);
    
    [[NSURLSession.sharedSession dataTaskWithURL:searchURL completionHandler:^(NSData * data, NSURLResponse * response, NSError * error) {
        
        if (error) {
            NSLog(@"Error fetching pokemon from searchterm: %@, %@", error, error.localizedDescription);
            completion(nil);
            return;
        }
        
        if (!data) {
            NSLog(@"Error fetching pokemon DATA from searchterm: %@", error);
            completion(nil);
            return;
        }
        
        // &error is returning a pointer to a pointer to a dictionary.
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        
        // Safety check...
        if (!jsonDictionary || ![jsonDictionary isKindOfClass:[NSDictionary class]]) {
            NSLog(@"Error fetching JSON dictionary: %@", error);
            completion(nil);
            return;
        }
        
        // Initialize a Pokemon.
        CMSPokemon *pokemon = [[CMSPokemon alloc] initWithDictionary:jsonDictionary];
        completion(pokemon);
        
    }]resume];
    
}

@end
