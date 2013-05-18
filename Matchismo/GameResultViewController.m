//
//  GameResultViewController.m
//  Matchismo
//
//  Created by Richard Shin on 5/10/13.
//  Copyright (c) 2013 Richard Shin. All rights reserved.
//

#import "GameResultViewController.h"
#import "GameResult.h"

@interface GameResultViewController ()

@property (weak, nonatomic) IBOutlet UITextView *resultTextView;
@property (nonatomic) SEL sortSelector;
@end

@implementation GameResultViewController

- (void)updateUI
{
    NSString *resultString = @"";
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateStyle:NSDateFormatterShortStyle];
    [dateFormat setTimeStyle:NSDateFormatterShortStyle];
    
    for (GameResult *result in [[GameResult allResults] sortedArrayUsingSelector:self.sortSelector])
    {
        resultString = [resultString stringByAppendingFormat:@"%@ score: %d (%@, %gs)\n",
                        result.gameName, result.score, [dateFormat stringFromDate:result.end], round(result.duration)];
    }
    
    self.resultTextView.text = resultString;
}

@synthesize sortSelector = _sortSelector;

- (SEL)sortSelector
{
    if (!_sortSelector) _sortSelector = @selector(compareScoreToGameResult:);
    return _sortSelector;
}

- (void)setSortSelector:(SEL)sortSelector
{
    _sortSelector = sortSelector;
    [self updateUI];
}

- (IBAction)sortByDate {
    self.sortSelector = @selector(compareEndDateToGameResult:);
}

- (IBAction)sortByScore {
    self.sortSelector = @selector(compareScoreToGameResult:);
}

- (IBAction)sortByDuration {
    self.sortSelector = @selector(compareDurationToGameResult:);
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self updateUI];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
