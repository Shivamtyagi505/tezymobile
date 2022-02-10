// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mob_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ScaleNo on ScaleValue, Store {
  final _$valueAtom = Atom(name: 'ScaleValue.value');

  @override
  double? get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(double? value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  final _$nameAtom = Atom(name: 'ScaleValue.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$selectScaleValueAtom = Atom(name: 'ScaleValue.selectScaleValue');

  @override
  double? get selectScaleValue {
    _$selectScaleValueAtom.reportRead();
    return super.selectScaleValue;
  }

  @override
  set selectScaleValue(double? value) {
    _$selectScaleValueAtom.reportWrite(value, super.selectScaleValue, () {
      super.selectScaleValue = value;
    });
  }

  final _$ScaleValueActionController = ActionController(name: 'ScaleValue');

  @override
  double? setValue(double selectedValue) {
    final _$actionInfo =
        _$ScaleValueActionController.startAction(name: 'ScaleValue.setValue');
    try {
      return super.setValue(selectedValue);
    } finally {
      _$ScaleValueActionController.endAction(_$actionInfo);
    }
  }

  @override
  void PostValue(double val) {
    final _$actionInfo =
        _$ScaleValueActionController.startAction(name: 'ScaleValue.PostValue');
    try {
      return super.PostValue(val);
    } finally {
      _$ScaleValueActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setName(String val) {
    final _$actionInfo =
        _$ScaleValueActionController.startAction(name: 'ScaleValue.setName');
    try {
      return super.setName(val);
    } finally {
      _$ScaleValueActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value},
name: ${name},
selectScaleValue: ${selectScaleValue}
    ''';
  }
}
