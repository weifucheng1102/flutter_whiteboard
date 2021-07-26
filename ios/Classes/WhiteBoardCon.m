//
//  whiteBoard.m
//  flutter_whiteboard
//
//  Created by 魏福成 on 2021/7/23.
//

#import "WhiteBoardCon.h"
#import "Whiteboard.h"
@interface WhiteBoardCon ()
@property (nonatomic, strong) WKWebViewConfiguration *config;
//@property (nonatomic, strong) WhiteBoardView *boardView;
@property (nonatomic, strong) WhiteSDK *sdk;
@property (nonatomic, strong) WhiteRoom *room;
@property (nonatomic, strong) WhiteMemberState *memberState;
@property (nonatomic, strong) WhiteRoomConfig *roomConfig;
@property (nonatomic, strong) WhiteSdkConfiguration *sdkConfig;
@property (nonatomic, weak, nullable) id commonDelegate;
@property (nonatomic, weak, nullable) id roomCallbackDelegate;
@end
@implementation WhiteBoardCon
{
    WhiteBoardView * _whiteview;
    NSString * _uuid;
    NSString * _appIdentifier;
    NSString * _roomToken;
}
- (instancetype)initWithViewId:(int64_t)viewId frame:(CGRect)frame registrar:(NSObject <FlutterPluginRegistrar> *)registrar arguments:(id _Nullable)args {
  self = [super init];
  if (self) {
      _uuid = args[@"uuid"];
      _appIdentifier = args[@"appIdentifier"];
      _roomToken = args[@"roomToken"];
      self.config = [[WKWebViewConfiguration alloc] init];
      _whiteview = [[WhiteBoardView alloc] initWithFrame:(CGRectMake(0.0f,0.0f,0,0)) configuration:(self.config)];
      [self initSDK];
      [self joinRoom];
  }

  return self;
}
- (nonnull WhiteBoardView *)view {
    return _whiteview;
}


// 初始化 SDK
- (void)initSDK
{   // 传入互动白板项目的 App Identifier
    self.sdkConfig = [[WhiteSdkConfiguration alloc] initWithApp:_appIdentifier];
    // 设置数据中心为中国杭州
    self.sdkConfig.region = WhiteRegionCN;
    // 初始化 SDK
    self.sdk = [[WhiteSDK alloc] initWithWhiteBoardView:_whiteview config:self.sdkConfig commonCallbackDelegate:self.commonDelegate];
}
// 加入房间
- (void)joinRoom
{   // 设置房间 UUID 和 Room Token
//    NSDictionary *payload = @{@"avatar": @"https://white-pan.oss-cn-shanghai.aliyuncs.com/40/image/mask.jpg"};
//    self.roomConfig = [[WhiteRoomConfig alloc] initWithUuid:_uuid roomToken:_roomToken userPayload:payload];
    self.roomConfig =[[WhiteRoomConfig alloc] initWithUuid:_uuid roomToken:_roomToken];
    
  
    // 配置，橡皮擦是否能删除图片。默认为 false，能够删除图片。
//         roomConfig.disableEraseImage = YES;
    // 设置最大最小缩放比例，不设置成 0，会导致画面极小时，出现一些问题。默认不是 0
    WhiteCameraBound *bound = [WhiteCameraBound defaultMinContentModeScale:0 maxContentModeScale:10];
    self.roomConfig.cameraBound = bound;
    self.roomConfig.region = WhiteRegionCN;

    
    self.memberState.currentApplianceName = AppliancePencil;
    self.memberState.strokeColor = @[@255, @0, @0];
    // 加入房间
    [self.sdk joinRoomWithConfig:self.roomConfig callbacks:self.roomCallbackDelegate completionHandler:^(BOOL success, WhiteRoom * _Nonnull room, NSError * _Nonnull error) {
           if (success) {
               self.room = room;
               [self.room cleanScene:(NO)];
               [self.room setMemberState:(self.memberState)];
               NSLog(@"Successfully joined the room");
           } else {
               NSLog(@"Errors when joining room");
           }
       }];
}



