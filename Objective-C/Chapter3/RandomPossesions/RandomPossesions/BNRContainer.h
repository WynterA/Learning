//
//  BNRContainer.h
//  RandomPossesions
//
//  Created by Arie Myrmo on 8/27/18.
//  Copyright © 2018 Myrmo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRItem.h"

@interface BNRContainer : BNRItem

@property NSMutableArray *containerElement;
@property NSString *containerName;
@property int value;

- (id)initWithContainerName:(NSString *)n valueInDollars:(int)i;
- (void)addItem:(id)Item;
- (void)list;

@end
