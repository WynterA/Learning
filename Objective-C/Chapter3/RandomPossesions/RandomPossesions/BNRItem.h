//
//  BNRItem.h
//  RandomPossesions
//
//  Created by Arie Myrmo on 8/20/18.
//  Copyright © 2018 Myrmo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRItem : NSObject

// PROPERTIES
@property (nonatomic, strong) BNRItem *containedItem;
@property (nonatomic, weak) BNRItem *container;

// generated setter method for the syntehsized properties using (COPY) make a copy of the string
// copy method returns a new NSString object (Not an NSMutableString)
// copy gives you a strong reference to the the object pointed to
@property (nonatomic, copy) NSString *itemName;
@property (nonatomic, copy) NSString *serialNumber;
@property (nonatomic) int valueInDollars;
@property (nonatomic, readonly, strong) NSDate *dateCreated;

// CLASS Methods come first
+ (id)randomItem;

// followed by INITIALIZERS
- (id)initWithItemName:(NSString *)name
        valueInDollars:(int)value
          serialNumber:(NSString *)sNumber;

- (id)initWithItemName:(NSString *)name
          serialNumber:(NSString *)sNumber;

// then any OTHER METHODS


@end
