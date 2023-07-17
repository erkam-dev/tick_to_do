// import 'package:flutter/material.dart';
// import 'package:tick_to_do/elements/custom_showcase.dart';

// class HeroFAB extends StatelessWidget {
//   final GlobalKey globalKey;
//   final Object heroTag;
//   final Function onTap;
//   final String title;
//   final String showcaseDescription;
//   final IconData icon;
//   const HeroFAB({
//     Key? key,
//     required this.globalKey,
//     required this.heroTag,
//     required this.onTap,
//     required this.title,
//     required this.icon,
//     required this.showcaseDescription,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap as void Function()?,
//       child: CustomShowcaseWidget(
//         globalKey: globalKey,
//         description: showcaseDescription,
//         child: Hero(
//           tag: heroTag,
//           child: Material(
//             clipBehavior: Clip.antiAlias,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(15),
//             ),
//             color: Theme.of(context).colorScheme.secondary,
//             child: Container(
//               margin: const EdgeInsets.all(7),
//               padding: const EdgeInsets.all(5),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(25),
//               ),
//               child: Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Icon(
//                     icon,
//                     color: Theme.of(context).colorScheme.onSecondary,
//                   ),
//                   const SizedBox(width: 10),
//                   Text(
//                     title,
//                     style: TextStyle(
//                         color: Theme.of(context).colorScheme.onSecondary,
//                         letterSpacing: 2),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
