//
//  RSITF14Generator.m
//  RSBarcodesSample
//
//  Created by R0CKSTAR on 3/17/14.
//  Copyright (c) 2014 P.D.Q. All rights reserved.
//

#import "RSITF14Generator.h"

NSString *const RSMetadataObjectTypeITF14Code = @"com.pdq.rsbarcodes.itf14";

@implementation RSITF14Generator

static NSString *const ITF14_CHARACTER_ENCODINGS[10] = {
    @"00110", @"10001", @"01001", @"11000", @"00101",
    @"10100", @"01100", @"00011", @"10010", @"01010", };

- (NSString *)initiator {
    return @"1010";
}

- (NSString *)terminator {
    return @"1101";
}

- (BOOL)isContentsValid:(NSString *)contents {
    if ([super isContentsValid:contents] && [contents length] == 14) {
        return YES;
    }
    return NO;
}

- (NSString *)barcode:(NSString *)contents {
    NSMutableString *barcode = [[NSMutableString alloc] initWithString:@""];
    for (int i = 0; i < contents.length / 2; i++) {
        NSString *pair = [contents substringWithRange:NSMakeRange(i * 2, 2)];
        NSString *bars = ITF14_CHARACTER_ENCODINGS[
                                                   [[pair substringWithRange:NSMakeRange(0, 1)] intValue]];
        NSString *spaces = ITF14_CHARACTER_ENCODINGS[
                                                     [[pair substringWithRange:NSMakeRange(1, 1)] intValue]];
        for (int j = 0; j < 10; j++) {
            if (j % 2 == 0) {
                int bar = [[bars substringWithRange:NSMakeRange(j / 2, 1)] intValue];
                if (bar == 1) {
                    [barcode appendString:@"11"];
                } else {
                    [barcode appendString:@"1"];
                }
            } else {
                int space =
                [[spaces substringWithRange:NSMakeRange(j / 2, 1)] intValue];
                if (space == 1) {
                    [barcode appendString:@"00"];
                } else {
                    [barcode appendString:@"0"];
                }
            }
        }
    }
    return [NSString stringWithString:barcode];
}

@end
