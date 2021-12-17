import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_signature_pad/flutter_signature_pad.dart';

class Drawing_Pad extends StatefulWidget {
  @override
  Drawing_PadState createState() => Drawing_PadState();
}

class Drawing_PadState extends State<Drawing_Pad> {
  List<Coordinate> _list = [];
  ByteData _img = ByteData(0);
  var strokeWidth = 5.0;
  final _sign = GlobalKey<SignatureState>();
  bool textField = false;
  double xPosition = 0;
  double yPosition = 0;
  String value;
  List<String> list = [];
  TextEditingController edit = TextEditingController();
  List<TextEditingController> editingController = List.generate(20, (index) => TextEditingController());
  final containerKey = GlobalKey();
  List<TextField> textfield = [];
  double x = 0.0;
  double y = 0.0;
  void updateLocation(PointerEvent details) {
    setState(() {
      x = details.position.dx;
      y = details.position.dy;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Color.fromRGBO(3, 43, 1191, 10),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.9,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: textField
                  ? IgnorePointer(
                      child: Signature(
                        color: Colors.black,
                        key: _sign,
                        onSign: () {
                          final sign = _sign.currentState;
                          //  debugPrint('${sign.points.length} points in the signature');
                        },
                        //  backgroundPainter: _WatermarkPaint("2.0", "2.0"),
                        strokeWidth: strokeWidth,
                      ),
                    )
                  : Signature(
                      color: Colors.black,
                      key: _sign,
                      onSign: () {
                        final sign = _sign.currentState;
                        //  debugPrint('${sign.points.length} points in the signature');
                      },
                      //  backgroundPainter: _WatermarkPaint("2.0", "2.0"),
                      strokeWidth: strokeWidth,
                    ),
            ),
            (textField)
                ? Positioned(
                    top: yPosition,
                    left: xPosition,
                    child: GestureDetector(
                      onPanUpdate: (tapInfo) {
                        setState(() {
                          xPosition += tapInfo.delta.dx;
                          yPosition += tapInfo.delta.dy;
                        });
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.grey)),
                          height: 40,
                          width: 100,
                          child: TextField(
                            
                            autofocus: true,
                            // controller: editingController[index],
                            onSubmitted: (text) {
                              setState(() {
                                Coordinate coordinate = Coordinate(value: text, x: xPosition, y: yPosition);
                                _list.add(coordinate);
                              });
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                               contentPadding: EdgeInsets.symmetric(horizontal: 2,vertical: 2)
                            ),
                          )),
                    ))
                :
                // Positioned(
                //   top: yPosition,
                //     left: xPosition,
                //   child: Text(value ??''))
                (_list.isNotEmpty)
                    ? Container(
                        height:  MediaQuery.of(context).size.height * 0.8,
                        child: Stack(
                            children: List<Positioned>.generate(
                          _list.length,
                          (index) => Positioned(
                            top: _list[index].y ?? 0,
                            left: _list[index].x ?? 0,
                            child: Text(_list[index].value ?? ''),
                          ),
                        )),
                      )
                    : Container(),
            Positioned(
              bottom: 70,
              child: Container(
                height: 75.89,
                width: width,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(3, 43, 119, 10), borderRadius: BorderRadius.all(Radius.circular(69))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.text_fields,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          textField = !textField;
                          textfield.add(TextField());
                        });
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.replay,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.earbuds_outlined,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        final sign = _sign.currentState;
                        sign.clear();
                        setState(() {
                          _img = ByteData(0);
                        });
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.redo_outlined,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Positioned(
              bottom: 10,
              // left: 100,
              child: Container(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      child: Text("Cancel"),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(28.0),
                      ),
                    ),
                    SizedBox(width: 5),
                    InkWell(
                      onTap: () {
                        setState(() {
                          
                          textField = !textField;
                        });
                      },
                      child: Container(
                          alignment: Alignment.center,
                          height: height * 0.05,
                          width: width * 0.25,
                          decoration: BoxDecoration(color: Color(0xff032B77), borderRadius: BorderRadius.circular(20)),
                          child: Text(
                            "Save",
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Coordinate {
  String value;
  double x;
  double y;
  Coordinate({this.value, this.x, this.y});
}
