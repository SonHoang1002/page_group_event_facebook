import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:self_facebook_project/general/common_page.dart';
import 'package:self_facebook_project/modules/page/blocs/current_number_page.dart';
import 'package:self_facebook_project/modules/page/blocs/name_bloc.dart';
import 'package:self_facebook_project/modules/page/blocs/select_province_page_bloc.dart';
import 'package:self_facebook_project/modules/page/model/name_model.dart';
import 'package:self_facebook_project/modules/page/export_page.dart';

class InformationPagePage extends StatefulWidget {
  @override
  State<InformationPagePage> createState() => _InformationPagePageState();
}

class _InformationPagePageState extends State<InformationPagePage> {
  late double width = 0;
  late double height = 0;
  late NamePageModel namePageModel;
  List<int> radioGroupWorkTime = [0, 1, 2];
  final _informationKey = GlobalKey<FormState>();

  int currentValue = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    width = size.width;
    height = size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          context.read<CurrentNumberPageCubit>().updateCurrentNumberPageCubit(
              context.read<CurrentNumberPageCubit>().state - 1);
          Navigator.of(context).pop();
        },
      )),
      body: BlocBuilder<NamePageBloc, NamePageState>(
          builder: (context, namePageState) {
        namePageModel =
            BlocProvider.of<NamePageBloc>(context).state.namePageModel;
        return GestureDetector(
          onTap: (() {
            FocusManager.instance.primaryFocus!.unfocus();
          }),
          child: Column(children: [
            Container(
              height: height * 0.78055,
              color: Colors.black87,
              child: ListView(
                children: [
                  Container(
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: Form(
                        key: _informationKey,
                        child: Column(
                          children: [
                            // set up page title
                            Row(
                              children: [
                                Text(
                                  InformationPageCommon.TITLE_INFO[0],
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            // congratulation subtitle
                            Text(InformationPageCommon.TITLE_INFO[1],
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 18)),
                            const SizedBox(
                              height: 10,
                            ),
                            // chung
                            _buildTitlePart(CupertinoIcons.info_circle_fill,
                                [InformationPageCommon.TITLE_INFO[2]]),
                            _buildTextFormField(
                                InformationPageCommon.PLACEHOLDER_INFO[0]),
                            // mo ta ve trang cua ban
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              child: Row(
                                children: [
                                  Text("Mô tả về Trang của bạn",
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 18)),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            // Thong tin lien he
                            // trang web input
                            _buildTitlePart(Icons.person,
                                [InformationPageCommon.TITLE_INFO[3]]),
                            _buildTextFormField(
                                InformationPageCommon.PLACEHOLDER_INFO[1]),
                            SizedBox(
                              height: 10,
                            ),
                            //email input
                            _buildTextFormField(
                                InformationPageCommon.PLACEHOLDER_INFO[2]),
                            SizedBox(
                              height: 10,
                            ),
                            //sdt input
                            _buildTextFormField(
                                InformationPageCommon.PLACEHOLDER_INFO[3]),
                            SizedBox(
                              height: 10,
                            ),
                      
                            // Vi tri title
                            _buildTitlePart(Icons.location_on,
                                [InformationPageCommon.TITLE_INFO[4]]),
                            //vi tri input
                            _buildTextFormField(
                                InformationPageCommon.PLACEHOLDER_INFO[4]),
                            SizedBox(
                              height: 10,
                            ),
                            // tinh, thanh pho input
                            _buildProviceInput(context,
                                InformationPageCommon.PLACEHOLDER_INFO[5]),
                            SizedBox(
                              height: 10,
                            ),
                            // ma zip input
                            _buildTextFormField(
                                InformationPageCommon.PLACEHOLDER_INFO[6]),
                            SizedBox(
                              height: 10,
                            ),
                            // gio lam viec
                            _buildTitlePart(Icons.timelapse_rounded, [
                              InformationPageCommon.TITLE_INFO[5],
                              InformationPageCommon.SUB_TITLE_WORK_TIME
                            ]),
                            // ko co gio lam viec
                            _buildRadioWorkTime(0),
                            // luon mo cua
                            _buildRadioWorkTime(1),
                            // gio lam viec tieu chuan
                            _buildRadioWorkTime(2),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            /// bottom
            BlocBuilder<CurrentNumberPageCubit, int>(
                builder: (context, currentNumberPage) {
              return Container(
                height: 70,
                color: Colors.black87,
                child: Column(children: [
                  Center(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            fixedSize: Size(width * 0.9, 40),
                            backgroundColor: Colors.blue),
                        onPressed: () {
                          context
                              .read<CurrentNumberPageCubit>()
                              .updateCurrentNumberPageCubit(
                                  currentNumberPage + 1);
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (_) => AvatarPage()));
                        },
                        child: Text(currentNumberPage == 7
                            ? CommonPage.DONE
                            : CommonPage.NEXT)),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Center(
                      child: Container(
                    height: 6,
                    width: width * 0.9,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 7,
                        itemBuilder: ((context, index) {
                          return Container(
                            margin: EdgeInsets.fromLTRB(
                                index == 0 ? 0 : 5, 0, index == 6 ? 0 : 5, 0),
                            width: width * 0.10555,
                            // height: 2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: index <= currentNumberPage - 1
                                  ? Colors.blue
                                  : Colors.grey[800],
                            ),
                          );
                        })),
                  ))
                ]),
              );
            }),
          ]),
        );
      }),
    );
  }

  Widget _buildProviceInput(BuildContext context, String title) {
    return GestureDetector(
      onTap: (() {
        _showBottomSheetForSelectProvince(context);
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
                  Text(title,
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

  Widget _buildTextFormField(
      // TextEditingController controller,
      String placeHolder) {
    return TextFormField(
      // controller: controller,
      onChanged: ((value) {}),
      validator: (value) {
        if(placeHolder == InformationPageCommon.PLACEHOLDER_INFO[1]){
          // validate web link
        }else if(placeHolder ==InformationPageCommon.PLACEHOLDER_INFO[2]){
          // validate web link
        }else if(placeHolder ==InformationPageCommon.PLACEHOLDER_INFO[3]){
          // validate phone 
        }else if(placeHolder ==InformationPageCommon.PLACEHOLDER_INFO[6]){
          // validate ma zip
        }else{

        }
      },
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
          suffix: placeHolder == InformationPageCommon.PLACEHOLDER_INFO[5]
              ? Icon(
                  // Icons.next_plan,
                  CupertinoIcons.greaterthan,
                  color: Colors.white,
                )
              : null,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: Colors.grey, width: 2),
          ),
          hintText: placeHolder,
          hintStyle: TextStyle(
            color: Colors.grey,
          ),
          contentPadding: EdgeInsets.fromLTRB(10, 5, 0, 30),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)))),
    );
  }

  Widget _buildRadioWorkTime(int indexOfRadio) {
    return RadioListTile(
      groupValue: currentValue,
      title: Text(
        InformationPageCommon.CONTENT_OF_WORK_TIME[indexOfRadio][0],
        style: TextStyle(color: Colors.white, fontSize: 17),
      ),
      subtitle: Text(
        InformationPageCommon.CONTENT_OF_WORK_TIME[indexOfRadio][1],
        style: TextStyle(color: Colors.grey, fontSize: 15),
      ),
      onChanged: ((value) {
        setState(() {
          currentValue = value as int;
        });
        print(currentValue);
      }),
      value: radioGroupWorkTime[indexOfRadio],
    );
  }

  Widget _buildTitlePart(IconData icon, List<String> listValue) {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      child: Row(
        children: [
          Flexible(
            flex: 3,
            child: Container(
              margin: EdgeInsets.only(right: 10),
              height: 40,
              width: 40,
              child: Center(
                child: Icon(
                  icon,
                  color: Colors.white,
                ),
              ),
              decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.all(Radius.circular(20))),
            ),
          ),
          Flexible(
            flex: 20,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: listValue.map(
                  (value) {
                    if (value == InformationPageCommon.SUB_TITLE_WORK_TIME) {
                      return Row(
                        children: [
                          Text(value,
                              style: const TextStyle(
                                  color: Colors.grey, fontSize: 15)),
                        ],
                      );
                    }
                    return Row(
                      children: [
                        Text(value,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 18)),
                      ],
                    );
                  },
                ).toList()),
          ),
        ],
      ),
    );
  }

  _showBottomSheetForSelectProvince(BuildContext context) {
    showMaterialModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setStateFull) {
            return BlocBuilder<SelectProvinceBloc, SelectProvinceState>(
                builder: (context, state) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                height: height * 0.8,
                decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                        topLeft: Radius.circular(15))),
                child: Column(children: [
                  // drag and drop navbar
                  Container(
                    padding: EdgeInsets.only(top: 5),
                    margin: EdgeInsets.only(bottom: 10),
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
                  // province input

                  Container(
                    height: 80,
                    child: TextFormField(
                      // controller: controller,
                      onChanged: ((value) {
                        context
                            .read<SelectProvinceBloc>()
                            .add(UpdateSelectProvinceEvent(value));
                      }),
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide:
                                BorderSide(color: Colors.grey, width: 2),
                          ),
                          hintText:
                              "Tìm kiếm tỉnh/ thành phố/ thị xã/ thị trấn",
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          contentPadding: EdgeInsets.fromLTRB(10, 5, 0, 30),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)))),
                    ),
                  ),
                  Container(
                      height: 250,
                      child: ListView.builder(
                          itemCount:
                              BlocProvider.of<SelectProvinceBloc>(context)
                                  .state
                                  .selectList
                                  .length,
                          itemBuilder: ((context, index) {
                            if (BlocProvider.of<SelectProvinceBloc>(context)
                                    .state
                                    .selectList
                                    .length !=
                                0) {
                              return Container(
                                padding: EdgeInsets.only(left: 10),
                                height: 40,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                        child: Flex(
                                      direction: Axis.horizontal,
                                      children: [
                                        Text(
                                          BlocProvider.of<SelectProvinceBloc>(
                                                  context)
                                              .state
                                              .selectList[index],
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                          ),
                                        )
                                      ],
                                    )),
                                    Divider(
                                      height: 2,
                                      color: Colors.white,
                                    )
                                  ],
                                ),
                              );
                            }
                            return Center(
                                child: Text(" Không có dữ liệu",
                                    style: TextStyle(color: Colors.white)));
                          }))),
                ]),
              );
            });
          });
        });
  }
}
