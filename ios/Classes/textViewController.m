//
//  textViewController.m
//  flutter_whiteboard
//
//  Created by 魏福成 on 2021/7/21.
//

#import "textViewController.h"
#import "Whiteboard.h"
@interface textViewController ()
@property (nonatomic, strong) WKWebViewConfiguration *config;
@property (nonatomic, strong) WhiteBoardView *boardView;
@property (nonatomic, strong) WhiteSDK *sdk;
@property (nonatomic, strong) WhiteRoom *room;
@property (nonatomic, strong) WhiteMemberState *memberState;
@property (nonatomic, strong) WhiteRoomConfig *roomConfig;
@property (nonatomic, strong) WhiteSdkConfiguration *sdkConfig;
@property (nonatomic, weak, nullable) id commonDelegate;
@property (nonatomic, weak, nullable) id roomCallbackDelegate;
@end

@implementation textViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViews];
    [self initSDK];
    [self joinRoom];
}
// 添加 View
- (void)setupViews
{
    self.config = [[WKWebViewConfiguration alloc] init];
    // // 在此项目中将白板 View 设为全屏
    self.boardView = [[WhiteBoardView alloc] initWithFrame:(CGRectMake(0.0f,0.0f,self.view.bounds.size.width,self.view.bounds.size.height)) configuration:(self.config)];
    [self.view addSubview:(self.boardView)];
}

// 初始化 SDK
- (void)initSDK
{   // 传入互动白板项目的 App Identifier
    self.sdkConfig = [[WhiteSdkConfiguration alloc] initWithApp:@"2vvUAOnIEeu085cPjxnTmA/KI1kNgZ2Kc5I0w"];
    // 设置数据中心为中国杭州
    self.sdkConfig.region = WhiteRegionCN;
    // 初始化 SDK
    self.sdk = [[WhiteSDK alloc] initWithWhiteBoardView:self.boardView config:self.sdkConfig commonCallbackDelegate:self.commonDelegate];
}
// 加入房间
- (void)joinRoom
{   // 设置房间 UUID 和 Room Token
    self.roomConfig = [[WhiteRoomConfig alloc] initWithUuid:@"f14ebfc0ea0811eba057c9eab85067b6" roomToken:@"NETLESSROOM_YWs9VTNxUjV0SkNZNzdVTEpKeSZub25jZT01YjljZDFiMS03YjBmLTQ1ZjUtOWY2Yy0wNjBjZTcyN2Q3ZjYmcm9sZT0wJnNpZz03YWFjNzk5NjU5Yzk1NTY5ZTg5M2MzNjBjNDFjZWY3ZmUwMDA1YzNkNzQwNDY2NTNmMGM5M2ZiY2RjNTY0MTMwJnV1aWQ9ZjE0ZWJmYzBlYTA4MTFlYmEwNTdjOWVhYjg1MDY3YjY"];
    // 设置白板工具
    self.memberState = [[WhiteMemberState alloc] init];
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
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
