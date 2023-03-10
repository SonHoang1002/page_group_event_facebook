import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:self_facebook_project/modules/page/blocs/current_number_page.dart';
import 'package:self_facebook_project/modules/page/blocs/name_bloc.dart';
import 'package:self_facebook_project/modules/page/export_page.dart';
import 'package:self_facebook_project/modules/page/model/name_model.dart';

const List<String> QUESTION_NAME = [
  "Tên Trang của bạn là gì ?",
  "Hãy dùng tên doanh nghiệp/thương hiệu/tổ chức của bạn hoặc tên góp phần giải thích về Trang"
];
const String next = "Tiếp";
const String done = "Xong";

class NamePagePage extends StatefulWidget {
  @override
  State<NamePagePage> createState() => _NamePagePageState();
}

class _NamePagePageState extends State<NamePagePage> {
  late double width = 0;
  late NamePageModel namePageModel;
  final _nameFormKey = GlobalKey<FormState>();
  // late bool checkValitdator;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    width = size.width;
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          context
              .read<CurrentNumberPageCubit>()
              .updateCurrentNumberPageCubit(1);
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
            Expanded(
              child: Container(
                color: Colors.black87,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                  child: Column(
                    children: [
                      Row(
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
                      Form(
                        key: _nameFormKey,
                        child: Container(
                          height: 80,
                          child: TextFormField(
                            validator: ((value) {
                              if (value!.length < 6) {
                                return "Tên ${value} không hợp lệ. Nếu bạn muốn tạo Trang mới, hãy chọn một tên khác như '${value} không chính thức'";
                              }
                            }),
                            controller:
                                namePageState.namePageModel.nameController,
                            onChanged: ((value) {
                              context
                                  .read<NamePageBloc>()
                                  .add(UpdateNamePageEvent(namePageModel));
                            }),
                            style: const TextStyle(color: Colors.white),
                            decoration: const InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey, width: 2),
                                ),
                                hintText: "Tên Trang",
                                hintStyle: TextStyle(color: Colors.grey),
                                labelText: "Tên Trang",
                                labelStyle: TextStyle(color: Colors.grey),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(.10)))),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
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
                            backgroundColor:
                                namePageModel.nameController.text.trim() == ""
                                    ? Colors.grey[800]
                                    : Colors.blue),
                        onPressed: () {
                          if (namePageModel.nameController.text.trim() != "") {
                            if (_nameFormKey.currentState!.validate()) {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => CategoryPage()));
                              context
                                  .read<CurrentNumberPageCubit>()
                                  .updateCurrentNumberPageCubit(
                                      currentNumberPage + 1);
                            }
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
}
