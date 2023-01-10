import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:self_facebook_project/general/common_group.dart';
import 'package:self_facebook_project/general/common_page.dart';
import 'package:self_facebook_project/modules/group/screen/description_group_page.dart';
import 'package:self_facebook_project/modules/page/blocs/current_number_page.dart';
import 'package:self_facebook_project/modules/page/blocs/name_bloc.dart';
import 'package:self_facebook_project/modules/page/model/name_model.dart';
import 'package:self_facebook_project/modules/page/register/parts/category_page.dart';
import 'package:self_facebook_project/modules/page/register/parts/phone_page.dart';
import 'dart:io';

import 'package:self_facebook_project/modules/page/register/primary_page.dart';

class CoverImageGroupPage extends StatefulWidget {
  @override
  State<CoverImageGroupPage> createState() => _CoverImageGroupPageState();
}

class _CoverImageGroupPageState extends State<CoverImageGroupPage> {
  late double width = 0;
  late double height = 0;
  late NamePageModel namePageModel;
  List<int> radioGroupWorkTime = [0, 1, 2];

  int currentValue = 0;

  File? _pickedCoverImage;
  XFile? _imageCover;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    width = size.width;
    height = size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          actions: [
            Center(
                child: Container(
              child: Text(CommonGroup.CONTINUE_AFTER),
              margin: EdgeInsets.only(right: 20),
            ))
          ],
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {},
          )),
      body: BlocBuilder<NamePageBloc, NamePageState>(
          builder: (context, namePageState) {
        return GestureDetector(
          onTap: (() {
            FocusManager.instance.primaryFocus!.unfocus();
          }),
          child: Column(children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                color: Colors.black87,
                child: Column(
                  children: [
                    // title
                    Container(
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  CoverImageGroupCommon.TITLE[0],
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Text(CoverImageGroupCommon.SUBTITLE[0],
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 18)),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                Text(
                                  CoverImageGroupCommon.TITLE[1],
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
                          ],
                        ),
                      ),
                    ),
                    // img
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Stack(
                        children: [
                          Container(
                            height: 200,
                            width: width,
                            decoration: BoxDecoration(
                                color: Colors.grey[800]!.withOpacity(0.8),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: _pickedCoverImage != null
                                ? Image.file(
                                    _pickedCoverImage!,
                                    fit: BoxFit.fitWidth,
                                  )
                                : Container(),
                          ),
                          Container(
                            height: 200,
                            child: GestureDetector(
                              onTap: (() {
                                dialogImgSource();
                              }),
                              child: Center(
                                  child: Container(
                                      width: 130,
                                      height: 30,
                                      decoration: BoxDecoration(
                                          color: Colors.grey.withOpacity(0.6),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10))),
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Icon(
                                            FontAwesomeIcons.layerGroup,
                                            color: whiteColor,
                                            size: 13,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            CoverImageGroupCommon
                                                .PLACEHOLDER_LIST[0],
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 13,
                                            ),
                                          )
                                        ],
                                      ))),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //space
                    SizedBox(
                      height: 15,
                    ),
                    // example
                    Container(
                      height: (width * 0.9 - 4 * 8) / 5,
                      // width: width,
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: ((context, index) {
                          return Container(
                            width: (width * 0.9 - 4 * 9) / 5,
                            decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10))),
                            margin: EdgeInsets.fromLTRB(
                                index == 0 ? 0 : 5, 0, index == 4 ? 0 : 5, 0),
                            child: Image.asset(
                              CoverImageGroupCommon.IMG_PATH_LIST[index],
                              fit: BoxFit.fitHeight,
                            ),
                          );
                        }),
                      ),
                    )
                  ],
                ),
              ),
            ),

            /// bottom
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
                                    MaterialPageRoute(builder: (_) => DescriptionGroupPage()));
                                  },
                                  child: Text(CommonPage.NEXT)),
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
        );
      }),
    );
  }

  Future getCoverImage(ImageSource src) async {
    _imageCover = (await ImagePicker().pickImage(source: src))!;
    setState(() {
      _pickedCoverImage = File(_imageCover!.path);
    });
  }

  dialogImgSource() {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  ListTile(
                    leading: const Icon(Icons.camera),
                    title: const Text("Pick From Camera"),
                    onTap: () {
                      getCoverImage(ImageSource.camera);
                      Navigator.of(context).pop();
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.camera),
                    title: const Text("Pick From Galery"),
                    onTap: () {
                      Navigator.of(context).pop();
                      getCoverImage(ImageSource.gallery);
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
}
