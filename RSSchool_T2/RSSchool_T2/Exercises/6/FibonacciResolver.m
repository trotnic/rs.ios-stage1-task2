#import "FibonacciResolver.h"

@implementation FibonacciResolver
- (NSArray*)productFibonacciSequenceFor:(NSNumber*)number {
    //trotnic's watermark
    NSInteger total = 0;
    NSInteger prev = 1;
    while(total * prev < [number intValue]) {
        total = total + prev;
        prev = total - prev;
    }
    return total*prev > [number intValue] ? @[[NSNumber numberWithInteger:prev], [NSNumber numberWithInteger:total], @0] :
                                            @[[NSNumber numberWithInteger:prev], [NSNumber numberWithInteger:total], @1];
    //trotnic's watermark
}
@end
