import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:self_facebook_project/general/event_constants.dart';
import 'package:self_facebook_project/modules/event/blocs/selection_private_event_bloc.dart';
import 'package:self_facebook_project/modules/event/screen/location_event_page.dart';
import 'package:self_facebook_project/modules/event/widget/information_user_event_widget.dart';
import 'package:self_facebook_project/modules/page/blocs/current_number_page.dart';
import 'package:table_calendar/table_calendar.dart';

class DetailEventPage extends StatefulWidget {
  @override
  State<DetailEventPage> createState() => _DetailEventPageState();
}

class _DetailEventPageState extends State<DetailEventPage> {
  List<dynamic> listRadio =
      DetailEventConstants.SELECTION_FOR_PRIVATE_OF_EVENT.map((e) {
    return e[1];
  }).toList();

  List<dynamic> listSelectionGroup =
      DetailEventConstants.SELECTION_FOR_CHOOSE_GROUP_EVENT.map((e) {
    return e[1];
  }).toList();

  late double width = 0;
  late double height = 0;
  // late String privateRuleValue = "";
  bool isPrivateSelection = true;

  DateTime _startTime = DateTime.now();
  DateTime _endTime = DateTime.now();

  List<int> _startPeriod = [DateTime.now().hour, DateTime.now().minute];
  List<int> _endPeriod = [DateTime.now().hour, DateTime.now().minute];
  bool isHaveEndTime = false;
  bool isOnBeginTime = true;
  late TextEditingController _startTimeController =
      TextEditingController(text: "");
  late TextEditingController _endTimeController =
      TextEditingController(text: "");
  late TextEditingController _nameEventController =
      TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    width = size.width;
    height = size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black87,
      body: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus!.unfocus();
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(children: [
            Expanded(
              child: Column(
                children: [
                  //title app bar
                  Container(
                    margin: EdgeInsets.only(
                      top: 60,
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: GestureDetector(
                              onTap: (() {
                                Navigator.of(context).pop();
                              }),
                              child: Icon(
                                EventConstants.ICON_PRIVIOUS,
                                color: Colors.grey,
                                size: 18,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            child: Text(
                              EventConstants.CANCEL,
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
                          DetailEventConstants.DETAIL_EVENT_TITLE,
                          style: TextStyle(
                              fontSize: 27,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  // space
                  SizedBox(
                    height: 40,
                  ),
                  //user example
                  InformationUserEventWidget(
                    [
                      Text(DetailEventConstants.USER_EXAMPLE[1],
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      SizedBox(
                        height: 5,
                      ),
                      Text(DetailEventConstants.USER_EXAMPLE[2],
                          style: TextStyle(fontSize: 16, color: Colors.grey)),
                    ],
                    prefixWidget: Container(
                        height: 40,
                        width: 40,
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child:
                            Image.asset(DetailEventConstants.USER_EXAMPLE[0])),
                    changeBackground: Colors.transparent,
                    padding: EdgeInsets.zero,
                  ),
                  // space
                  SizedBox(
                    height: 20,
                  ),
                  // name event input
                  Container(
                    height: 50,
                    child: TextFormField(
                      controller: _nameEventController,
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
                          hintText: DetailEventConstants.EVENT_NAME_PLACEHOLDER,
                          labelText:
                              DetailEventConstants.EVENT_NAME_PLACEHOLDER,
                          labelStyle: TextStyle(color: Colors.white),
                          hintStyle: TextStyle(color: Colors.white)),
                    ),
                  ),
                  // space
                  SizedBox(
                    height: 10,
                  ),
                  // startTime input
                  Container(
                    height: 50,
                    child: TextFormField(
                      controller: _startTimeController,
                      readOnly: true,
                      onTap: (() {
                        _startTimeController.text =
                            "${_startTime.day} thg ${_startTime.month} lúc ${_startPeriod[0]}:${_startPeriod[1]}";
                        setState(() {});
                        _showBottomSheetDayAndTimePicker(context);
                      }),
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
                          hintText:
                              DetailEventConstants.DAY_AND_TIME_BEGIN_TITLE,
                          labelText:
                              DetailEventConstants.DAY_AND_TIME_BEGIN_TITLE,
                          labelStyle: TextStyle(color: Colors.white),
                          hintStyle: TextStyle(color: Colors.white)),
                    ),
                  ),
                  // space
                  SizedBox(
                    height: 10,
                  ),
                  //endTime input ( optional input)
                  isHaveEndTime
                      ? Container(
                          height: 50,
                          child: TextFormField(
                            controller: _endTimeController,
                            readOnly: true,
                            onTap: (() {
                              _showBottomSheetDayAndTimePicker(context);
                            }),
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
                                contentPadding:
                                    EdgeInsets.fromLTRB(10, 0, 0, 0),
                                border: InputBorder.none,
                                hintText:
                                    DetailEventConstants.DAY_AND_TIME_END_TITLE,
                                labelText:
                                    DetailEventConstants.DAY_AND_TIME_END_TITLE,
                                labelStyle: TextStyle(color: Colors.white),
                                hintStyle: TextStyle(color: Colors.white)),
                          ),
                        )
                      : Container(),

                  // space
                  SizedBox(
                    height: 5,
                  ),

                  // add day and time function
                  isHaveEndTime
                      ? Container()
                      : GestureDetector(
                          onTap: () {
                            _showBottomSheetDayAndTimePicker(context);
                            isHaveEndTime = true;
                            setState(() {});
                          },
                          child: Row(
                            children: [
                              Text(
                                "+ ${DetailEventConstants.DAY_AND_TIME_END_TITLE}",
                                style: TextStyle(color: Colors.blue),
                              )
                            ],
                          ),
                        ),

                  // space
                  SizedBox(
                    height: 20,
                  ),
                  // divder
                  Divider(
                    height: 10,
                    color: Colors.grey,
                  ),
                  // space
                  SizedBox(
                    height: 15,
                  ),
                  // set private rule
                  GestureDetector(
                    onTap: () {
                      _showBottomSheetPrivateRuleOfEvent(context);
                    },
                    child: InformationUserEventWidget(
                      [
                        Text(DetailEventConstants.PRIVATE_RULE_COMPONENT[1],
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                            BlocProvider.of<SelectionPrivateEventBloc>(context)
                                        .state
                                        .selection !=
                                    ""
                                ? BlocProvider.of<SelectionPrivateEventBloc>(
                                        context)
                                    .state
                                    .selection
                                : DetailEventConstants
                                    .PRIVATE_RULE_COMPONENT[2],
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
                            DetailEventConstants.PRIVATE_RULE_COMPONENT[0],
                            color: Colors.white,
                            size: 15,
                          )),
                      changeBackground: Colors.transparent,
                      padding: EdgeInsets.zero,
                      suffixWidget: Container(
                        alignment: Alignment.centerRight,
                        margin: EdgeInsets.only(right: 10),
                        child: Icon(
                          EventConstants.ICON_DATA_NEXT,
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
            Container(
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
                                    backgroundColor: _nameEventController.text
                                                    .trim() !=
                                                "" &&
                                            BlocProvider.of<SelectionPrivateEventBloc>(
                                                        context)
                                                    .state
                                                    .selection !=
                                                ""
                                        ? Colors.blue
                                        : Colors.grey[800]),
                                onPressed: () {
                                  if (_nameEventController.text.trim() != "" &&
                                      BlocProvider.of<SelectionPrivateEventBloc>(
                                                  context)
                                              .state
                                              .selection !=
                                          "") {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                LocationEventPage()));
                                  }
                                },
                                child: Text(EventConstants.NEXT)),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                    ),
                  ]),
            )
          ]),
        ),
      ),
    );
  }

