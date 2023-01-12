import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:self_facebook_project/general/common_page.dart';
import 'package:self_facebook_project/modules/page/blocs/current_number_page.dart';
import 'package:self_facebook_project/modules/page/blocs/name_bloc.dart';
import 'package:self_facebook_project/modules/page/model/name_model.dart';
import 'package:self_facebook_project/modules/page/export_page.dart';
class InformationPage extends StatefulWidget {
  @override
  State<InformationPage> createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  late double width = 0;
  late double height = 0;
  late NamePageModel namePageModel;
  List<int> radioGroupWorkTime = [0, 1, 2];

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
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                Information.TITLE_INFO[0],
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
                          Text(Information.TITLE_INFO[1],
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 18)),
                          const SizedBox(
                            height: 10,
                          ),
                          // CHUNG
                          _buildTitlePart(CupertinoIcons.info_circle_fill,
                              [Information.TITLE_INFO[2]]),
                          _buildTextFormField(Information.PLACEHOLDER_INFO[0]),
                          // mo ta
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
                          _buildTitlePart(
                              Icons.person, [Information.TITLE_INFO[3]]),
                          _buildTextFormField(Information.PLACEHOLDER_INFO[1]),
                          SizedBox(
                            height: 10,
                          ),
                          _buildTextFormField(Information.PLACEHOLDER_INFO[2]),
                          SizedBox(
                            height: 10,
                          ),
                          _buildTextFormField(Information.PLACEHOLDER_INFO[3]),
                          SizedBox(
                            height: 10,
                          ),

                          // Vi tri
                          _buildTitlePart(
                              Icons.location_on, [Information.TITLE_INFO[4]]),
                          _buildTextFormField(Information.PLACEHOLDER_INFO[4]),
                          SizedBox(
                            height: 10,
                          ),
                          _buildTextFormField(Information.PLACEHOLDER_INFO[5]),
                          SizedBox(
                            height: 10,
                          ),
                          _buildTextFormField(Information.PLACEHOLDER_INFO[6]),
                          SizedBox(
                            height: 10,
                          ),
                          // gio lam viec
                          _buildTitlePart(Icons.timelapse_rounded, [
                            Information.TITLE_INFO[5],
                            Information.SUB_TITLE_WORK_TIME
                          ]),
                          _buildRadioWorkTime(0),
                          _buildRadioWorkTime(1),
                          _buildRadioWorkTime(2),
                        ],
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

  Widget _buildTextFormField(
      // TextEditingController controller,
      String placeHolder) {
    return TextFormField(
      // controller: namePageState.namePageModel.nameController,
      onChanged: ((value) {}),
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
          suffix: placeHolder == Information.PLACEHOLDER_INFO[5]
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
          contentPadding: EdgeInsets.fromLTRB(10, 5, 0, 50),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)))),
    );
  }

  Widget _buildRadioWorkTime(int indexOfRadio) {
    return RadioListTile(
      groupValue: currentValue,
      title: Text(
        Information.CONTENT_OF_WORK_TIME[indexOfRadio][0],
        style: TextStyle(color: Colors.white, fontSize: 17),
      ),
      subtitle: Text(
        Information.CONTENT_OF_WORK_TIME[indexOfRadio][1],
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
                    if (value == Information.SUB_TITLE_WORK_TIME) {
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
}
