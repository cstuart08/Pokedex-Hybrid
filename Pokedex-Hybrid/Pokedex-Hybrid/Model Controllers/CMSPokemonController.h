//
//  CMSPokemonController.h
//  Pokedex-Hybrid
//
//  Created by Apps on 8/20/19.
//  Copyright © 2019 Apps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CMSPokemon.h"

@interface CMSPokemonController : NSObject

+ (void)fetchPokemonWithSearchTerm:(NSString *)searchTerm completion:(void (^) (CMSPokemon *))completion;

// + (CMSPokemonController *)sharedController;

@end
