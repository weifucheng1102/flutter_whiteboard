import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_whiteboard/white_board.dart';

class SecondView extends StatefulWidget {
  const SecondView({Key? key}) : super(key: key);

  @override
  _SecondViewState createState() => _SecondViewState();
}

class _SecondViewState extends State<SecondView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width,
            child: WhiteBoard(
              appIdentifier: '2vvUAOnIEeu085cPjxnTmA/KI1kNgZ2Kc5I0w',
              uuid: 'f14ebfc0ea0811eba057c9eab85067b6',
              roomToken:
                  'NETLESSROOM_YWs9VTNxUjV0SkNZNzdVTEpKeSZub25jZT01YjljZDFiMS03YjBmLTQ1ZjUtOWY2Yy0wNjBjZTcyN2Q3ZjYmcm9sZT0wJnNpZz03YWFjNzk5NjU5Yzk1NTY5ZTg5M2MzNjBjNDFjZWY3ZmUwMDA1YzNkNzQwNDY2NTNmMGM5M2ZiY2RjNTY0MTMwJnV1aWQ9ZjE0ZWJmYzBlYTA4MTFlYmEwNTdjOWVhYjg1MDY3YjY',
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                GestureDetector(
                  onTap: () {
                    WhiteBoardAction.usePencil();
                  },
                  child: Text('画笔工具'),
                ),
                GestureDetector(
                  onTap: () {
                    WhiteBoardAction.useEraser();
                  },
                  child: Text('橡皮擦工具'),
                ),
                GestureDetector(
                  onTap: () {
                    WhiteBoardAction.useSelector();
                  },
                  child: Text('选中工具'),
                ),
                GestureDetector(
                  onTap: () {
                    WhiteBoardAction.useText();
                  },
                  child: Text('文本工具'),
                ),
                GestureDetector(
                  onTap: () {
                    WhiteBoardAction.useEllipse();
                  },
                  child: Text('椭圆工具'),
                ),
                GestureDetector(
                  onTap: () {
                    WhiteBoardAction.useRectangle();
                  },
                  child: Text('矩形工具'),
                ),
                GestureDetector(
                  onTap: () {
                    WhiteBoardAction.useStraight();
                  },
                  child: Text('直线工具'),
                ),
                GestureDetector(
                  onTap: () {
                    WhiteBoardAction.useArrow();
                  },
                  child: Text('箭头工具'),
                ),
                GestureDetector(
                  onTap: () {
                    WhiteBoardAction.useHand();
                  },
                  child: Text('抓手工具'),
                ),
                GestureDetector(
                  onTap: () {
                    WhiteBoardAction.useLaserPointer();
                  },
                  child: Text('激光笔工具'),
                ),
                GestureDetector(
                  onTap: () {
                    WhiteBoardAction.useTriangle();
                  },
                  child: Text('三角形工具'),
                ),
                GestureDetector(
                  onTap: () {
                    WhiteBoardAction.useRhombus();
                  },
                  child: Text('菱形工具'),
                ),
                GestureDetector(
                  onTap: () {
                    WhiteBoardAction.usePentagram();
                  },
                  child: Text('五角星工具'),
                ),
                GestureDetector(
                  onTap: () {
                    WhiteBoardAction.useSpeechBalloon();
                  },
                  child: Text('对话气泡工具'),
                ),
                GestureDetector(
                  onTap: () async {
                    WhiteBoardAction.disconnect().then((res) {
                      print(res);
                      Navigator.pop(context);
                    });
                  },
                  child: Text('断开链接 离开房间'),
                ),
                GestureDetector(
                  onTap: () async {
                    WhiteBoardAction.insertImage(
                        'https://white-pan.oss-cn-shanghai.aliyuncs.com/101/image/Rectangle.png');
                  },
                  child: Text('插入图片'),
                ),
                GestureDetector(
                  onTap: () {
                    WhiteBoardAction.cleanScene();
                  },
                  child: Text('清屏'),
                ),
                GestureDetector(
                  onTap: () async {
                    WhiteBoardAction.insertPpt(
                        'https://white-pan.oss-cn-shanghai.aliyuncs.com/101/image/alin-rusu-1239275-unsplash_opt.jpg');
                  },
                  child: Text('插入ppt'),
                ),
                GestureDetector(
                  onTap: () async {
                    WhiteBoardAction.insertDynamicPpt(
                      roomToken:
                          'NETLESSROOM_YWs9VTNxUjV0SkNZNzdVTEpKeSZub25jZT01YjljZDFiMS03YjBmLTQ1ZjUtOWY2Yy0wNjBjZTcyN2Q3ZjYmcm9sZT0wJnNpZz03YWFjNzk5NjU5Yzk1NTY5ZTg5M2MzNjBjNDFjZWY3ZmUwMDA1YzNkNzQwNDY2NTNmMGM5M2ZiY2RjNTY0MTMwJnV1aWQ9ZjE0ZWJmYzBlYTA4MTFlYmEwNTdjOWVhYjg1MDY3YjY',
                      src:
                          'https://white-cn-edge-doc-convert.oss-cn-hangzhou.aliyuncs.com/-1/1.pptx',
                    );
                  },
                  child: Text('插入动态ppt'),
                ),
                GestureDetector(
                  onTap: () async {
                    WhiteBoardAction.pptPreviousStep();
                  },
                  child: Text('ppt上一步'),
                ),
                GestureDetector(
                  onTap: () async {
                    WhiteBoardAction.pptNextStep();
                  },
                  child: Text('ppt下一步'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
