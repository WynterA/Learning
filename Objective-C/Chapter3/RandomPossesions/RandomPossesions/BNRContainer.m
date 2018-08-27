//
//  BNRContainer.m
//  RandomPossesions
//
//  Created by Arie Myrmo on 8/27/18.
//  Copyright © 2018 Myrmo. All rights reserved.
//

#import "BNRContainer.h"
#import "BNRItem.h"

@implementation BNRContainer
{
    int totalValue;
    int d;
}

@synthesize containerElement,value,containerName;

- (id)initWithContainerName:(NSString *)name valueInDollars:(int)value
{
    self = [super init];

    if(self) {
        containerElement = [NSMutableArray array];
        containerName = [NSString stringWithString:name];
        [self setValue:value];
        [self setContainerName:name];
    }
    return self;
}

- (void)addItem:(id)Item
{
    [containerElement addObject:Item];
}

- (void)list
{
    totalValue = value;
    d = 1;
    NSLog(@"=======================Container: %@=======================",containerName);

    for(BNRItem *ele in containerElement)
    {
        NSLog(@"|%i) %@|" ,d,ele);
        NSLog(@"---------------------------------------------------------------");
        totalValue += ele.valueInDollars;
        d++;
    }

    NSLog(@"| Container value:$%i Container Total Price:$%i |",value,totalValue);
    NSLog(@"---------------------------------------------------------------");
}

@end

