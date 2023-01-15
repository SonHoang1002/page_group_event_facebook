import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:self_facebook_project/general/common_page.dart';
import 'package:self_facebook_project/modules/page/blocs/current_number_page.dart';
import 'package:self_facebook_project/modules/page/blocs/name_bloc.dart';
import 'package:self_facebook_project/modules/page/model/name_model.dart';
import 'package:self_facebook_project/modules/page/export_page.dart';
import 'dart:io';

class AvatarPage extends StatefulWidget {
  @override
  State<AvatarPage> createState() => _AvatarPageState();
}

class _AvatarPageState extends State<AvatarPage> {
  late double width = 0;
  late double height = 0;
  late NamePageModel namePageModel;
  List<int> radioGroupWorkTime = [0, 1, 2];

  int currentValue = 0;

  File? _pickedAvatarImage;
  XFile? _imageAvatar;

  File? _pickedBgImage;
  XFile? _imageBg;

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
                                AvatarPageCommon.TITLE_AVATAR[0],
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
                          Text(AvatarPageCommon.TITLE_AVATAR[1],
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 18)),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Stack(
                    children: [
                      // background img Container
                      Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                height: 170,
                                width: width,
                                decoration: BoxDecoration(
                                    color: Colors.grey[800],
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10))),
                                child: _pickedBgImage != null
                                    ? Image.file(
                                        _pickedBgImage!,
                                        fit: BoxFit.fitWidth,
                                      )
                                    : Container(),
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(0, 0, 15, 30),
                                height: 200,
                                // color: Colors.red,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        dialogImgSource();
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 80, top: 80),
                                        child: Card(
                                          shape: RoundedRectangleBorder(
                                              side: BorderSide(width: 2),
                                              borderRadius:
                                                  BorderRadius.circular(30)),
                                          child: const CircleAvatar(
                                            backgroundColor: Colors.grey,
                                            child: Icon(
                                              Icons.camera_alt,
                                              color: Colors.black,
                                              size: 20,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      // avatar img background
                      Container(
                        height: 210,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Center(
                              child: Stack(children: [
                                Container(
                                  height: 120,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      _pickedAvatarImage == null
                                          ? CircleAvatar(
                                              maxRadius: 60,
                                              backgroundImage: AssetImage(
                                                  CommonPage.PATH_IMG +
                                                      "avatar_img.png"))
                                          : CircleAvatar(
                                              maxRadius: 60,
                                              backgroundImage: FileImage(
                                                  _pickedAvatarImage!))
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    dialogImgSource();
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 80, top: 80),
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                          side: BorderSide(width: 2),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: const CircleAvatar(
                                        backgroundColor: Colors.grey,
                                        child: Icon(Icons.camera_alt,
                                            color: Colors.black, size: 20),
                                      ),
                                    ),
                                  ),
                                )
                              ]),
                            ),
                          ],
                        ),
                      ),

                      //
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: Text(
                      "NAME OF PAGE",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Center(
                      child: ElevatedButton(
                    onPressed: () {},
                    child: Text(AvatarPageCommon.TITLE_AVATAR[2]),
                  ))
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
                              MaterialPageRoute(builder: (_) => PhonePage()));
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

  Future getAvatarImage(ImageSource src) async {
    _imageAvatar = (await ImagePicker().pickImage(source: src))!;
    setState(() {
      _pickedAvatarImage = File(_imageAvatar!.path);
    });
  }

  Future getBgImage(ImageSource src) async {
    _imageBg = (await ImagePicker().pickImage(source: src))!;
    setState(() {
      _pickedBgImage = File(_imageBg!.path);
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
                      getAvatarImage(ImageSource.camera);
                      Navigator.of(context).pop();
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.camera),
                    title: const Text("Pick From Galery"),
                    onTap: () {
                      Navigator.of(context).pop();
                      getAvatarImage(ImageSource.gallery);
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
}
