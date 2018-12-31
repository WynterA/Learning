//
//  main.m
//  RandomPossesions
//
//  Created by Arie Myrmo on 8/16/18.
//  Copyright © 2018 Myrmo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRItem.h"
#import "BNRContainer.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        BNRItem *backpack = [[BNRItem alloc] init];
        [backpack setItemName:@"Backpack"];

        BNRItem *calculator = [[BNRItem alloc] init];
        [calculator setItemName:@"Calculator"];

        [backpack setContainedItem:calculator];

        // DOT METHOD
        // following two lines are equivalent
//        int value = [backpack valueInDollars];
//        int value = backpack.valueInDollars;

        backpack = nil;

        NSLog(@"Container: %@", [calculator container]);

        calculator = nil;
    }
    return 0;
}
