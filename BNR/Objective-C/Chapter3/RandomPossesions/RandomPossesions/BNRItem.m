//
//  BNRItem.m
//  RandomPossesions
//
//  Created by Arie Myrmo on 8/20/18.
//  Copyright © 2018 Myrmo. All rights reserved.
//

#import "BNRItem.h"

@implementation BNRItem
@synthesize itemName;
@synthesize containedItem, container, serialNumber, valueInDollars, dateCreated;

+ (id)randomItem
{
    // Create an array of three adjectives
    NSArray *randomAdjectiveList = [NSArray arrayWithObjects:@"Fluffy",
                                                             @"Rusty",
                                                             @"Shiny", nil];

    // Create an array of three nouns
    NSArray *randomNounList = [NSArray arrayWithObjects:@"Bear",
                                                        @"Spork",
                                                        @"Mac", nil];

    // Get the index of a random adjective/noun from the lists
    // Note: The % operator, called the modulo operator, gives
    // you the remainder. So adjectiveIndex is a random number
    // from 0 to 2 inclusive.
    NSInteger adjectiveIndex = rand() % [randomAdjectiveList count];
    NSInteger nounIndex = rand() % [randomNounList count];

    // Note taht NSInteger is not an object, but a type definition
    // for "unsigned long"

    NSString *randomName = [NSString stringWithFormat:@"%@ %@",
                            [randomAdjectiveList objectAtIndex:adjectiveIndex],
                            [randomNounList objectAtIndex:nounIndex]];

    int randomValue = rand() % 100;

    NSString *randomSerialNumber = [NSString stringWithFormat:@"%c%c%c%c%c",
                                        '0' + rand() % 10,
                                        'A' + rand() % 26,
                                        '0' + rand() % 10,
                                        'A' + rand() % 26,
                                        '0' + rand() % 10];

    BNRItem *newItem = [[self alloc] initWithItemName:randomName valueInDollars:randomValue serialNumber:randomSerialNumber];

    return newItem;
}

- (NSString *)description
{
    NSString *descriptionString =
        [[NSString alloc] initWithFormat:@"%@ (%@): Worth $%d, recorded on %@",
                             itemName,
                             serialNumber,
                             valueInDollars,
                             dateCreated];
    return descriptionString;
}

- (id)init
{
    return [self initWithItemName:@"Item"
                   valueInDollars:0
                     serialNumber:@""];
}

- (id)initWithItemName:(NSString *)name valueInDollars:(int)value serialNumber:(NSString *)sNumber
{
    // Call the superclass's designated initializer
    self = [super init];

    // Did the superclass's designated initializer succeed?
    if (self) {
        // Give the instance variables initial values
        [self setItemName:name];
        [self setSerialNumber:sNumber];
        [self setValueInDollars:value];
        dateCreated = [[NSDate alloc] init];
    }

    return self;
}

- (id)initWithItemName:(NSString *)name serialNumber:(NSString *)sNumber
{
    self = [super init];

    if(self) {
        [self setItemName:name];
        [self setSerialNumber:sNumber];
        dateCreated = [[NSDate alloc] init];
    }

    return self;
}

- (void)setContainedItem:(BNRItem *)cItem
{
    containedItem = cItem;
    [cItem setContainer:self];
}

- (void)dealloc
{
    NSLog(@"Destroyed: %@", self);
}

@end
