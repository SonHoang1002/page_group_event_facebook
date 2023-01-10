import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:self_facebook_project/general/common_group.dart';

Widget buildEmptyInput(BuildContext context) {
  return GestureDetector(
    onTap: (() {
      bottomSheetPrivateRule(context);
    }),
    child: Container(
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
            border: Border.all(color: Colors.white)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Text(CreateGroupCommon.PLACEHOLDER_LIST[1],
                    style: TextStyle(color: Colors.grey, fontSize: 16)),
              ],
            ),
            Row(
              children: [
                Icon(
                  FontAwesomeIcons.caretDown,
                  color: Colors.grey[800],
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
          ],
        )),
  );
}

Widget buildSelectionInput(
    BuildContext context, IconData iconData, String title, String content) {
  return Container(
    // height: 60,
    padding: EdgeInsets.symmetric(vertical: 5),
    child: Row(
      children: [
        Flexible(
          flex: 2,
          child: Container(
            margin: EdgeInsets.only(right: 5),
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                color: Colors.grey[700]),
            child: Icon(iconData,color: Colors.white,),
          ),
        ),
        Flexible(
          flex: 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 20,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Text(title,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 5),
                      child: Text(content,
                          style: TextStyle(color: Colors.white, fontSize: 13)),
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 2,
                child: Checkbox(
                  onChanged: ((value) {}),
                  value: false,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget buildFillInput(
    BuildContext context, IconData iconData, String title, String content) {
  return GestureDetector(
    onTap: (() {
      if (iconData == FontAwesomeIcons.eye) {
        bottomSheetHideGroup(context);
      } else if (iconData == FontAwesomeIcons.earthAmericas) {
        bottomSheetPrivateRule(context);
      }
    }),
    child: Container(
      height: 60,
      padding: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
          border: Border.all(color: Colors.white)),
      child: Row(
        children: [
          Flexible(
            flex: 2,
            child: Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  color: Colors.grey[800]),
              child: Icon(
                iconData,
                color: Colors.white,
              ),
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
                      margin: EdgeInsets.only(top: 5),
                      child: Text(title,
                          style: TextStyle(color: Colors.grey, fontSize: 14)),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 5),
                      child: Text(content,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.caretDown,
                      color: Colors.grey[800],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

bottomSheetPrivateRule(context) {
  showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          height: 220,
          decoration: BoxDecoration(
              color: Colors.grey[800],
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15), topLeft: Radius.circular(15))),
          child: Column(children: [
            Container(
              padding: EdgeInsets.only(top: 5),
              child: Container(
                height: 4,
                width: 40,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                        topLeft: Radius.circular(15))),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 10, 10, 5),
              child: Row(
                children: [
                  Flexible(
                    child: GestureDetector(
                      onTap: (() {
                        Navigator.of(context).pop();
                      }),
                      child: Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                    ),
                    flex: 2,
                  ),
                  Flexible(
                    flex: 10,
                    child: Container(
                        child: Center(
                      child: Text(
                        "Chọn quyền riêng tư",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    )),
                  ),
                ],
              ),
            ),
            Divider(
              height: 4,
              color: Colors.white,
            ),
            SizedBox(
              height: 10,
            ),
            buildSelectionInput(
                context,
                FontAwesomeIcons.earthAmericas,
                "Công khai",
                "Bất kỳ ai cũng có thể nhìn thấy mọi người trong nhóm và những gì họ đăng."),
            buildSelectionInput(context, FontAwesomeIcons.lock, "Riêng tư",
                "Chỉ thành viên mới nhìn thấy mọi người trong nhóm và những gì họ đăng.")
          ]),
        );
      });
}

bottomSheetHideGroup(context) {
  showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          height: 220,
          decoration: BoxDecoration(
              color: Colors.grey[800],
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15), topLeft: Radius.circular(15))),
          child: Column(children: [
            Container(
              padding: EdgeInsets.only(top: 5),
              child: Container(
                height: 4,
                width: 40,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                        topLeft: Radius.circular(15))),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 10, 10, 5),
              child: Row(
                children: [
                  Flexible(
                    child: GestureDetector(
                      onTap: (() {
                        Navigator.of(context).pop();
                      }),
                      child: Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                    ),
                    flex: 2,
                  ),
                  Flexible(
                    flex: 10,
                    child: Container(
                        child: Center(
                      child: Text(
                        "Ẩn nhóm",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    )),
                  ),
                ],
              ),
            ),
            Divider(
              height: 4,
              color: Colors.white,
            ),
            SizedBox(
              height: 10,
            ),
            buildSelectionInput(context, FontAwesomeIcons.eye, "Hiển thị",
                "Ai cũng có thể nhìn thấy nhóm này"),
            buildSelectionInput(context, FontAwesomeIcons.eyeSlash, "Đã ẩn",
                "Chỉ thành viên mới nhìn tháy nhóm này")
          ]),
        );
      });
}
