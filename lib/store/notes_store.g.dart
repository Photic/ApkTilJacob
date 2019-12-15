// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notes_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NotesStore on Notes, Store {
  final _$gridAtom = Atom(name: 'Notes.grid');

  @override
  ObservableList<NotesGridModel> get grid {
    _$gridAtom.context.enforceReadPolicy(_$gridAtom);
    _$gridAtom.reportObserved();
    return super.grid;
  }

  @override
  set grid(ObservableList<NotesGridModel> value) {
    _$gridAtom.context.conditionallyRunInAction(() {
      super.grid = value;
      _$gridAtom.reportChanged();
    }, _$gridAtom, name: '${_$gridAtom.name}_set');
  }

  final _$updateStateAsyncAction = AsyncAction('updateState');

  @override
  Future<void> updateState() {
    return _$updateStateAsyncAction.run(() => super.updateState());
  }
}