  // bottom sheet show private rule selections
  _showBottomSheetPrivateRuleOfEvent(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setStateFull) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              height: BlocProvider.of<SelectionPrivateEventBloc>(context)
                          .state
                          .selection ==
                      "Riêng tư"
                  ? 450
                  : 365,
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
                          DetailEventConstants.PRIVATE_OF_EVENT,
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
                    DetailEventConstants.DESCRIPTION_FOR_PRIVATE_OF_EVENT,
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
                        itemCount: DetailEventConstants
                            .SELECTION_FOR_PRIVATE_OF_EVENT.length,
                        itemBuilder: ((context, index) {
                          return GestureDetector(
                            onTap: (() {
                              context.read<SelectionPrivateEventBloc>().add(
                                  UpdateSelectionPrivateEventEvent(
                                      DetailEventConstants
                                              .SELECTION_FOR_PRIVATE_OF_EVENT[
                                          index][1]));
                              if (DetailEventConstants
                                          .SELECTION_FOR_PRIVATE_OF_EVENT[index]
                                      [1] ==
                                  "Nhóm") {
                                _showBottomSheetSelectionGroup(context);
                              }
                              setStateFull(() {});
                              setState(() {});
                            }),
                            child: InformationUserEventWidget(
                              [
                                Text(
                                  DetailEventConstants
                                      .SELECTION_FOR_PRIVATE_OF_EVENT[index][1],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  DetailEventConstants
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
                                  DetailEventConstants
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
                                  context.read<SelectionPrivateEventBloc>().add(
                                      UpdateSelectionPrivateEventEvent(
                                          DetailEventConstants
                                                  .SELECTION_FOR_PRIVATE_OF_EVENT[
                                              index][1]));
                                  setStateFull(() {});
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
                }),
                SizedBox(
                  height: 5,
                ),
                BlocProvider.of<SelectionPrivateEventBloc>(context)
                            .state
                            .selection ==
                        "Riêng tư"
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
                                style: TextStyle(
                                    fontSize: 16, color: Colors.grey)),
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
                      onPressed: () {
                        Navigator.of(context).pop();
                        FocusManager.instance.primaryFocus!.unfocus();
                      },
                      style:
                          ElevatedButton.styleFrom(fixedSize: Size(width, 30)),
                      child: Text(
                        "Xong",
                        style: TextStyle(color: Colors.white),
                      )),
                )
              ]),
            );
          });
        });
  }

  // bottom sheet show group selection after user choose "Ban be" value
  _showBottomSheetSelectionGroup(BuildContext context) {
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
                        DetailEventConstants.SELECTION_GROUP,
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
                    itemCount: DetailEventConstants
                        .SELECTION_FOR_CHOOSE_GROUP_EVENT.length,
                    itemBuilder: ((context1, index) {
                      return InformationUserEventWidget(
                        [
                          Text(
                            DetailEventConstants
                                .SELECTION_FOR_CHOOSE_GROUP_EVENT[index][1],
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            DetailEventConstants
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
                            DetailEventConstants
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
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
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

  // bottom sheet show day and time table for user  choose for day and time input
  _showBottomSheetDayAndTimePicker(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Colors.grey[900],
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setStateFull) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              height: 600,
              decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      topLeft: Radius.circular(15))),
              child: Column(children: [
                // navigate bottom sheet
                Container(
                  margin: EdgeInsets.only(top: 40),
                  height: 50,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: (() {
                            Navigator.of(context).pop();
                          }),
                          child: Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Text("Hủy",
                                style: TextStyle(color: Colors.blue)),
                          ),
                        ),
                        Container(
                          child: Text(
                            "Ngày và giờ",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        GestureDetector(
                          onTap: (() {
                            Navigator.of(context).pop();
                          }),
                          child: Container(
                            margin: EdgeInsets.only(right: 10),
                            child: Text("OK",
                                style: TextStyle(color: Colors.blue)),
                          ),
                        )
                      ]),
                ),
                // begin time
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  height: 30,
                  child: Row(
                      mainAxisAlignment: isHaveEndTime
                          ? MainAxisAlignment.start
                          : MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: (() {
                            isOnBeginTime = true;
                            setStateFull(
                              () {},
                            );
                            setState(() {});
                          }),
                          child: Text(
                              "Bat dau vao: ${_startTime.day}/${_startTime.month}, luc: ${_startPeriod[0]}:${_startPeriod[1]}",
                              style: TextStyle(
                                color:
                                    isOnBeginTime ? Colors.blue : Colors.grey,
                                fontSize: 15,
                              )),
                        ),
                        !isHaveEndTime
                            ? GestureDetector(
                                onTap: (() {
                                  isHaveEndTime = true;
                                  isOnBeginTime = false;

                                  setStateFull(() {});
                                  setState(() {});
                                }),
                                child: Text("+ Thời gian kết thúc",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 15,
                                    )),
                              )
                            : Container(),
                      ]),
                ),

                isHaveEndTime
                    ? Column(
                        children: [
                          //divider
                          Divider(height: 10, color: Colors.green),
                          // end time
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            height: 30,
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: (() {
                                      isOnBeginTime = false;
                                      setStateFull(() {});
                                      setState(() {});
                                    }),
                                    child: Container(
                                      child: Text(
                                          "Ket thuc vao: ${_endTime.day}/${_endTime.month}, luc :${_endPeriod[0]}: ${_endPeriod[1]}",
                                          style: TextStyle(
                                            color: !isOnBeginTime
                                                ? Colors.blue
                                                : Colors.grey,
                                            fontSize: 15,
                                          )),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: (() {
                                      isHaveEndTime = false;
                                      isOnBeginTime = true;
                                      setStateFull(() {});
                                      setState(() {});
                                    }),
                                    child: Container(
                                        child: Icon(
                                      FontAwesomeIcons.close,
                                      color: Colors.white,
                                      size: 18,
                                    )),
                                  ),
                                ]),
                          ),
                        ],
                      )
                    : Container(),
                // table calendar
                Container(
                  color: Colors.grey[300],
                  child: TableCalendar(
                    selectedDayPredicate: (day) {
                      if (isOnBeginTime) {
                        return isSameDay(_startTime, day);
                      }
                      return isSameDay(_endTime, day);
                    },
                    onPageChanged: (focusedDay) {
                      if (isOnBeginTime) {
                        _startTime = focusedDay;
                      }
                      _endTime = focusedDay;
                    },
                    onFormatChanged: (format) {
                      CalendarFormat.week;
                    },
                    onDaySelected: ((selectedDay, focusedDay) {
                      if (isOnBeginTime) {
                        _startTime = selectedDay;
                        _startTimeController.text =
                            "${_startTime.day} thg ${_startTime.month} lúc ${_startPeriod[0]}:${_startPeriod[1]}";
                      } else {
                        _endTime = selectedDay;
                        _endTimeController.text =
                            "${_endTime.day} thg ${_endTime.month} lúc ${_endPeriod[0]}:${_endPeriod[1]}";
                      }

                      setStateFull(() {});
                      setState(() {});
                    }),
                    firstDay: DateTime.utc(1950, 1, 1),
                    lastDay: DateTime.utc(2100, 1, 1),
                    focusedDay: DateTime.now(),
                    headerStyle: HeaderStyle(
                      leftChevronVisible: false,
                      rightChevronVisible: false,
                      headerPadding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                    ),
                  ),
                ),

                // datetime picker
                Container(
                  height: 200,
                  child: CupertinoDatePicker(
                    backgroundColor: Colors.grey[400],
                    mode: CupertinoDatePickerMode.time,
                    onDateTimeChanged: (value) {
                      if (isOnBeginTime) {
                        _startPeriod = [value.hour, value.minute];
                        _startTimeController.text =
                            "${_startTime.day} thg ${_startTime.month} lúc ${_startPeriod[0]}:${_startPeriod[1]}";
                      } else {
                        _endPeriod = [value.hour, value.minute];
                        _endTimeController.text =
                            "${_endTime.day} thg ${_endTime.month} lúc ${_endPeriod[0]}:${_endPeriod[1]}";
                      }
                      setStateFull(
                        () {},
                      );
                      setState(() {});
                    },
                    initialDateTime: DateTime.now(),
                  ),
                ),
              ]),
            );
          });
        });
  }
}
