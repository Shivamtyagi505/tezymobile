import 'package:flutter/material.dart';

import 'HorizontalNumberPicker.dart';


///对HorizontalNumberPicker进行简单包装，添加顶部的选中值显示和两边的半透明遮罩
// ignore: must_be_immutable
class inputsamplePickerWrapper extends StatefulWidget {
  final double initialValue;
  final double minValue;
  final double maxValue;
  final double step;
  final String unit;
  final String title;

  ///控件的宽度
  final int widgetWidth;

  ///一大格中有多少个小格
  final int subGridCountPerGrid;

  ///每一小格的宽度
  final int subGridWidth;

  final void Function(double) onSelectedChanged;

  ///返回上方大标题所展示的数值字符串
  String Function(double) titleTransformer;

  ///返回标尺刻度所展示的数值字符串
  final String Function(double) scaleTransformer;

  ///标题文字颜色
  final Color titleTextColor;

  ///刻度颜色
  final Color scaleColor;

  ///指示器颜色
  final Color indicatorColor;

  ///刻度文字颜色
  final Color scaleTextColor;



  inputsamplePickerWrapper({
    Key key,
    this.initialValue = 500,
    this.minValue = 100,
    this.maxValue = 900,
    this.step = 1,
    this.title="",
    this.unit = "",
    this.widgetWidth = 200,
    this.subGridCountPerGrid = 10,
    this.subGridWidth = 8,
    @required this.onSelectedChanged,
    this.titleTransformer,
    this.scaleTransformer,
    this.titleTextColor = Colors.white,
    this.scaleColor = const Color(0xFFE9E9E9),
    this.indicatorColor = Colors.white,
    this.scaleTextColor = const Color(0xFF8E99A0),
  }) : super(key: key) {
    if (titleTransformer == null) {
      titleTransformer = (value) {
          return (value).toString();
      };
    }
  }

  @override
  State<StatefulWidget> createState() {
    return HorizontalNumberPickerWrapperState();
  }
}

class HorizontalNumberPickerWrapperState
    extends State<inputsamplePickerWrapper> {
  double _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.initialValue;
  }

  ///处理state的复用
  void didUpdateWidget(inputsamplePickerWrapper oldWidget) {
    super.didUpdateWidget(oldWidget);
    _selectedValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    int numberPickerHeight = 60;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        //上方选中值
        Text(
          widget.titleTransformer(_selectedValue),
          style: TextStyle(
              color: Colors.black,
              fontSize: 40,
              fontWeight: FontWeight.bold
            //fontFamily: "Montserrat",
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: <Widget>[
            Text(
              ' ${widget.unit}',
              style: TextStyle(
                  color: widget.titleTextColor,
                  fontSize: 19,
                  fontWeight: FontWeight.w500
                //fontFamily: "Montserrat",
              ),
            ),
          ],
        ),
        Container(width: 0, height: 30),
        //可滚动标尺
        HorizontalNumberPicker(
          initialValue: widget.initialValue,
          minValue: widget.minValue,
          maxValue: widget.maxValue,
          title: widget.title,
          step: widget.step,
          widgetWidth: widget.widgetWidth,
          widgetHeight: numberPickerHeight,
          subGridCountPerGrid: widget.subGridCountPerGrid,
          subGridWidth: widget.subGridWidth,
          onSelectedChanged: (value) {
            widget.onSelectedChanged(value);
            setState(() {
              _selectedValue = value;
            });
          },
          scaleTransformer: widget.scaleTransformer,
          scaleColor: widget.scaleColor,
          indicatorColor: widget.indicatorColor,
          scaleTextColor: widget.scaleTextColor,
        ),
      ],
    );
  }

  double cal(double val){
    double no=val-2.00;

    double base =8.00;
    double finalva=(((no-base))*0.25);
    return finalva;
  }
}