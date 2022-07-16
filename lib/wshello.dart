import 'package:dart_websocket_client1/channel.dart';

class wshello {
  String type = '';
  List<channel> channels = [];

  wshello(this.type, this.channels);

  @override
  String toString() {
    return 'type = $type, channels = $channels ';
  }

  //   LinkItem.fromJson(Map<String, dynamic> json)
  //     : name = json['n'],
  //       url = json['u'];

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'channels': channels,
    };
  }
}
