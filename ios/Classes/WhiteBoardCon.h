//
//  whiteBoard.h
//  flutter_whiteboard
//
//  Created by 魏福成 on 2021/7/23.
//

#import <Foundation/Foundation.h>
#import <Flutter/Flutter.h>

NS_ASSUME_NONNULL_BEGIN

@interface WhiteBoardCon : NSObject<FlutterPlatformView>
- (instancetype)initWithViewId:(int64_t)viewId frame:(CGRect)frame registrar:(NSObject <FlutterPluginRegistrar> *)registrar arguments:(id _Nullable)args;
- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result;
@end

NS_ASSUME_NONNULL_END
