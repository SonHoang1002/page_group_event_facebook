import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:self_facebook_project/general/common_group.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:self_facebook_project/modules/group/widgets/addtional_information_group_widget.dart';

class TestWidget extends StatelessWidget {
  const TestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            AddtionalInformationGroupWidget(
              contentWidget: [
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text:
                          "https://www.freecodecamp.org/learn/front-end-development-libraries/#redux",
                      style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                ])),
                SizedBox(
                  height: 10,
                ),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text:
                          "sdfsjdf skjdfksjd skjdgkjdg kfjgf jhiu ndnksdjf dfksjdh sdfksjd sdkfjsd jshgsjdhsdjfs sjdhfgsd fsdnf sdhfs dfgsjd ",
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 16,
                      )),
                ])),
              ],
              prefixWidget: GestureDetector(
                onTap: () {
                  Clipboard.setData(ClipboardData(
                      text:
                          "https://www.freecodecamp.org/learn/front-end-development-libraries/#redux"));
                },
                child: Container(
                  height: 150,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.cabin,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ],
        ));
  }
}
