//
//  ViewController.m
//  Quiz
//
//  Created by Arie Myrmo on 8/6/18.
//  Copyright © 2018 Myrmo. All rights reserved.
//

#import "QuizViewController.h"

/// MARK: Finished August 16, 2018 @MyrmoA

@implementation QuizViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
    {
        // Call the init method implemented by the superclass
        self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
        if (self) {

            // Create two arrays and make the pointers point to them
            questions = [[NSMutableArray alloc] init];
            answers = [[NSMutableArray alloc] init];

            // Add questions and answers to their respective arrays
            [questions addObject:@"Who is the current president of the united states?"];
            [answers addObject:@"Donald Duck"];

            [questions addObject:@"Is 5 a prime number?"];
            [answers addObject:@"Yes"];

            [questions addObject:@"What is 7 + 7?"];
            [answers addObject:@"14"];

            [questions addObject:@"What is the capital of Vermont?"];
            [answers addObject:@"Montpelier"];

            [questions addObject:@"From what is congnac made?"];
            [answers addObject:@"Grapes"];
        }

        // Return the address of the new object
        return self;
}

- (IBAction)showQuestion:(id)sender {
    // Step to the next question
    currentQuestionIndex++;

    // Am I past the last question?
    if (currentQuestionIndex == [questions count]) {

        // Go back to the first question
        currentQuestionIndex = 0;
    }

    // Get the string at that index in the questions array
    NSString *question = [questions objectAtIndex:currentQuestionIndex];

    // Log the string to the console
    NSLog(@"displaying question: %@", question);

    // Display the string in the question field
    [questionField setText:question];

    // Clear the answer field
    [answerField setText:@"???"];
}   

- (IBAction)showAnswer:(id)sender {
    // What is the answer to the current question?
    NSString *answer = [answers objectAtIndex:currentQuestionIndex];

    // Display it in the answer field
    [answerField setText:answer];
}


@end
