//
//  whiteBoardFactory.h
//  flutter_whiteboard
//
//  Created by 魏福成 on 2021/7/23.
//

#import <Foundation/Foundation.h>
#import <Flutter/Flutter.h>
NS_ASSUME_NONNULL_BEGIN

@interface WhiteBoardFactory : NSObject<FlutterPlatformViewFactory>
- (instancetype)initWithRegistrar:(NSObject <FlutterPluginRegistrar> *)registrar;
+ (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result;
@property(nonatomic) NSObject<FlutterPluginRegistrar>* registrar;

@end

NS_ASSUME_NONNULL_END
