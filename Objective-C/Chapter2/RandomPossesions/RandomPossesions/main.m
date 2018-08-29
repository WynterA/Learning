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

        // Create a mutable array object, store its address in items variable
        NSMutableArray *items = [[NSMutableArray alloc] init];

        for (int i = 0; i < 9; i++) {
            BNRItem *p = [BNRItem randomItem];
            [items addObject:p];
        }

        BNRItem *a = [[BNRItem alloc] initWithItemName:@"NONE" serialNumber:@"FDASFEW23423423"];
        [items addObject:a];
      
//        // Exception example
//        id lastObject = [items lastObject];
//        [lastObject count];
        
        for (BNRItem *item in items) {
            NSLog(@"%@", item);
        }

        items = nil;

        BNRItem *p1=[[BNRItem alloc] initWithItemName:@"Sofa" valueInDollars:123 serialNumber:@"Ds2S4"];
        BNRItem *p2=[[BNRItem alloc] initWithItemName:@"Table" valueInDollars:23 serialNumber:@"WE4r5"];
        BNRItem *p3=[[BNRItem alloc] initWithItemName:@"Chair" valueInDollars:99 serialNumber:@"R4DF6"];
        BNRContainer *con1=[[BNRContainer alloc] initWithContainerName:@"First" valueInDollars:12];
        [con1 addItem:p1];
        [con1 addItem:p2];
        [con1 addItem:p3];
        [con1 list];
    }
    return 0;
}
