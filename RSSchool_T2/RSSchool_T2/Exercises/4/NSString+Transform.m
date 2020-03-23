#import "NSString+Transform.h"

@implementation NSString (Transform)

-(NSString*)transform {
    //trotnic's watermark
    
    // I think, there is too much of complex (mainly bad) code,
    // so for future peepings i leave comments here
    // :)))))
    //
    
    // Checking whether it's a whitespace-string
    if([[self stringByReplacingOccurrencesOfString:@" " withString:@""] isEqualToString:@""]) {
        return @"";
    }
    // Trimming extra whitespaces
    self = [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"[^a-zA-Z]" options:0 error:nil];
    // String copy without any nonalphabet symbol
    NSString *selfCopy = [regex stringByReplacingMatchesInString:self options:0 range:NSMakeRange(0, [self length]) withTemplate:@""];
    // English alphabet contains 26 chars, so when set's size less than this value then
    // this sentence is nonpangram, else - pangram
    // stupidly simple, yeah
    //
    NSSet *allCharacters = [NSCharacterSet characterSetWithCharactersInString:[selfCopy lowercaseString]];
    NSCharacterSet *controlSet;
    if([allCharacters count] > 25) {
        controlSet = [NSCharacterSet characterSetWithCharactersInString:@"eyuioa"];
    } else {
        controlSet = [NSCharacterSet characterSetWithCharactersInString:@"qwrtpsdfghjklzxcvbnm"];
    }
    
    regex = [NSRegularExpression regularExpressionWithPattern:@"\\s+" options:0 error:nil];
    
    // Replacing multiple whitespace with one
    // and splitting into array
    NSMutableArray<NSString*> *result = [NSMutableArray arrayWithArray:[[regex stringByReplacingMatchesInString:self options:0 range:NSMakeRange(0, [self length]) withTemplate:@" "] componentsSeparatedByString:@" "]];
    
    // Counting vovels/consonants and modifying strings
    [result enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSMutableString *objCopy = [[NSMutableString alloc] initWithString:obj];
        NSInteger counter = 0;
        for(NSInteger i = 0; i < [obj length]; i++) {
            NSRange range = [[[obj substringWithRange:NSMakeRange(i, 1)] lowercaseString] rangeOfCharacterFromSet:controlSet];
            if(range.location != NSNotFound) {
                objCopy = [objCopy stringByReplacingCharactersInRange:NSMakeRange(i, 1) withString:[[obj substringWithRange:NSMakeRange(i, 1)] uppercaseString]];
                counter++;
            }
        }
        [result replaceObjectAtIndex:idx withObject:[[NSString alloc] initWithFormat:@"%ld%@ ", (long)counter, objCopy]];
    }];
    
    // Sort by the former digit
    [result sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return [[obj1 substringWithRange:NSMakeRange(0, 1)] intValue] - [[obj2 substringWithRange:NSMakeRange(0, 1)] intValue];
    }];
    
    // Join and trim again
    return [[result componentsJoinedByString:@""] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    //trotnic's watermark
}

@end
