//
//  main.m
//  RandomPossesions
//
//  Created by Arie Myrmo on 8/16/18.
//  Copyright © 2018 Myrmo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRItem.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        // Create a mutable array object, store its address in items variable
        NSMutableArray *items = [[NSMutableArray alloc] init];

        // Send message addObject: to the NSMutableArray pointed to
        //  by the variable items, passing a string each time.
        [items addObject:@"One"];
        [items addObject:@"Two"];
        [items addObject:@"Three"];

        // Send another message, insertObject:atIndex, to that same array object
        [items insertObject:@"Zero"
                    atIndex:0];

        // For every item in the array as determined by sending count to items
        for (int i = 0;  i < [items count]; i++)
        {
            // We get the ith object from the array and pass it as an argument to
            //  NSLog, which implicitly sends the description message to that object
            NSLog(@"%@", [items objectAtIndex:i]);

        }

        BNRItem *p = [[BNRItem alloc] init];

        // This creates a new NSString, "Red Sofa" and gives it to the BNRItem
        [p setItemName:@"Red Sofa"];

        [p setSerialNumber:@"A1B2C"];
        [p setValueInDollars:100];

        // Remember an NSLog with %@ as the token will print the
        //  description of the corresponding argument
        NSLog(@"%@", p);

        // Destroy the array pointed to by items
        items = nil;
    }
    return 0;
}
