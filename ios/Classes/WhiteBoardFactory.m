//
//  whiteBoardFactory.m
//  flutter_whiteboard
//
//  Created by 魏福成 on 2021/7/23.
//

#import "WhiteBoardFactory.h"
#import "WhiteBoardCon.h"
@implementation WhiteBoardFactory

static WhiteBoardCon * whiteboardCon = nil;

-(instancetype)initWithRegistrar:(NSObject<FlutterPluginRegistrar> *)registrar{
    self = [super init];
     if (self) {
       _registrar = registrar;
     }

     return self;
}- (nonnull NSObject<FlutterPlatformView> *)createWithFrame:(CGRect)frame viewIdentifier:(int64_t)viewId arguments:(id _Nullable)args {
    whiteboardCon =[[WhiteBoardCon alloc]initWithViewId:viewId frame:frame registrar:_registrar arguments:args];
    return  whiteboardCon;
}

-(NSObject<FlutterMessageCodec> *)createArgsCodec
{
    return [FlutterJSONMessageCodec sharedInstance];
}

+ (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result
{
    [whiteboardCon handleMethodCall:call result:result];
}

@end
