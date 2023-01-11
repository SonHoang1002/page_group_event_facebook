import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:self_facebook_project/general/common_group.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TestWidget extends StatelessWidget {
  const TestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 400,
        decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15))),
        child: ListView.builder(
            itemCount: 12,
            itemBuilder: ((context, index) {
              return _buildFlexibleComponent(
                  context,
                  SvgPicture.asset(
                    CreatePostGroupCommon.ICON_PATH_LIST[index],
                    color: CreatePostGroupCommon.COLOR_LIST[index],
                    fit: BoxFit.contain,
                  ),
                  [CreatePostGroupCommon.CONTENT_LIST[index]]);
            })),
      ),
    );
  }
}

Widget _buildFlexibleComponent(
    BuildContext context, Widget prefixWidget, List<String> listContent,
    {Widget? suffixWidget, Widget? subTitleWidget}) {
  return Container(
    padding: EdgeInsets.only(top: 5),
    child: Row(
      children: [
        Flexible(
          flex: 2,
          child: Container(
            margin: EdgeInsets.only(right: 10),
            height: 20,
            width: 20,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                color: Colors.grey[700]
                ),
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
                  Container(
                    // width: 250,
                    margin: EdgeInsets.only(bottom: 2),
                    child: Text(listContent[0],
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold)),
                  ),
                  listContent.length == 2
                      ? Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.white,
                                  style: BorderStyle.solid),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          child: Center(
                              child: Text(listContent[1],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                  ))),
                        )
                      : subTitleWidget ?? Container()
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
