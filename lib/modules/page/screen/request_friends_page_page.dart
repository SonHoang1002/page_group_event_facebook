import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:self_facebook_project/general/page_constants.dart';
import 'package:self_facebook_project/modules/page/blocs/current_number_page.dart';
import 'package:self_facebook_project/modules/page/export_page.dart';
import 'package:self_facebook_project/modules/page/model/name_model.dart';

class RequestFriends extends StatefulWidget {
  @override
  State<RequestFriends> createState() => _RequestFriendsState();
}

class _RequestFriendsState extends State<RequestFriends> {
  late double width = 0;
  late NamePageModel namePageModel;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    width = size.width;
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
        body: GestureDetector(
          onTap: (() {
            FocusManager.instance.primaryFocus!.unfocus();
          }),
          child: Column(children: [
            Expanded(
              child: Container(
                color: Colors.black87,
                child: Container(
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 30),
                        child: Center(
                          child: Container(
                            margin: EdgeInsets.only(bottom: 15),
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                color: Colors.pink,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25))),
                            child: Center(
                              child: Text(
                                RequestFriendPageConstants.FIRST_WORD_OF_PAGE_NAME,
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          RequestFriendPageConstants.TITLE_REQUEST[0],
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Text(RequestFriendPageConstants.TITLE_REQUEST[1],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 16)),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Center(
                        child: Container(
                          margin: EdgeInsets.only(bottom: 15),
                          height: 30,
                          // color: Colors.red,
                          child: Center(
                            child: Stack(
                                children: RequestFriendPageConstants.LIST_DEMO.map((e) {
                              return Container(
                                margin: EdgeInsets.only(right: width * 0.25),
                                child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Container(
                                      margin: EdgeInsets.only(right: 23 * e),
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.black, width: 2),
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.white,
                                      ),
                                      child: Image.asset(
                                        RequestFriendPageConstants.IMG_PATH_LIST[
                                            int.parse(e.toStringAsFixed(0))],
                                        fit: BoxFit.contain,
                                      ),
                                    )),
                              );
                            }).toList()),
                          ),
                        ),
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              fixedSize: Size(width * 0.285, 40),
                              backgroundColor: Colors.blue),
                          onPressed: () {},
                          child: Text(
                            RequestFriendPageConstants.TITLE_REQUEST[2],
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          )),
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
                            backgroundColor: Colors.blue),
                        onPressed: () {
                          context
                              .read<CurrentNumberPageCubit>()
                              .updateCurrentNumberPageCubit(
                                  currentNumberPage + 1);
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => SettingsPage()));
                        },
                        child: Text(PageConstants.NEXT)),
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
        ));
  }
}
