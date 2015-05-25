//
//  GSKMutableColor.h
//  Pods
//
//  Created by Julian Raschke on 25.05.15.
//
//

#import "GSKColor.h"


@interface GSKMutableColor : GSKColor

@property (nonatomic, readwrite) NSInteger alpha;
@property (nonatomic, readwrite) NSInteger red;
@property (nonatomic, readwrite) NSInteger blue;
@property (nonatomic, readwrite) NSInteger green;
@property (nonatomic, readwrite) CGFloat hue;
@property (nonatomic, readwrite) CGFloat saturation;
@property (nonatomic, readwrite) CGFloat value;

@end
