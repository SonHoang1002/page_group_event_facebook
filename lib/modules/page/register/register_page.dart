// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

// const String next = "Tiếp";
// const String done = "Xong";

// class RegisterPage extends StatefulWidget {
//   const RegisterPage({super.key});

//   @override
//   State<RegisterPage> createState() => _RegisterPageState();
// }

// class _RegisterPageState extends State<RegisterPage> {
//   late int inPart = 1;
//   late double width = 0;
//   // late double height = 0;
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     width = size.width;
//     // height = size.height;
//     // print(height);
//     return Scaffold(
//       appBar: AppBar(
//           leading: IconButton(
//         icon: const Icon(Icons.arrow_back),
//         onPressed: () {
//           //
//         },
//       )),
//       body: Column(children: [
//         Expanded(
//           child: Container(
//             color: Colors.black,
//             child: Name(),
//           ),
//         ),
//         Container(
//           height: 70,
//           color: Colors.black,
//           child: Column(children: [
//             Center(
//               child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                       fixedSize: Size(width * 0.9, 40),
//                       backgroundColor: Colors.grey),
//                   onPressed: () {
//                     if (inPart < 7) {
//                       setState(() {
//                         inPart = inPart + 1;
//                       });
//                     } else {
//                       setState(() {
//                         inPart = 1;
//                       });
//                     }
//                   },
//                   child: Text(inPart == 7 ? done : next)),
//             ),
//             SizedBox(
//               height: 5,
//             ),
//             Center(
//                 child: Container(
//               height: 6,
//               width: width * 0.9,
//               child: ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   itemCount: 7,
//                   itemBuilder: ((context, index) {
//                     return Container(
//                       margin: EdgeInsets.fromLTRB(
//                           index == 0 ? 0 : 5, 0, index == 6 ? 0 : 5, 0),
//                       width: 42,
//                       // height: 2,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(3),
//                         color: index <= inPart - 1 ? Colors.blue : Colors.grey,
//                       ),
//                     );
//                   })),
//             ))
//           ]),
//         ),
//       ]),
//     );
//   }
// }
