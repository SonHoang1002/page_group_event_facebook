// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:self_facebook_project/general/common.dart';
// import 'package:self_facebook_project/modules/page/blocs/current_number_page.dart';
// import 'package:self_facebook_project/modules/page/blocs/name_bloc.dart';
// import 'package:self_facebook_project/modules/page/blocs/search_category_bloc.dart';
// import 'package:self_facebook_project/modules/page/model/name_model.dart';
// import 'package:self_facebook_project/test_widget.dart';


// class TestWidget extends StatefulWidget {
//   @override
//   State<TestWidget> createState() => _TestWidgetState();
// }

// class _TestWidgetState extends State<TestWidget> {
//   late double width = 0;
//   late TextEditingController _categoryController =
//       TextEditingController(text: "");
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     width = size.width;
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       appBar: AppBar(
//           leading: IconButton(
//         icon: const Icon(Icons.arrow_back),
//         onPressed: () {
//           //
//         },
//       )),
//       body: BlocBuilder<NamePageBloc, NamePageState>(
//           builder: (context, namePageState) {
//         // namePageModel =
//         //     BlocProvider.of<NamePageBloc>(context).state.namePageModel;
//         return GestureDetector(
//           onTap: (() {
//             FocusManager.instance.primaryFocus!.unfocus();
//           }),
//           child: Column(children: [
//             Container(
//               height: 687,
//               color: Colors.black87,
//               child: ListView(
//                 children: [
//                   Container(
//                       // color: Colors.black87,
//                       child: Container(
//                           padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
//                           child: Column(children: [
//                             Wrap(
//                               children: [
//                                 Text(
//                                   Category.QUESTION_NAME[0],
//                                   style: const TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 22,
//                                       fontWeight: FontWeight.bold),
//                                 ),
//                               ],
//                             ),
//                             const SizedBox(
//                               height: 10,
//                             ),
//                             Text(Category.QUESTION_NAME[1],
//                                 style: const TextStyle(
//                                     color: Colors.white, fontSize: 20)),
//                             const SizedBox(
//                               height: 10,
//                             ),
//                             Container(
//                               decoration: BoxDecoration(
//                                 borderRadius:
//                                     BorderRadius.all(Radius.circular(7)),
//                                 border: Border.all(color: Colors.black),
//                                 // color: Colors.red
//                               ),
//                               child: Row(
//                                 children: [
//                                   Flexible(
//                                     flex: 10,
//                                     child: Column(
//                                       children: [
//                                         Wrap(
//                                           direction: Axis.horizontal,
//                                           children: [
//                                             selectedArea(true, "Blog Ca nhan"),
//                                           ],
//                                         ),
//                                         BlocBuilder<SearchCategoryBloc,
//                                                 SearchCategoryState>(
//                                             builder: (context, state) {
//                                           return TextFormField(
//                                             style:
//                                                 TextStyle(color: Colors.white),
//                                             controller: _categoryController,
//                                             onChanged: (value) {
//                                               print(value);
//                                               context
//                                                   .read<SearchCategoryBloc>()
//                                                   .add(
//                                                       UpdateSearchCategoryEvent(
//                                                           value));
//                                               setState(() {});
//                                             },
//                                             decoration: InputDecoration(
//                                                 border: InputBorder.none,
//                                                 hintText: "Tim kiem hang muc",
//                                                 hintStyle: TextStyle(
//                                                     color: Colors.grey,
//                                                     fontSize: 20),
//                                                 contentPadding:
//                                                     EdgeInsets.only(left: 10)),
//                                           );
//                                         })
//                                       ],
//                                     ),
//                                   ),
//                                   Flexible(
//                                       child: Icon(
//                                     Icons.search,
//                                     color: Colors.white,
//                                   )),
//                                 ],
//                               ),
//                             ),
//                             _categoryController.text.trim().length > 0
//                                 ? Container(
//                                     height: 200,
//                                     child: ListView.builder(
//                                       itemBuilder: (context, index) {
//                                         return suggestComponent(
//                                             BlocProvider.of<SearchCategoryBloc>(
//                                                     context)
//                                                 .state
//                                                 .searchList[index]);
//                                       },
//                                       itemCount:
//                                           BlocProvider.of<SearchCategoryBloc>(
//                                                   context)
//                                               .state
//                                               .searchList
//                                               .length,
//                                     ),
//                                   )
//                                 : Container(),
//                                 // hang muc pho bien
//                             Container(
//                               padding: EdgeInsets.only(left: 10, top: 10),
//                               child: Row(
//                                 children: [
//                                   Text(
//                                     Category.TITLE,
//                                     style: TextStyle(
//                                         color: Colors.white, fontSize: 15),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             selectedArea(false, Category.POPULAR_CATEGORY[0]),
//                             selectedArea(false, Category.POPULAR_CATEGORY[1]),
//                             selectedArea(false, Category.POPULAR_CATEGORY[2]),
//                             selectedArea(false, Category.POPULAR_CATEGORY[3]),
//                           ]))),
//                 ],
//               ),
//             ),

//             /// bottom
//             BlocBuilder<CurrentNumberPageCubit, int>(
//                 builder: (context, currentNumberPage) {
//               return Container(
//                 height: 70,
//                 color: Colors.black87,
//                 child: Column(children: [
//                   Center(
//                     child: ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                             fixedSize: Size(width * 0.9, 40),
//                             backgroundColor:
//                                 // namePageModel.nameController.text.trim() == ""
//                                 //     ? Colors.grey[800]
//                                 // :
//                                 Colors.blue),
//                         onPressed: () {
//                           if (currentNumberPage < 7) {
//                             context
//                                 .read<CurrentNumberPageCubit>()
//                                 .updateCurrentNumberPageCubit(
//                                     currentNumberPage + 1);
//                           } else {
//                             context
//                                 .read<CurrentNumberPageCubit>()
//                                 .updateCurrentNumberPageCubit(1);
//                           }
//                         },
//                         child: Text(currentNumberPage == 7 ? Common.DONE : Common.NEXT)),
//                   ),
//                   const SizedBox(
//                     height: 5,
//                   ),
//                   Center(
//                       child: Container(
//                     height: 6,
//                     width: width * 0.9,
//                     child: ListView.builder(
//                         scrollDirection: Axis.horizontal,
//                         itemCount: 7,
//                         itemBuilder: ((context, index) {
//                           return Container(
//                             margin: EdgeInsets.fromLTRB(
//                                 index == 0 ? 0 : 5, 0, index == 6 ? 0 : 5, 0),
//                             width: 42,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(3),
//                               color: index <= currentNumberPage - 1
//                                   ? Colors.blue
//                                   : Colors.grey[800],
//                             ),
//                           );
//                         })),
//                   ))
//                 ]),
//               );
//             }),
//           ]),
//         );
//       }),
//     );
//   }
// }

// Widget selectedArea(bool hasIcon, String value) {
//   return Flex(
//     direction: Axis.horizontal,
//     children: [
//       Container(
//         margin: EdgeInsets.fromLTRB(10, 5, 5, 5),
//         padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.all(Radius.circular(7)),
//             color: Colors.grey[800]),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             hasIcon
//                 ? Row(
//                     children: [
//                       Container(
//                         child: Center(
//                             child: Icon(
//                           Icons.close_outlined,
//                           size: 18,
//                         )),
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.all(Radius.circular(15)),
//                             color: Colors.white),
//                       ),
//                       SizedBox(
//                         width: 5,
//                       ),
//                     ],
//                   )
//                 : Container(),
//             Text(
//               value,
//               style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold),
//             )
//           ],
//         ),
//       )
//     ],
//   );
// }

// Widget suggestComponent(String value) {
//   return Container(
//     padding: EdgeInsets.only(left: 10),
//     // color: Colors.black87,
//     height: 40,
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: [
//         // Expanded(child: Align(child: Text(value))),
//         Expanded(
//             child: Flex(
//           direction: Axis.horizontal,
//           children: [
//             Text(
//               value,
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 20,
//               ),
//             )
//           ],
//         )),
//         Divider(
//           height: 2,
//           color: Colors.white,
//         )
//       ],
//     ),
//   );
// }
