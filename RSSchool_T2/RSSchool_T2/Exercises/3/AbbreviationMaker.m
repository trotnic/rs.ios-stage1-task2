#import "AbbreviationMaker.h"

@implementation AbbreviationMaker
// Complete the abbreviation function below.
- (NSString *) abbreviationFromA:(NSString *)a toB:(NSString *)b {
    //trotnic's watermark
    NSString *aCopy = [a lowercaseString];
    NSString *bCopy = [b lowercaseString];
    
    NSInteger counter = 0;
    
    //trotnic's watermark
    
    for(NSInteger i = 0; i < [a length]; i++) {
        if([aCopy characterAtIndex:i] == [bCopy characterAtIndex:counter]) {
            counter++;
            if(counter == [bCopy length]) {
                return @"YES";
            }
        }
    }
    
    return @"NO";
    //trotnic's watermark
}
@end
