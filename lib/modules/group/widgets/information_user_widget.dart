import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class InformationUserWidget extends StatelessWidget {
  final BuildContext context;
  final Widget prefixWidget;
  final String title;
  final Widget? suffixWidget;
  final Widget? subTitleWidget;

  const InformationUserWidget(
      {super.key,
      required this.context,
      required this.prefixWidget,
      required this.title,
      this.suffixWidget,
      this.subTitleWidget});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 5),
      child: Row(
        children: [
          Flexible(
            flex: 2,
            child: Container(
              margin: EdgeInsets.only(right: 13),
              height: prefixWidget is Image ? 40 : 25,
              width: prefixWidget is Image ? 40 : 25,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  color: prefixWidget is Image
                      ? Colors.grey[700]
                      : Colors.transparent),
              child: prefixWidget,
            ),
          ),
          Flexible(
            flex: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        // width: 200,
                        // color: Colors.red,
                        margin: EdgeInsets.only(bottom: 2),
                        child: Text(title,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    subTitleWidget ?? Container()
                  ],
                ),
                suffixWidget ?? Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
