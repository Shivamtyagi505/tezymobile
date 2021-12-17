import 'package:mobx/mobx.dart';

part 'mob_store.g.dart';

class ScaleNo = ScaleValue with _$ScaleNo;

abstract class ScaleValue with Store {
  @observable
  double value ;
  @observable
  String name="Upper chest Round.png";
  @observable
  double selectScaleValue;

  @action
  double setValue(double selectedValue) {
    selectScaleValue=selectedValue;
  }
  @action
  void PostValue(double val) {
    value=val;
  }
  @action
  void setName(String val) {
    name=val;
  }
}