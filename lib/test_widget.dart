import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:self_facebook_project/modules/page/blocs/current_number_page.dart';
import 'package:self_facebook_project/modules/page/blocs/name_bloc.dart';
import 'package:self_facebook_project/modules/page/model/name_model.dart';

const List<String> QUESTION_NAME = [
  "Tên Trang của bạn là gì ?",
  "Hãy dùng tên doanh nghiệp/thương hiệu/tổ chức của bạn hoặc tên góp phần giải thích về Trang"
];
const String next = "Tiếp";
const String done = "Xong";

class TestWidget extends StatefulWidget {
  @override
  State<TestWidget> createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  late double width = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    width = size.width;
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            //
          },
        )),
        body: Column(children: [
          Expanded(
            child: Container(
              color: Colors.black,
              child: Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Column(
                  children: [
                    Container(
                      // height: 80,
                      color: Colors.green[300],
                      child: Row(
                        children: [
                          Flexible(
                            flex: 10,
                            child: Column(
                              children: [
                                Wrap(
                                  direction: Axis.horizontal,
                                  children: [
                                    selectedArea("Blog Ca nhan"),
                                    selectedArea("Nghe Thuat"),
                                    selectedArea("San pham/ DIch vu"),
                                  ],
                                ),
                                TextFormField(
                                  style: TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    hintText: "Tên Trang",
                                    hintStyle: TextStyle(color: Colors.grey),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Flexible(child: Icon(Icons.search))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ]));
  }
}

Widget selectedArea(String value) {
  return Flex(
    direction: Axis.horizontal,
    children: [
      Container(
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(7)),
            color: Colors.grey),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Center(
                  child: Icon(
                Icons.close_outlined,
                size: 18,
              )),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: Colors.white),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              value,
              style: TextStyle(color: Colors.white, fontSize: 20),
            )
          ],
        ),
      )
    ],
  );
}
