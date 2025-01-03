import 'dart:isolate';

class Thread {
  run(Function(SendPort sendPort) function) async {
    ReceivePort receivePort = ReceivePort();

    Isolate.spawn(function, receivePort.sendPort);

    final isolateResult = await receivePort.first;

    return isolateResult;
  }
}
