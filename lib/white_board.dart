import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class WhiteBoardAction {
  static const MethodChannel _channel =
      const MethodChannel('flutter_whiteboard');
/*   工具   */
  /// 铅笔
  static usePencil() async {
    await _channel.invokeMethod('usePencil');
  }

  /// 文本
  static useText() async {
    await _channel.invokeMethod('useText');
  }

  /// 选择工具
  static useSelector() async {
    await _channel.invokeMethod('useSelector');
  }

  /// 椭圆工具
  static useEllipse() async {
    await _channel.invokeMethod('useEllipse');
  }

  /// 矩形工具
  static useRectangle() async {
    await _channel.invokeMethod('useRectangle');
  }

  /// 橡皮擦工具
  static useEraser() async {
    await _channel.invokeMethod('useEraser');
  }

  /// 直线工具
  static useStraight() async {
    await _channel.invokeMethod('useStraight');
  }

  /// 箭头工具
  static useArrow() async {
    await _channel.invokeMethod('useArrow');
  }

  /// 抓手工具
  static useHand() async {
    await _channel.invokeMethod('useHand');
  }

  /// 激光笔工具
  static useLaserPointer() async {
    await _channel.invokeMethod('useLaserPointer');
  }

  /// 三角形工具
  static useTriangle() async {
    await _channel.invokeMethod('useTriangle');
  }

  /// 菱形工具
  static useRhombus() async {
    await _channel.invokeMethod('useRhombus');
  }

  /// 五角星工具
  static usePentagram() async {
    await _channel.invokeMethod('usePentagram');
  }

  /// 对话气泡工具
  static useSpeechBalloon() async {
    await _channel.invokeMethod('useSpeechBalloon');
  }

  /*   *****  */

  /// 主动断开链接
  static Future<dynamic> disconnect() async {
    return await _channel.invokeMethod('disconnect');
  }

  /// 清屏
  static cleanScene() async {
    await _channel.invokeMethod('cleanScene');
  }

  /// 插入图片
  static insertImage(src) async {
    await _channel.invokeMethod(
      'insertImage',
      {'src': src},
    );
  }

  /// 插入 PPT
  static insertPpt(src) async {
    await _channel.invokeMethod(
      'insertPpt',
      {'src': src},
    );
  }

  /// 插入 动态PPT
  static insertDynamicPpt({
    @required src,
    @required roomToken,
  }) async {
    await _channel.invokeMethod(
      'insertDynamicPpt',
      {
        'src': src,
        'roomToken': roomToken,
      },
    );
  }

  /// ppt 上一步
  static pptPreviousStep() async {
    await _channel.invokeMethod('pptPreviousStep');
  }

  /// ppt 下一步
  static pptNextStep() async {
    await _channel.invokeMethod('pptNextStep');
  }

//修改布局
  static resize() async {
    await _channel.invokeMethod('resize');
  }

  //主播视角
  static broadcast() async {
    await _channel.invokeMethod('broadcast');
  }

  //观众视角（跟随视角模式）
  static follower() async {
    await _channel.invokeMethod('follower');
  }

  //铺满屏幕
  static scalePptToFit() async {
    await _channel.invokeMethod('scalePptToFit');
  }

  //操作
  static operation() async {
    await _channel.invokeMethod('operation');
  }

  //删除
  static deleteOperation() async {
    await _channel.invokeMethod('deleteOperation');
  }

  //移动整体视角
  static urrentViewMode() async {
    await _channel.invokeMethod('moveRectange');
  }

  //当前视角状态
  static currentViewMode() async {
    await _channel.invokeMethod('currentViewMode');
  }

  //发送自定义事件
  static customEvent() async {
    await _channel.invokeMethod('customEvent');
  }

  //插入静态ppt
  static insertStaticPpt() async {
    await _channel.invokeMethod('insertStaticPpt');
  }

  //插入动态 PPT(有zip)
  static insertDynamicZip() async {
    await _channel.invokeMethod('insertDynamicZip');
  }

  //获取预览截图
  static getPreviewImage() async {
    await _channel.invokeMethod('getPreviewImage');
  }

  //获取场景完整封面
  static getSnapshot() async {
    await _channel.invokeMethod('getSnapshot');
  }

  //获取PPT
  static getPpt() async {
    await _channel.invokeMethod('getPpt');
  }

  //获取页面数据
  static getScene() async {
    await _channel.invokeMethod('getScene');
  }

  //下一页
  static nextScene() async {
    await _channel.invokeMethod('nextScene');
  }

  //获取连接状态
  static etRoomPhase() async {
    await _channel.invokeMethod('deleteOperation');
  }

  //视野锁定
  static disableCamera() async {
    await _channel.invokeMethod('disableCamera');
  }

  //禁止操作
  static readOnly() async {
    await _channel.invokeMethod('readOnly');
  }

  //恢复操作
  static enable() async {
    await _channel.invokeMethod('enable');
  }

  //颜色
  static color() async {
    await _channel.invokeMethod('color');
  }

  //坐标转换
  static convertP() async {
    await _channel.invokeMethod('convertP');
  }

  //缩放
  static scale() async {
    await _channel.invokeMethod('scale');
  }
}

class WhiteBoard extends StatefulWidget {
  final String appIdentifier;
  final String uuid;
  final String roomToken;
  const WhiteBoard({
    Key? key,
    required this.appIdentifier,
    required this.uuid,
    required this.roomToken,
  }) : super(key: key);

  @override
  _WhiteBoardState createState() => _WhiteBoardState();
}

class _WhiteBoardState extends State<WhiteBoard> {
  @override
  Widget build(BuildContext context) {
    const viewid = 'white_board';
    //配置
    dynamic map = {
      'appIdentifier': widget.appIdentifier,
      'uuid': widget.uuid,
      'roomToken': widget.roomToken,
    };

    if (defaultTargetPlatform == TargetPlatform.android) {
      //安卓
      return AndroidView(
        viewType: viewid,
        creationParams: map,
        creationParamsCodec: JSONMessageCodec(),
      );
    } else {
      //ios
      return UiKitView(
        viewType: viewid,
        creationParams: map,
        creationParamsCodec: JSONMessageCodec(),
      );
    }
  }
}