-(WhiteMemberState*) memberState
{
    if (!_memberState) {
        _memberState = [[WhiteMemberState alloc] init];
    }
    return _memberState;
}
-(void)handleMethodCall:(FlutterMethodCall *)call result:(FlutterResult)result
{
    
    //画笔
    if ([@"usePencil" isEqualToString:call.method]) {
        self.memberState.currentApplianceName = AppliancePencil;
        [self.room setMemberState:self.memberState];
        return;
    }
    //橡皮擦
    if ([@"useEraser" isEqualToString:call.method]) {
        self.memberState.currentApplianceName = ApplianceEraser;
        [self.room setMemberState:self.memberState];
        return;
    }

    //选择
    if ([@"useSelector" isEqualToString:call.method]) {
        self.memberState.currentApplianceName = ApplianceSelector;
        [self.room setMemberState: self.memberState];
        return;
    }
    //输入文字
    if ([@"useText" isEqualToString:call.method]) {
        self.memberState.currentApplianceName = ApplianceText;
        [self.room setMemberState: self.memberState];
        return;
    }
    
    //椭圆工具
    if ([@"useEllipse" isEqualToString:call.method]) {
        self.memberState.currentApplianceName = ApplianceEllipse;
        [self.room setMemberState: self.memberState];
        return;
    }
    //矩形工具
    if ([@"useRectangle" isEqualToString:call.method]) {
        self.memberState.currentApplianceName = ApplianceRectangle;
        [self.room setMemberState: self.memberState];
        return;
    }
    //直线工具
    if ([@"useStraight" isEqualToString:call.method]) {
        self.memberState.currentApplianceName = ApplianceStraight;
        [self.room setMemberState: self.memberState];
        return;
    }
    //箭头工具
    if ([@"useArrow" isEqualToString:call.method]) {
        self.memberState.currentApplianceName = ApplianceArrow;
        [self.room setMemberState: self.memberState];
        return;
    }
    //抓手工具
    if ([@"useHand" isEqualToString:call.method]) {
        self.memberState.currentApplianceName = ApplianceHand;
        [self.room setMemberState: self.memberState];
        return;
    }
    //激光笔工具
    if ([@"useLaserPointer" isEqualToString:call.method]) {
        self.memberState.currentApplianceName = ApplianceLaserPointer;
        [self.room setMemberState: self.memberState];
        return;
    }
    //三角形工具
    if ([@"useTriangle" isEqualToString:call.method]) {
        self.memberState.currentApplianceName = ApplianceShape;
        self.memberState.shapeType = ApplianceShapeTypeTriangle;
        [self.room setMemberState: self.memberState];
        return;
    }
    //菱形工具
    if ([@"useRhombus" isEqualToString:call.method]) {
        self.memberState.currentApplianceName = ApplianceShape;
        self.memberState.shapeType = ApplianceShapeTypeRhombus;
        [self.room setMemberState: self.memberState];
        return;
    }
    
    //五角星工具
    if ([@"usePentagram" isEqualToString:call.method]) {
        self.memberState.currentApplianceName = ApplianceShape;
        self.memberState.shapeType = ApplianceShapeTypePentagram;
        [self.room setMemberState: self.memberState];
        return;
    }
    
    //对话气泡工具
    if ([@"useSpeechBalloon" isEqualToString:call.method]) {
        self.memberState.currentApplianceName = ApplianceShape;
        self.memberState.shapeType = ApplianceShapeTypeSpeechBalloon;
        [self.room setMemberState: self.memberState];
        return;
    }
    
    //断开链接（离开房间）
    if ([@"disconnect" isEqualToString:call.method]) {
        [self.room disconnect:^{
            NSLog(@"房间已断连，如需加入房间，请使用 SDK API，新建 WhiteRoom 实例加入");
            result(@YES);
        }];
        return;
    }
    
    //清屏
    if ([@"cleanScene" isEqualToString:call.method]) {
        [self.room cleanScene:YES];
        return;
    }
    
    //插入图片
    if ([@"insertImage" isEqualToString:call.method]) {
        WhiteImageInformation *info = [[WhiteImageInformation alloc] initWithSize:CGSizeMake(200, 300)];
        [self.room insertImage:info src:call.arguments[@"src"]];
        return;
    }
    
    //插入ppt
    if ([@"insertPpt" isEqualToString:call.method]) {
        WhitePptPage *pptPage = [[WhitePptPage alloc] init];
        pptPage.src =call.arguments[@"src"];
        pptPage.width = 400;
        pptPage.height = 600;
        WhiteScene *scene = [[WhiteScene alloc]  initWithName:@"ppt2" ppt:pptPage];
        [self.room  putScenes:@"/" scenes:@[scene] index:0];
        [self.room setScenePath:@"/ppt2"];
        return;
    }
    
    if([@"insertDynamicPpt" isEqualToString:call.method]){
        WhiteConverter *converter = [[WhiteConverter alloc] initWithRoomToken:call.arguments[@"roomToken"]];
        [converter startConvertTask:call.arguments[@"src"] type:ConvertTypeDynamic progress:^(CGFloat progress, WhiteConversionInfo * _Nullable info) {
            NSLog(@"progress:%f", progress);
        } completionHandler:^(BOOL success, ConvertedFiles * _Nullable ppt, WhiteConversionInfo * _Nullable info, NSError * _Nullable error) {
            NSLog(@"success:%d ppt: %@ error:%@", success, [ppt yy_modelDescription], error);
            
            if (ppt) {
                [self.room putScenes:@"/dynamic" scenes:ppt.scenes index:0];
                [self.room setScenePath:@"/dynamic/1"];
            }
        }];
        return;
    }
    //ppt下一步
    if ([@"pptNextStep" isEqualToString:call.method]) {
        [self.room pptNextStep];
        return;
    }
    //ppt上一步
    if ([@"pptPreviousStep" isEqualToString:call.method]) {
        [self.room pptPreviousStep];
        return;
    }
    
    
    

    result(FlutterMethodNotImplemented);
}



@end
