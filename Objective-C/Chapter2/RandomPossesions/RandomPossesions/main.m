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


        BNRItem *p = [[BNRItem alloc] initWithItemName:@"Red Sofa"
                                        valueInDollars:100
                                          serialNumber:@"A1B2C"];

        NSLog(@"%@", p);

        items = nil;
    }
    return 0;
}
