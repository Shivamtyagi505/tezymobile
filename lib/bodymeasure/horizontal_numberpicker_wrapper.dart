import 'package:flutter/material.dart';
import 'package:quikieappps1/blouse/pro_vider/image_notif.dart';
import 'package:quikieappps1/bodymeasure/HorizontalNumberPicker.dart';
import 'package:quikieappps1/state_management/mob_store.dart';

///对HorizontalNumberPicker进行简单包装，添加顶部的选中值显示和两边的半透明遮罩
// ignore: must_be_immutable
class HorizontalNumberPickerWrapper extends StatefulWidget {
  final double? initialValue;
  final double? minValue;
  final double? maxValue;
  final double? step;
  final String? unit;
  final String? name;
  final String? title;

  ///控件的宽度
  final int? widgetWidth;

  ///一大格中有多少个小格
  final int? subGridCountPerGrid;

  ///每一小格的宽度
  final int? subGridWidth;

  final void Function(double)? onSelectedChanged;

  ///返回上方大标题所展示的数值字符串
  String Function(double)? titleTransformer;

  ///返回标尺刻度所展示的数值字符串
  final String Function(double)? scaleTransformer;

  ///标题文字颜色
  final Color? titleTextColor;

  ///刻度颜色
  final Color? scaleColor;

  ///指示器颜色
  final Color? indicatorColor;

  ///刻度文字颜色
  final Color? scaleTextColor;
  
  final ImageNotif? imageNotif;

  HorizontalNumberPickerWrapper({
     Key? key,
    this.imageNotif,
    this.initialValue = 500,
    this.minValue = 100,
    this.maxValue = 900,
    this.step = 1,
    this.title = "",
    this.unit = "",
    this.name = "",
    this.widgetWidth = 200,
    this.subGridCountPerGrid = 10,
    this.subGridWidth = 8,
    required this.onSelectedChanged,
    this.titleTransformer,
    this.scaleTransformer,
    this.titleTextColor = Colors.white,
    this.scaleColor = const Color(0xFFE9E9E9),
    this.indicatorColor = Colors.white,
    this.scaleTextColor = const Color(0xFF8E99A0),
  }) : super(key: key) {
    if (titleTransformer == null) {
      titleTransformer = (value) {
        double checkdecimal = value % 1;
        if (checkdecimal == 0.5 || checkdecimal == 0) if (checkdecimal == 0)
          return (1 + value).toString() + "0";
        else
          return (1 + value).toString() + "0";
        else
          return (1 + value).toString();
      };
    }
  }

  @override
  State<StatefulWidget> createState() {
    return HorizontalNumberPickerWrapperState();
  }
}

class HorizontalNumberPickerWrapperState
    extends State<HorizontalNumberPickerWrapper> {
  double? _selectedValue;
  ScaleNo? scaleData = ScaleNo();

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.initialValue;
    scaleData!.PostValue(widget.initialValue!);
  }

  ///处理state的复用
  void didUpdateWidget(HorizontalNumberPickerWrapper oldWidget) {
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
        Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: <Widget>[
              Text(
                ' ${widget.name}',
                style: TextStyle(
                    color: widget.titleTextColor,
                    fontSize: 13,
                   // fontWeight: FontWeight.w700
                    //fontFamily: "Montserrat",
                    ),
              ),
              Text(
                widget.titleTransformer!(getScalePrintVal(_selectedValue)),
                style: TextStyle(
                    color: widget.titleTextColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w700
                    //fontFamily: "Montserrat",
                    ),
              ),
            ],
          ),
        ),
        //可滚动标尺
        Stack(
          children: <Widget>[
            Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                color: Colors.white,
              ),
              child: HorizontalNumberPicker(
                initialValue: widget.initialValue!,
                minValue: widget.minValue!,
                maxValue: widget.maxValue!,
                title: widget.title!,
                step: widget.step!,
                widgetWidth: widget.widgetWidth!,
                widgetHeight: numberPickerHeight,
                subGridCountPerGrid: widget.subGridCountPerGrid!,
                subGridWidth: widget.subGridWidth!,
                onSelectedChanged: (value) {
                  widget.onSelectedChanged!(value);
                  setState(() {
                    _selectedValue = value;
                  });

                  if (widget.name == 'Shoulder') {
                  //  scaleData.setValue(value);
                    //widget.imageNotif.shoulderImage();
                  }
                  /*
                  if (widget.name == 'Full Length')
                    widget.imageNotif.fullLengthImage();
                  if (widget.name == 'Shoulder Gap')
                    widget.imageNotif.shoulderGapImage();
                  if (widget.name == 'Sleeves Length')
                    widget.imageNotif.sleevesLengthImage();
                  if (widget.name == 'Armhole Round')
                    widget.imageNotif.armHoleRoundImage();
                  if (widget.name == 'Circle Down Loose')
                    widget.imageNotif.circleDownLooseImage();
                  if (widget.name == 'Sleeves Round')
                    widget.imageNotif.sleevesRoundImage();
                  if (widget.name == 'Upper Chest Round')
                    widget.imageNotif.upperChestRoundImage();
                  if (widget.name == 'Lower Chest Round')
                    widget.imageNotif.lowerChestRoundImage();
                  if (widget.name == 'Waist Round')
                    widget.imageNotif.waistRoundImage();
                  if (widget.name == 'First Dart Point')
                    widget.imageNotif.firstDartPointImage();
                  if (widget.name == 'Second Dart Point')
                    widget.imageNotif.secondDartPointImage();
                  if (widget.name == 'Bust Point') widget.imageNotif.bustPointImage();
                  if (widget.name == 'Front AC') widget.imageNotif.frontAcImage();
                  if (widget.name == 'Front Neck Deep')
                    widget.imageNotif.frontNeckDeepImage();
                  if (widget.name == 'Back Neck Deep')
                    widget.imageNotif.backNeckDeepImage();
                  if (widget.name == 'Waist Band Length')
                    widget.imageNotif.waistBandLengthImage();
                  if (widget.name == 'Neck Width') widget.imageNotif.neckWidthImage();
*/
                },
                scaleTransformer: widget.scaleTransformer,
                scaleColor: widget.scaleColor!,
                indicatorColor: widget.indicatorColor!,
                scaleTextColor: widget.scaleTextColor!,
              ),
            ),

            // Positioned(
            //   left: 0,
            //   child: Container(
            //     width: 20,
            //     height: numberPickerHeight.toDouble(),
            //     decoration: BoxDecoration(
            //       gradient: LinearGradient(colors: [
            //         Colors.white.withOpacity(0.8),
            //         Colors.white.withOpacity(0)
            //       ]),
            //     ),
            //   ),
            // ),
            // Positioned(
            //   right: 0,
            //   child: Container(
            //     width: 20,
            //     height: numberPickerHeight.toDouble(),
            //     decoration: BoxDecoration(
            //       gradient: LinearGradient(colors: [
            //         Colors.white.withOpacity(0),
            //         Colors.white.withOpacity(0.8)
            //       ]),
            //     ),
            //   ),
            // ),
          ],
        ),
      ],
    );
  }




  double getScalePrintVal(val) {
    double base = 1.00;
    double finalva = ((((val / 1 - (val % 1)) - base)) * 0.25) + (val % 1);
    print('fnal$finalva');
    return finalva;
  }

  String yoyo() {
    widget.titleTransformer!(50);
    return "";
  }
}
