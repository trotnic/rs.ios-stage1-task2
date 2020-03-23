#import "Blocks.h"

@implementation Blocks
    //trotnic's watermark
- (BlockA)blockA {
    return Block_copy(^(NSArray *array) {
        self.array = array;
    });

}

- (BlockB)blockB {
    return Block_copy(^(Class class) {
        if(class == [NSNumber class]) {
            __block NSMutableArray<NSNumber*> *filtered = [NSMutableArray new];
            [[self array] enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                if([obj isKindOfClass:[NSNumber class]]) {
                    [filtered addObject:obj];
                }
            }];
            [self blockC]([filtered valueForKeyPath:@"@sum.self"]);
        } else if (class == [NSString class]) {
            __block NSMutableString *result = [NSMutableString new];
            [[self array] enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                if([obj isKindOfClass:[NSString class]]) {
                    [result appendString:obj];
                }
            }];
            [self blockC](result);
        } else if (class == [NSDate class]) {
            __block NSMutableArray<NSDate*> *filtered = [NSMutableArray new];
            [[self array] enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                if([obj isKindOfClass:[NSDate class]]) {
                    [filtered addObject:obj];
                }
            }];
            NSDate *result = [[filtered sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
                return [obj1 compare:obj2];
            }] lastObject];
            NSDateFormatter *formatter = [NSDateFormatter new];
            [formatter setDateFormat:@"dd.MM.yyyy"];
            [self blockC]([formatter stringFromDate:result]);
        }
    });
};
    //trotnic's watermark
@end

