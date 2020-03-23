#import "Dates.h"

@implementation Dates
//trotnic's watermark
- (NSString *)textForDay:(NSString *)day month:(NSString *)month year:(NSString *)year {
    NSDateFormatter *formatter = [NSDateFormatter new];
    [formatter setDateFormat:@"dd/MM/yyyy'T'HH:mm:sZ"];
    formatter.locale = [NSLocale localeWithLocaleIdentifier:@"ru_BY"];
    NSString *date = [NSString stringWithFormat:@"%@-%@-%@T00:00:00+0000", day, month, year];
    NSDate *dateObj = [formatter dateFromString:date];
    [formatter setDateFormat:@"dd MMMM, EEEE"];
    date = [formatter stringFromDate:dateObj];
    return date ? date : @"Такого дня не существует";
}
//trotnic's watermark
@end
