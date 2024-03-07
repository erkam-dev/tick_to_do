// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:provider/provider.dart';

// import '../model/todo.dart';
// import '../provider/todos.dart';

// class CreateTodoPage extends StatefulWidget {
//   const CreateTodoPage({super.key});

//   @override
//   State<CreateTodoPage> createState() => _CreateTodoPageState();
// }

// class _CreateTodoPageState extends State<CreateTodoPage> {
//   late TextEditingController titleController;
//   late TextEditingController descriptionController;
//   late FocusNode descriptionFocus;
//   late GlobalKey<FormState> titleFormKey;
//   @override
//   void initState() {
//     super.initState();
//     titleController = TextEditingController();
//     descriptionController = TextEditingController();
//     descriptionFocus = FocusNode();
//     titleFormKey = GlobalKey<FormState>();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return PopScope(
//       onPopInvoked: (value) {
//         addTodo(
//           context,
//           formKey: titleFormKey,
//           title: titleController.text,
//           description: descriptionController.text,
//         );
//       },
//       child: Scaffold(
//         appBar: AppBar(title: Text(AppLocalizations.of(context)!.addTodo)),
//         body: ListView(
//           keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
//           padding: EdgeInsets.only(
//             top: 20,
//             right: 20,
//             left: 20,
//             bottom: MediaQuery.of(context).viewInsets.bottom + 30,
//           ),
//           children: [
//             Form(
//               key: titleFormKey,
//               child: TextFormField(
//                 autofocus: true,
//                 controller: titleController,
//                 validator: (value) {
//                   if ((value ?? "").isEmpty) {
//                     return AppLocalizations.of(context)!.notValid;
//                   }
//                   return null;
//                 },
//                 autovalidateMode: AutovalidateMode.onUserInteraction,
//                 decoration: InputDecoration(
//                   hintText: AppLocalizations.of(context)!.title,
//                 ),
//                 maxLines: 1,
//                 style: Theme.of(context)
//                     .textTheme
//                     .titleLarge!
//                     .copyWith(fontWeight: FontWeight.bold),
//               ),
//             ),
//             TextFormField(
//               focusNode: descriptionFocus,
//               controller: descriptionController,
//               decoration: InputDecoration(
//                 hintText: AppLocalizations.of(context)!.description,
//               ),
//               keyboardType: TextInputType.multiline,
//               maxLines: null,
//             ),
//             GestureDetector(
//               onTap: () => descriptionFocus.requestFocus(),
//               child: Container(
//                 color: Colors.transparent,
//                 height: MediaQuery.sizeOf(context).height / 3,
//                 width: MediaQuery.sizeOf(context).width,
//               ),
//             )
//           ],
//         ),
//         floatingActionButton: FloatingActionButton.extended(
//           onPressed: () {
//             addTodo(context,
//                 formKey: titleFormKey,
//                 title: titleController.text,
//                 description: descriptionController.text);
//           },
//           label: Text(AppLocalizations.of(context)!.addTodo),
//           icon: const Icon(CupertinoIcons.add),
//         ),
//       ),
//     );
//   }
// }

// addTodo(
//   BuildContext context, {
//   required GlobalKey<FormState> formKey,
//   required String title,
//   String? description,
// }) {
//   if (formKey.currentState!.validate()) {
//     final todo = Todo(
//       id: DateTime.now().toString(),
//       title: title,
//       description: description ?? "",
//       createdTime: DateTime.now(),
//     );

//     final provider = Provider.of<TodosProvider>(context, listen: false);
//     Navigator.of(context).pop();
//     provider.addTodo(todo);
//   }
// }
