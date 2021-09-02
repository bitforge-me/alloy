import 'package:socket_io_client/socket_io_client.dart' as IO;

import 'package:zapdart/hmac.dart';

import 'paydb.dart';
import 'prefs.dart';
import 'config.dart';
import 'utils.dart';

typedef UserInfoCallback = void Function(UserInfo userInfo);
typedef MessageCallback = void Function(String event, String msg);

Future<String?> _server() async {
  var testnet = await Prefs.testnetGet();
  var baseUrl = testnet ? PayDBServerTestnet : PayDBServerMainnet;
  if (baseUrl != null) baseUrl = baseUrl + 'events';
  return baseUrl;
}

class SocketEvents {
  IO.Socket? _socket;
  MessageCallback? _callback;

  Future<void> connect(MessageCallback callback) async {
    _callback = callback;
    // create socket to receive events
    _socket?.close();
    _socket = await _socketCreate();
  }

  void call(String event, String msg) {
    if (_callback != null) _callback!(event, msg);
  }

  Future<IO.Socket> _socketCreate() async {
    var baseUrl = await _server();
    var apikey = await Prefs.paydbApiKeyGet();
    var apisecret = await Prefs.paydbApiSecretGet();
    var nonce = nextNonce();

    var socket = IO.io(baseUrl, <String, dynamic>{
      'secure': true,
      'transports': ['websocket'],
    });
    print('socket namespace: ${socket.nsp}');
    socket.on('connect', (_) {
      print('ws connect');
      var sig = createHmacSig(apisecret!, nonce.toString());
      var auth = {"signature": sig, "api_key": apikey, "nonce": nonce};
      socket.emit('auth', auth);
    });
    socket.on('connecting', (_) {
      print('ws connecting');
    });
    socket.on('connect_error', (err) {
      print('ws connect error ($err)');
    });
    socket.on('connect_timeout', (_) {
      print('ws connect timeout');
    });
    socket.on('info', (data) {
      print(data);
    });
    socket.on('user_info_update', (data) {
      call('user_info_update', data);
      print(data);
    });
    socket.on('broker_order_update', (data) {
      call('broker_order_update', data);
      print(data);
    });
    socket.on('disconnect', (_) {
      print('ws disconnect');
    });

    return socket;
  }
}
