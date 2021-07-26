#import "FlutterWhiteboardPlugin.h"
#import "WhiteBoardFactory.h"
@implementation FlutterWhiteboardPlugin
{
    UIViewController * rooteViewController;
    
}
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"flutter_whiteboard"
            binaryMessenger:[registrar messenger]];
  FlutterWhiteboardPlugin* instance = [[FlutterWhiteboardPlugin alloc] init];

  [registrar addMethodCallDelegate:instance channel:channel];
    
    [registrar registerViewFactory:[[WhiteBoardFactory alloc]initWithRegistrar:registrar]  withId:@"white_board"];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    [WhiteBoardFactory handleMethodCall:call result:result];
}

@end
