// import 'package:animations/animations.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:provider/provider.dart';
// import 'package:tick_to_do/common/hero_dialog_route.dart';
// import 'package:tick_to_do/core/core.dart';
// import 'package:tick_to_do/model/todo.dart';
// import 'package:tick_to_do/provider/todos.dart';
// import 'package:tick_to_do/todos_structure/edit_todo.dart';

// class TodoCardWidget extends StatelessWidget {
//   final Todo todo;

//   const TodoCardWidget({required this.todo, super.key});

//   @override
//   Widget build(BuildContext context) => Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: OpenContainer(
//           closedElevation: Theme.of(context).cardTheme.elevation!,
//           openElevation: 0,
//           tappable: false,
//           openColor: Theme.of(context).scaffoldBackgroundColor,
//           closedColor: Theme.of(context).cardColor,
//           closedShape: Theme.of(context).cardTheme.shape!,
//           transitionType: ContainerTransitionType.fadeThrough,
//           openBuilder: (context, action) => EditTodo(todo: todo),
//           closedBuilder: (context, action) => ListTile(
//             tileColor: Theme.of(context).cardColor,
//             dense: true,
//             onTap: () => action(),
//             contentPadding: const EdgeInsets.only(right: 10, top: 5, bottom: 5),
//             title: Text(
//               todo.title,
//               style: Theme.of(context)
//                   .textTheme
//                   .titleMedium!
//                   .copyWith(fontWeight: FontWeight.bold),
//             ),
//             subtitle: (todo.description.isNotEmpty)
//                 ? Text(
//                     todo.description,
//                     style: Theme.of(context).textTheme.bodyMedium,
//                     maxLines: 10,
//                     overflow: TextOverflow.ellipsis,
//                     softWrap: false,
//                   )
//                 : null,
//             leading: Checkbox(
//               value: todo.isDone,
//               onChanged: (_) => toggleIsDone(context),
//             ),
//             trailing: const Icon(Icons.navigate_next_outlined),
//           ),
//         ),
//       );

//   bool toggleIsDone(BuildContext context) {
//     final provider = Provider.of<TodosProvider>(context, listen: false);
//     final isDone = provider.toggleTodoStatus(todo);
//     return isDone;
//   }

//   void deleteTodo(BuildContext context, Todo todo) {
//     final provider = Provider.of<TodosProvider>(context, listen: false);
//     provider.removeTodo(todo);
//     context.showSnackBar(AppLocalizations.of(context)!.snackbarDeleted);
//   }

//   void editTodo(BuildContext context, Todo todo) => Navigator.of(context).push(
//         HeroDialogRoute(
//           builder: (context) => EditTodo(todo: todo),
//         ),
//       );
// }
