//
//  BNRItem.m
//  RandomPossesions
//
//  Created by Arie Myrmo on 8/20/18.
//  Copyright © 2018 Myrmo. All rights reserved.
//

#import "BNRItem.h"

@implementation BNRItem

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

- (void)setItemName:(NSString *)str
{
    itemName = str;
}
- (NSString *)itemName
{
    return itemName;
}

- (void)setSerialNumber:(NSString *)str
{
    serialNumber = str;
}
- (NSString *)serialNumber
{
    return serialNumber;
}

- (void)setValueInDollars:(int)i
{
    valueInDollars = i;
}
- (int)valueInDollars
{
    return valueInDollars;
}

- (NSDate *)dateCreated
{
    return dateCreated;
}

@end
