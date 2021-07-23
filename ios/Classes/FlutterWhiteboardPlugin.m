#import "FlutterWhiteboardPlugin.h"
#import "textViewController.h"
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
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"getPlatformVersion" isEqualToString:call.method]) {
    result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
  }else if ([@"push" isEqualToString:call.method]){
      UIViewController * con = [[textViewController alloc]init];
      UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:con];
      nav.modalPresentationStyle = UIModalPresentationFullScreen;
      [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:nav animated:YES completion:^{

      }];
      
  } else {
    result(FlutterMethodNotImplemented);
  }
}

@end
