import 'dart:async';

enum ConstantValue{
  fetch,
  openBrowser,
  Shoulder

}

class NewsBloc {
  final stateStreamController = StreamController<String>();

  StreamSink<String> get _streamSink => stateStreamController.sink;

  Stream<String> get stream => stateStreamController.stream;

  final eventStreamController = StreamController<ConstantValue>();

  StreamSink<ConstantValue> get eventStreamSink => eventStreamController.sink;

  Stream<ConstantValue> get _eventStream => eventStreamController.stream;

  NewsBloc(){
    _eventStream.listen((event) {
      if (event == ConstantValue.Shoulder) {
        try {
          _streamSink.add("assets/images/blousemeasurement/Shoulder.png");
        } on Exception catch (excep) {
          _streamSink.addError("went worng");
        }
      }
      if (event == ConstantValue.fetch) {
        try {
          _streamSink.add("assets/images/3d woman 1.png");
        } on Exception catch (excep) {
          _streamSink.addError("went worng fetch");
        }
      }
    });
  }



}
