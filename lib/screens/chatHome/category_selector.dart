// import 'package:flutter/material.dart';

// class CategorySelector extends StatefulWidget {
//   @override
//   _CategorySelectorState createState() => _CategorySelectorState();
// }

// class _CategorySelectorState extends State<CategorySelector> {
//   int slectedIndex = 0;
//   final List<String> categories = [
//     'Messages',
//     'Online',
//     'Groups',
//     'Requstes',
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 60.0,
//       color: Theme.of(context).primaryColor,
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: categories.length,
//         itemBuilder: (BuildContext context, int index) {
//           return GestureDetector(
//             onTap: () {
//               setState(() {
//                 slectedIndex = index;
//               });
//             },
//             child: Padding(
//               padding: EdgeInsets.symmetric(
//                 horizontal: 30.0,
//                 vertical: 13.0,
//               ),
//               child: Text(
//                 categories[index],
//                 style: TextStyle(
//                   color: index == slectedIndex ? Colors.white : Colors.white60,
//                   fontWeight: FontWeight.bold,
//                   letterSpacing: 1.4,
//                   fontSize: 24.0,
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
