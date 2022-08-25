// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TaskStore on BaseTask, Store {
  late final _$itemsAtom = Atom(name: 'BaseTask.items', context: context);

  @override
  List<Items> get items {
    _$itemsAtom.reportRead();
    return super.items;
  }

  @override
  set items(List<Items> value) {
    _$itemsAtom.reportWrite(value, super.items, () {
      super.items = value;
    });
  }

  late final _$taskStatusAtom =
      Atom(name: 'BaseTask.taskStatus', context: context);

  @override
  TaskStatus get taskStatus {
    _$taskStatusAtom.reportRead();
    return super.taskStatus;
  }

  @override
  set taskStatus(TaskStatus value) {
    _$taskStatusAtom.reportWrite(value, super.taskStatus, () {
      super.taskStatus = value;
    });
  }

  late final _$selectedAtom = Atom(name: 'BaseTask.selected', context: context);

  @override
  String get selected {
    _$selectedAtom.reportRead();
    return super.selected;
  }

  @override
  set selected(String value) {
    _$selectedAtom.reportWrite(value, super.selected, () {
      super.selected = value;
    });
  }

  late final _$fetchTaskAsyncAction =
      AsyncAction('BaseTask.fetchTask', context: context);

  @override
  Future fetchTask() {
    return _$fetchTaskAsyncAction.run(() => super.fetchTask());
  }

  late final _$editTaskAsyncAction =
      AsyncAction('BaseTask.editTask', context: context);

  @override
  Future editTask({dynamic context, required Items task}) {
    return _$editTaskAsyncAction
        .run(() => super.editTask(context: context, task: task));
  }

  late final _$createTaskAsyncAction =
      AsyncAction('BaseTask.createTask', context: context);

  @override
  Future createTask({dynamic context, required Items items}) {
    return _$createTaskAsyncAction
        .run(() => super.createTask(context: context, items: items));
  }

  late final _$deteleTaskAsyncAction =
      AsyncAction('BaseTask.deteleTask', context: context);

  @override
  Future deteleTask(dynamic uuid) {
    return _$deteleTaskAsyncAction.run(() => super.deteleTask(uuid));
  }

  @override
  String toString() {
    return '''
items: ${items},
taskStatus: ${taskStatus},
selected: ${selected}
    ''';
  }
}
