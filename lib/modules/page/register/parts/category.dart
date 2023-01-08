import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:self_facebook_project/general/common.dart';
import 'package:self_facebook_project/modules/page/blocs/current_number_page.dart';
import 'package:self_facebook_project/modules/page/blocs/name_bloc.dart';
import 'package:self_facebook_project/modules/page/model/name_model.dart';
import 'package:self_facebook_project/test_widget.dart';

const List<String> QUESTION_NAME = [
  "Hạng mục nào mô tả chính xác nhất về NAME_OF_PAGE ?",
  "Nhờ hạng mục, mọi người sẽ tìm thấy Trang này trong kết quả tìm kiếm. Bạn có thể thêm đến 3 hạng mục"
];
const String next = "Tiếp";
const String done = "Xong";

class CategoryPage extends StatefulWidget {
  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
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
      body: BlocBuilder<NamePageBloc, NamePageState>(
          builder: (context, namePageState) {
        // namePageModel =
        //     BlocProvider.of<NamePageBloc>(context).state.namePageModel;
        return GestureDetector(
          onTap: (() {
            FocusManager.instance.primaryFocus!.unfocus();
          }),
          child: Column(children: [
            Expanded(
              child: Container(
                  color: Colors.black,
                  child: Container(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: Column(children: [
                        Wrap(
                          children: [
                            Text(
                              QUESTION_NAME[0],
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
                        Text(QUESTION_NAME[1],
                            style: const TextStyle(
                                color: Colors.white, fontSize: 15)),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(7)),
                            border: Border.all(color: Colors.grey),
                            // color: Colors.red
                          ),
                          child: Row(
                            children: [
                              Flexible(
                                flex: 10,
                                child: Column(
                                  children: [
                                    Wrap(
                                      direction: Axis.horizontal,
                                      children: [
                                        selectedArea(true, "Blog Ca nhan"),
                                        selectedArea(true, "Nghe Thuat"),
                                        selectedArea(true, "San pham/ Dich vu"),
                                      ],
                                    ),
                                    Container(
                                      child: Autocomplete(
                                        optionsBuilder: ((textEditingValue) {
                                          if (textEditingValue.text == "") {
                                            return Iterable<String>.empty();
                                          } else {
                                            List<String> matches = [];
                                            matches
                                                .addAll(Common.listSelection);
                                            matches.retainWhere((element) {
                                              return element
                                                      .toLowerCase()
                                                      .contains(textEditingValue
                                                          .text) ||
                                                  element
                                                      .toUpperCase()
                                                      .contains(textEditingValue
                                                          .text);
                                            });
                                            return matches;
                                          }
                                        }),
                                        onSelected: ((value) {
                                          //
                                        }),
                                        fieldViewBuilder: (context,
                                            textEditingController,
                                            focusNode,
                                            onFieldSubmitted) {
                                          return TextFormField(
                                            style:
                                                TextStyle(color: Colors.white),
                                            decoration: InputDecoration(
                                              contentPadding:
                                                  EdgeInsets.only(left: 10),
                                              border: InputBorder.none,
                                              hintStyle:
                                                  TextStyle(color: Colors.grey),
                                              hintText: "Tim kiem hang muc",
                                            ),
                                            controller: textEditingController,
                                            focusNode: focusNode,
                                            onSaved: (value) {},
                                          );
                                        },
                                        optionsViewBuilder:
                                            (context, onSelected, options) {
                                          final newOptions = options.toList();
                                          final List<String> finalOptions = [];
                                          for (int i = 0;
                                              i < newOptions.length;
                                              i++) {
                                            if (i < 7) {
                                              finalOptions.add(newOptions[i]);
                                            }
                                          }
                                          return Material(
                                            child: Column(
                                              children: [
                                                Container(
                                                  color: Colors.black,
                                                  height: 200,
                                                  child: SingleChildScrollView(
                                                      child: Column(
                                                    children:
                                                        finalOptions.map((e) {
                                                      return GestureDetector(
                                                        child:
                                                            suggestComponent(e),
                                                        onTap: () {
                                                          onSelected(e);
                                                        },
                                                      );
                                                    }).toList(),
                                                  )),
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      "Hang muc pho bien",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 20),
                                                    ),
                                                  ],
                                                ),
                                                selectedArea(
                                                    false, "Blog ca nhan"),
                                                selectedArea(
                                                    false, "San pham dich vu"),
                                                selectedArea(
                                                    false, "Nghe thuat"),
                                                selectedArea(
                                                    false, "Nhac sy/ Ban nhac"),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Flexible(
                                  child: Icon(
                                Icons.search,
                                color: Colors.white,
                              ))
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "Hang muc pho bien",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ],
                        ),
                        selectedArea(false, "Blog ca nhan"),
                        selectedArea(false, "San pham dich vu"),
                        selectedArea(false, "Nghe thuat"),
                        selectedArea(false, "Nhac sy/ Ban nhac"),
                      ]))),
            ),

            /// bottom
            BlocBuilder<CurrentNumberPageCubit, int>(
                builder: (context, currentNumberPage) {
              return Container(
                height: 70,
                color: Colors.black,
                child: Column(children: [
                  Center(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            fixedSize: Size(width * 0.9, 40),
                            backgroundColor:
                                // namePageModel.nameController.text.trim() == ""
                                //     ? Colors.grey
                                // :
                                Colors.blue),
                        onPressed: () {
                          if (currentNumberPage < 7) {
                            context
                                .read<CurrentNumberPageCubit>()
                                .updateCurrentNumberPageCubit(
                                    currentNumberPage + 1);
                          } else {
                            context
                                .read<CurrentNumberPageCubit>()
                                .updateCurrentNumberPageCubit(1);
                          }
                        },
                        child: Text(currentNumberPage == 7 ? done : next)),
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
                            width: 42,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              color: index <= currentNumberPage - 1
                                  ? Colors.blue
                                  : Colors.grey,
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
}

Widget selectedArea(bool hasIcon, String value) {
  return Flex(
    direction: Axis.horizontal,
    children: [
      Container(
        margin: EdgeInsets.fromLTRB(10, 5, 5, 5),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(7)),
            color: Colors.grey),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            hasIcon
                ? Row(
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
                    ],
                  )
                : Container(),
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
Widget suggestComponent(String value) {
  return Container(
    padding: EdgeInsets.only(left: 10),
    color: Colors.black,
    height: 40,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // Expanded(child: Align(child: Text(value))),
        Expanded(
            child: Flex(
          direction: Axis.horizontal,
          children: [
            Text(
              value,
              style: TextStyle(color: Colors.white),
            )
          ],
        )),
        Divider(
          height: 2,
          color: Colors.grey[400],
        )
      ],
    ),
  );
}
