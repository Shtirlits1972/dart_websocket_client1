import 'dart:convert';
import 'dart:io';
import 'package:dart_websocket_client1/channel.dart';
import 'package:dart_websocket_client1/wshello.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart' as status;

main() {
  print('Start');

  List<String> strbtc = [];
  // strbtc.add('BTC-USD');
  strbtc.add('BTC-EUR');

  channel ch1 = channel('ticker', strbtc);
  List<channel> chArray = [];
  chArray.add(ch1);
  wshello wshello1 = wshello('subscribe', chArray);

  try {
    String json = jsonEncode(wshello1);
    //  print(json);
    String url = "wss://ws-feed.pro.coinbase.com";
    final channel = IOWebSocketChannel.connect(url);
    channel.sink.add(json);

    channel.stream.listen((message) {
      print(message);
      sleep(Duration(seconds: 5));
    });
  } catch (e) {
    print('Error = $e ');
  }
  print('Finish');
}
