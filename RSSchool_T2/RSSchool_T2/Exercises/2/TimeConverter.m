#import "TimeConverter.h"

@implementation TimeConverter
// Complete the following function
//trotnic's watermark
- (NSString*)convertFromHours:(NSString*)hours minutes:(NSString*)minutes {
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterSpellOutStyle];
    NSInteger hoursInt = [hours intValue];
    NSInteger minutesInt = [minutes intValue];
    
    NSString *minutesString = @"";
    NSString *hoursString = @"";
    NSString *minutesPostfix = @"";
    NSString *concatenator = @"";
    NSString *hoursPostfix = @"";
    
    NSArray<NSString*> *singleDigits = @[@"zero", @"one", @"two", @"three", @"four", @"five", @"six", @"seven", @"eight", @"nine"];
    NSArray<NSString*> *twoDigits = @[@"ten", @"eleven", @"twelve", @"thirteen", @"fourteen", @"fifteen", @"sixteen", @"seventeen", @"eighteen", @"nineteen"];
    NSArray<NSString*> *tensMultiple = @[@"twenty", @"thirty", @"fourthy", @"fifty"];
    
    if(minutesInt < 0 || minutesInt >= 60 || hoursInt < 0 || hoursInt >= 24) {
        return @"";
    }
    
    if(minutesInt < 60 && minutesInt > 30) {
        if((60 - minutesInt) == 15) {
            minutesString = @"quarter";
        } else {
            NSString *minutesCopy = [NSString stringWithFormat:@"%ld", (60 - minutesInt)];
            if([minutesCopy length] == 1) {
                minutesString = [singleDigits objectAtIndex:[minutesCopy intValue]];
            } else if([[minutesCopy substringWithRange:NSMakeRange(0, 1)] isEqualToString:@"1"]) {
                minutesString = [twoDigits objectAtIndex:((60 - minutesInt) % 10)];
            } else if([[minutesCopy substringWithRange:NSMakeRange(0, 1)] isEqualToString:@"2"]) {
                minutesString = [NSString stringWithFormat:@"%@ %@",[tensMultiple objectAtIndex:0], [singleDigits objectAtIndex:((60 - minutesInt) % 10)]];
            }
            minutesPostfix = @" minutes";
        }
        concatenator = @" to ";
        hoursInt++;
    } else if(minutesInt > 1 && minutesInt < 30) {
        if(minutesInt == 15) {
            minutesString = @"quarter";
        } else {
            if([[minutes substringWithRange:NSMakeRange(0, 1)] isEqualToString:@"1"]) {
                minutesString = [twoDigits objectAtIndex:(minutesInt % 10)];
            } else if([[minutes substringWithRange:NSMakeRange(0, 1)] isEqualToString:@"2"]) {
                minutesString = [NSString stringWithFormat:@"%@ %@", [tensMultiple objectAtIndex:0], [singleDigits objectAtIndex:(minutesInt % 10)]];
            } else if([[minutes substringWithRange:NSMakeRange(0, 1)] isEqualToString:@"0"]) {
                minutesString = [singleDigits objectAtIndex:(minutesInt % 10)];
            }
            minutesPostfix = @" minutes";
        }
        concatenator = @" past ";
    } else if(minutesInt == 1) {
        minutesString = @"one";
        minutesPostfix = @" minute";
        concatenator = @" past ";
    } else if(minutesInt == 0) {
        hoursPostfix = @" o' clock";
    } else if(minutesInt == 30) {
        minutesPostfix = @"half";
        concatenator = @" past ";
    }
    
    if([hours length] == 1) {
        hoursString = [singleDigits objectAtIndex:hoursInt];
    } else if([[hours substringWithRange:NSMakeRange(0, 1)] isEqualToString:@"1"]) {
        hoursString = [NSString stringWithFormat:@"%@", [twoDigits objectAtIndex:(hoursInt % 10)]];
    } else if([[hours substringWithRange:NSMakeRange(0, 1)] isEqualToString:@"2"]) {
        hoursString = [NSString stringWithFormat:@"%@ %@",@"twenty", [twoDigits objectAtIndex:(hoursInt % 10)]];
    }
    NSString *result = [[NSString alloc] initWithFormat:@"%@%@%@%@%@", minutesString, minutesPostfix, concatenator, hoursString, hoursPostfix];
    
    return result;

    
}



//trotnic's watermark
@end
