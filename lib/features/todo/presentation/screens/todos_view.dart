import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../lib.dart';

class TodosView extends StatefulWidget {
  final int selectedTabIndex;
  final ScrollController? scrollController;
  const TodosView(
      {super.key, required this.selectedTabIndex, this.scrollController});

  @override
  State<TodosView> createState() => _TodosViewState();
}

class _TodosViewState extends State<TodosView> {
  bool hideTip = false;
  @override
  void initState() {
    hideTip = sl<SharedPreferences>().getBool(hideTipKey) ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TodoBloc todoBloc = BlocProvider.of<TodoBloc>(context);
    AuthBloc authBloc = BlocProvider.of<AuthBloc>(context);
    return StreamBuilder<List<Todo>>(
      stream: todoBloc.todoStream,
      builder: (context, snapshot) {
        List<Widget> children = [];
        if (snapshot.hasData) {
          List<Todo> todos = snapshot.data!.toList();
          todos.sort((a, b) {
            if (a.createdTime != null && b.createdTime != null) {
              return a.createdTime!.compareTo(b.createdTime!);
            }
            return 0;
          });
          children = todos
              .where((element) => widget.selectedTabIndex == 0
                  ? !element.isDone
                  : element.isDone)
              .map((e) => TodoItemWidget(key: ValueKey(e.id), todo: e))
              .toList();
        }
        return authBloc.profile == null
            ? const SliverToBoxAdapter(child: LoginWidget())
            : snapshot.hasData
                ? SliverList(
                    delegate: SliverChildListDelegate(
                      (snapshot.data!.isEmpty || children.isEmpty)
                          ? [
                              NoTodosWidget(
                                  selectedTabIndex: widget.selectedTabIndex)
                            ]
                          : [
                              (hideTip
                                      ? const SizedBox()
                                      : ListTile(
                                          leading: const Icon(
                                              Icons.info_outline_rounded),
                                          subtitle: Text(
                                              AppLocalizations.of(context)!
                                                  .todoTipMessage),
                                          trailing: IconButton(
                                            icon:
                                                const Icon(Icons.close_rounded),
                                            onPressed: () {
                                              setState(() => hideTip = true);
                                              sl<SharedPreferences>()
                                                  .setBool(hideTipKey, true);
                                            },
                                          ),
                                        ).opacity(0.5))
                                  .animatedSwitcher()
                                  .animatedSize(),
                              ...children
                            ],
                    ),
                  )
                : SliverToBoxAdapter(
                    child: snapshot.hasError
                        ? TodoErrorWidget(error: snapshot.error)
                        : snapshot.connectionState == ConnectionState.waiting
                            ? const Center(child: CircularProgressIndicator())
                                .sizedBox(height: 70)
                            : const SizedBox(),
                  );
      },
    );
  }
}
