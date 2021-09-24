import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:event/event.dart';

import 'package:zapdart/hmac.dart';

import 'prefs.dart';
import 'config.dart';
import 'utils.dart';

enum WebsocketEvent {
  none,
  userInfoUpdate,
  brokerOrderNew,
  brokerOrderUpdate,
  cryptoDepositNew,
  cryptoDepositUpdate,
  fiatDepositNew,
  fiatDepositUpdate
}

class WsEventArgs extends EventArgs {
  WebsocketEvent event;
  String msg;

  WsEventArgs(this.event, this.msg);
}

Future<String?> _server() async {
  var testnet = await Prefs.testnetGet();
  var baseUrl = testnet ? BeServerTestnet : BeServerMainnet;
  if (baseUrl != null) baseUrl = baseUrl + 'events';
  return baseUrl;
}

class Websocket {
  IO.Socket? _socket;
  final wsEvent = Event<WsEventArgs>();

  Future<void> connect() async {
    // create socket to receive events
    _socket?.close();
    _socket = await _socketCreate();
  }

  void call(String event, String msg) {
    var wevent = WebsocketEvent.none;
    if (event == 'user_info_update') wevent = WebsocketEvent.userInfoUpdate;
    if (event == 'broker_order_new') wevent = WebsocketEvent.brokerOrderNew;
    if (event == 'broker_order_update')
      wevent = WebsocketEvent.brokerOrderUpdate;
    if (event == 'crypto_deposit_new') wevent = WebsocketEvent.cryptoDepositNew;
    if (event == 'crypto_deposit_update')
      wevent = WebsocketEvent.cryptoDepositUpdate;
    if (event == 'fiat_deposit_new') wevent = WebsocketEvent.fiatDepositNew;
    if (event == 'fiat_deposit_update')
      wevent = WebsocketEvent.fiatDepositUpdate;
    wsEvent.broadcast(WsEventArgs(wevent, msg));
  }

  Future<IO.Socket> _socketCreate() async {
    var baseUrl = await _server();
    var apikey = await Prefs.beApiKeyGet();
    var apisecret = await Prefs.beApiSecretGet();

    var socket = IO.io(baseUrl, <String, dynamic>{
      'secure': true,
      'transports': ['websocket'],
    });
    print('socket namespace: ${socket.nsp}');
    socket.on('connect', (_) {
      print('ws connect');
      var nonce = nextNonce();
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
    socket.on('broker_order_new', (data) {
      call('broker_order_new', data);
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
