import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:self_facebook_project/general/common_event.dart';
import 'package:self_facebook_project/modules/event/blocs/selection_private_event_bloc.dart';
import 'package:self_facebook_project/modules/event/screen/location_event.dart';
import 'package:self_facebook_project/modules/event/widget/information_user_event_widget.dart';
import 'package:self_facebook_project/modules/page/blocs/current_number_page.dart';

class DetailEventPage extends StatelessWidget {
  List<dynamic> listRadio =
      DetailEventCommon.SELECTION_FOR_PRIVATE_OF_EVENT.map((e) {
    return e[1];
  }).toList();

  List<dynamic> listSelectionGroup =
      DetailEventCommon.SELECTION_FOR_CHOOSE_GROUP_EVENT.map((e) {
    return e[1];
  }).toList();
  late double width = 0;
  bool isPrivateSelection = true;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    listRadio.forEach((element) {
      print(element);
    });
    return Scaffold(
      backgroundColor: Colors.black87,
      body: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus!.unfocus();
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(children: [
            //title app bar
            Expanded(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 50),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Icon(
                              CommonEvent.ICON_PRIVIOUS,
                              color: Colors.grey,
                              size: 18,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            child: Text(
                              CommonEvent.CANCEL,
                              style: TextStyle(
                                  color: Colors.grey[200], fontSize: 18),
                            ),
                          )
                        ]),
                  ),
                  // title detail event
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    child: Row(
                      children: [
                        Text(
                          DetailEventCommon.DETAIL_EVENT_TITLE,
                          style: TextStyle(
                              fontSize: 27,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  InformationUserEventWidget(
                    [
                      Text(DetailEventCommon.USER_EXAMPLE[1],
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      SizedBox(
                        height: 5,
                      ),
                      Text(DetailEventCommon.USER_EXAMPLE[2],
                          style: TextStyle(fontSize: 16, color: Colors.grey)),
                    ],
                    prefixWidget: Container(
                        height: 40,
                        width: 40,
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Image.asset(DetailEventCommon.USER_EXAMPLE[0])),
                    changeBackground: Colors.transparent,
                    padding: EdgeInsets.zero,
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  Container(
                    height: 50,
                    child: TextFormField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                          border: InputBorder.none,
                          hintText: DetailEventCommon.EVENT_NAME_PLACEHOLDER,
                          labelText: DetailEventCommon.EVENT_NAME_PLACEHOLDER,
                          labelStyle: TextStyle(color: Colors.white),
                          hintStyle: TextStyle(color: Colors.white)),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 50,
                    child: TextFormField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                          border: InputBorder.none,
                          hintText: DetailEventCommon.DAY_AND_TIME_BEGIN_TITLE,
                          labelText: DetailEventCommon.DAY_AND_TIME_BEGIN_TITLE,
                          labelStyle: TextStyle(color: Colors.white),
                          hintStyle: TextStyle(color: Colors.white)),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        "+ ${DetailEventCommon.DAY_AND_TIME_END_TITLE}",
                        style: TextStyle(color: Colors.blue),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Divider(
                    height: 2,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      showBottomSheetPrivateRuleOfEvent(context);
                    },
                    child: InformationUserEventWidget(
                      [
                        Text(DetailEventCommon.PRIVATE_RULE_COMPONENT[1],
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                        SizedBox(
                          height: 5,
                        ),
                        Text(DetailEventCommon.PRIVATE_RULE_COMPONENT[2],
                            style: TextStyle(fontSize: 16, color: Colors.grey)),
                      ],
                      prefixWidget: Container(
                          height: 40,
                          width: 40,
                          margin: EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                              color: Colors.grey[700],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Icon(
                            DetailEventCommon.PRIVATE_RULE_COMPONENT[0],
                            color: Colors.white,
                            size: 15,
                          )),
                      changeBackground: Colors.transparent,
                      padding: EdgeInsets.zero,
                      suffixWidget: Container(
                        alignment: Alignment.centerRight,
                        margin: EdgeInsets.only(right: 10),
                        child: Icon(
                          CommonEvent.ICON_DATA_NEXT,
                          color: Colors.white,
                          size: 13,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // bottom navigate
            BlocBuilder<CurrentNumberPageCubit, int>(
                builder: (context, currentNumberPage) {
              return Container(
                height: 85,
                color: Colors.black87,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Column(
                          children: [
                            Divider(
                              height: 4,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Center(
                                child: Container(
                              height: 6,
                              width: width * 0.9,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 4,
                                  itemBuilder: ((context, index) {
                                    return Container(
                                      margin: EdgeInsets.fromLTRB(
                                          index == 0 ? 0 : 5,
                                          0,
                                          index == 6 ? 0 : 5,
                                          0),
                                      width: (width * 0.9 - 4 * 7) / 4,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(3),
                                        color: Colors.grey[800],
                                      ),
                                    );
                                  })),
                            )),
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Center(
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      fixedSize: Size(width * 0.9, 40),
                                      backgroundColor: Colors.blue),
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                LocationEventPage()));
                                  },
                                  child: Text(CommonEvent.NEXT)),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                      ),
                    ]),
              );
            }),
          ]),
        ),
      ),
    );
  }

  showBottomSheetPrivateRuleOfEvent(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            height: isPrivateSelection ? 450 : 365,
            decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15))),
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        child: Center(
                      child: Text(
                        DetailEventCommon.PRIVATE_OF_EVENT,
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    )),
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
              Container(
                  child: Center(
                child: Text(
                  DetailEventCommon.DESCRIPTION_FOR_PRIVATE_OF_EVENT,
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
              )),
              SizedBox(
                height: 5,
              ),
              BlocBuilder<SelectionPrivateEventBloc,
                  SelectionPrivateEventState>(builder: (context, state) {
                return Container(
                  height: 200,
                  child: ListView.builder(
                      itemCount: DetailEventCommon
                          .SELECTION_FOR_PRIVATE_OF_EVENT.length,
                      itemBuilder: ((context1, index) {
                        return GestureDetector(
                          onTap: () {
                            showBottomSheetSelectionGroup(context1);
                          },
                          child: InformationUserEventWidget(
                            [
                              Text(
                                DetailEventCommon
                                    .SELECTION_FOR_PRIVATE_OF_EVENT[index][1],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                DetailEventCommon
                                    .SELECTION_FOR_PRIVATE_OF_EVENT[index][2],
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                            prefixWidget: Container(
                              margin: EdgeInsets.only(right: 10),
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  color: Colors.grey[700],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: Icon(
                                DetailEventCommon
                                    .SELECTION_FOR_PRIVATE_OF_EVENT[index][0],
                                color: Colors.white,
                                size: 14,
                              ),
                            ),
                            suffixWidget: Radio(
                              fillColor: MaterialStateProperty.resolveWith(
                                  (states) => Colors.white),
                              groupValue: listRadio,
                              onChanged: ((value) {
                                context.read<SelectionPrivateEventBloc>().add(
                                    UpdateSelectionPrivateEventEvent(
                                        DetailEventCommon
                                                .SELECTION_FOR_PRIVATE_OF_EVENT[
                                            index][1]));
                              }),
                              value: listRadio[index],
                            ),
                            changeBackground: Colors.transparent,
                            padding: EdgeInsets.zero,
                          ),
                        );
                      })),
                );
              }),
              SizedBox(
                height: 5,
              ),
              isPrivateSelection
                  ? Column(children: [
                      Divider(
                        height: 2,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      InformationUserEventWidget(
                        [
                          Text("Khách mời có thể mời bạn bè",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                              "Nếu cài đặt này bật, khách mời có thể mời bạn bè của họ tham gia sự kiện",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey)),
                        ],
                        suffixWidget: Container(
                          // color: Colors.red,
                          child: Switch(
                            onChanged: ((value) {}),
                            value: true,
                          ),
                        ),
                        changeBackground: Colors.transparent,
                        padding: EdgeInsets.only(right: 10),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                    ])
                  : Container(),
              Container(
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(fixedSize: Size(width, 30)),
                    child: Text(
                      "Xong",
                      style: TextStyle(color: Colors.white),
                    )),
              )
            ]),
          );
        });
  }

  showBottomSheetSelectionGroup(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            height: 450,
            decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15))),
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        child: Center(
                      child: Text(
                        DetailEventCommon.SELECTION_GROUP,
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    )),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 5, bottom: 5),
                child: Divider(
                  height: 2,
                  color: Colors.white,
                ),
              ),
              Container(
                height: 335,
                child: ListView.builder(
                    itemCount: DetailEventCommon
                        .SELECTION_FOR_CHOOSE_GROUP_EVENT.length,
                    itemBuilder: ((context1, index) {
                      return InformationUserEventWidget(
                        [
                          Text(
                            DetailEventCommon
                                .SELECTION_FOR_CHOOSE_GROUP_EVENT[index][1],
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            DetailEventCommon
                                .SELECTION_FOR_CHOOSE_GROUP_EVENT[index][2],
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                            ),
                          ),
                        ],
                        prefixWidget: Container(
                          margin: EdgeInsets.only(right: 10),
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              color: Colors.grey[700],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Image.asset(
                            DetailEventCommon
                                .SELECTION_FOR_CHOOSE_GROUP_EVENT[index][0],
                          ),
                        ),
                        suffixWidget: Radio(
                          fillColor: MaterialStateProperty.resolveWith(
                              (states) => Colors.white),
                          groupValue: listSelectionGroup,
                          onChanged: ((value) {}),
                          value: listSelectionGroup[index],
                        ),
                        changeBackground: Colors.transparent,
                        padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                      );
                    })),
              ),
              Container(
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(fixedSize: Size(width, 30)),
                    child: Text(
                      "Lưu",
                      style: TextStyle(color: Colors.white),
                    )),
              )
            ]),
          );
        });
  }
}
