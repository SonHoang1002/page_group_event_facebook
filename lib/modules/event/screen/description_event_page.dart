import 'package:flutter/material.dart';
import 'package:self_facebook_project/general/common_event.dart';
import 'package:self_facebook_project/modules/event/screen/review_event_page.dart';
import 'package:self_facebook_project/modules/page/export_page.dart';

class DescriptionEventPage extends StatelessWidget {
  late double width = 0;
  late double height = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    width = size.width;
    height = size.height;
    return Scaffold(
        body: GestureDetector(
      onTap: (() {
        FocusManager.instance.primaryFocus!.unfocus();
      }),
      child: Column(children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            color: Colors.black87,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 60, bottom: 15),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: GestureDetector(
                            onTap: (() {
                              Navigator.of(context).pop();
                            }),
                            child: Icon(
                              CommonEvent.ICON_PRIVIOUS,
                              color: Colors.grey,
                              size: 18,
                            ),
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
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      DescriptionEventCommon.DESCRIPTION_EVENT_TITLE,
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
                Text(DescriptionEventCommon.DESCRIPTION_EVENT_SUBTITLE,
                    style: const TextStyle(color: Colors.grey, fontSize: 15)),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 120,
                  child: TextFormField(
                    // controller: namePageState.namePageModel.nameController,
                    onChanged: ((value) {}),
                    maxLines: 10,
                    textAlignVertical: TextAlignVertical.top,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey, width: 2),
                        ),
                        labelText: DescriptionEventCommon.PLACEHOLDER_EVENT,
                        labelStyle: TextStyle(color: Colors.white),
                        hintText: DescriptionEventCommon.PLACEHOLDER_EVENT,
                        hintStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                  ),
                )
              ],
            ),
          ),
        ),

        /// bottom
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
                                margin: EdgeInsets.fromLTRB(index == 0 ? 0 : 5,
                                    0, index == 6 ? 0 : 5, 0),
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
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => ReviewEventPage()));
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
        )
      ]),
    ));
  }
}
