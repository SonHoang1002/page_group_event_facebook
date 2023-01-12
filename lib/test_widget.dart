import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:self_facebook_project/general/common_event.dart';
import 'package:self_facebook_project/general/common_group.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:self_facebook_project/modules/event/blocs/selection_private_event_bloc.dart';
import 'package:self_facebook_project/modules/event/widget/information_user_event_widget.dart';
import 'package:self_facebook_project/modules/group/widgets/addtional_information_group_widget.dart';

class TestWidget extends StatefulWidget {
  @override
  State<TestWidget> createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  List<dynamic> listRadio =
      DetailEventCommon.SELECTION_FOR_PRIVATE_OF_EVENT.map((e) {
    return e[1];
  }).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus!.unfocus();
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(children: [
            //title app bar
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
                        style: TextStyle(color: Colors.grey[200], fontSize: 18),
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
                      borderRadius: BorderRadius.all(Radius.circular(20))),
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
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
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
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
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
                bottomSheetPrivateRule(context);
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
                        borderRadius: BorderRadius.all(Radius.circular(20))),
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
          ]),
        ),
      ),
    );
  }

  bottomSheetPrivateRule(context) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setStatefull) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              height: 320,
              decoration: BoxDecoration(
                  color: Colors.grey[800],
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
                        itemBuilder: ((context, index) {
                          return GestureDetector(
                            onTap: (() {
                               context.read<SelectionPrivateEventBloc>().add(
                                        UpdateSelectionPrivateEventEvent(
                                            DetailEventCommon
                                                    .SELECTION_FOR_PRIVATE_OF_EVENT[
                                                index][1]));
                            }),
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
                                groupValue: context
                                    .read<SelectionPrivateEventBloc>()
                                    .state
                                    .selection,
                                onChanged: ((value) {
                                  setStatefull(() {
                                    context.read<SelectionPrivateEventBloc>().add(
                                        UpdateSelectionPrivateEventEvent(
                                            DetailEventCommon
                                                    .SELECTION_FOR_PRIVATE_OF_EVENT[
                                                index][1]));
                                  });
                                  setState(() {});
                                }),
                                value: listRadio[index],
                              ),
                              changeBackground: Colors.transparent,
                              padding: EdgeInsets.zero,
                            ),
                          );
                        })),
                  );
                })
              ]),
            );
          });
        });
  }
}
