//
//  BNRItem.h
//  RandomPossesions
//
//  Created by Arie Myrmo on 8/20/18.
//  Copyright © 2018 Myrmo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRItem : NSObject
{
    NSString *itemName;
    NSString *serialNumber;
    int valueInDollars;
    NSDate *dateCreated;
}

// CLASS Methods come first
+ (id)randomItem;

// followed by INITIALIZERS
- (id)initWithItemName:(NSString *)name
        valueInDollars:(int)value
          serialNumber:(NSString *)sNumber;

// then any OTHER METHODS
- (void)setItemName:(NSString *)str;
- (NSString *)itemName;

- (void)setSerialNumber:(NSString *)str;
- (NSString *)serialNumber;

- (void)setValueInDollars:(int)i;
- (int)valueInDollars;

- (NSDate *)dateCreated;


@end
