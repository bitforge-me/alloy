import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:event/event.dart';
import 'package:logging/logging.dart';

import 'package:zapdart/hmac.dart';

import 'prefs.dart';
import 'config.dart';
import 'utils.dart';
import 'beryllium.dart';

final log = Logger('Websocket');

enum WebsocketEvent {
  none,
  version,
  userInfoUpdate,
  brokerOrderNew,
  brokerOrderUpdate,
  depositNew,
  depositUpdate,
  cryptoDepositNew,
  cryptoDepositUpdate,
  fiatDepositNew,
  fiatDepositUpdate,
  withdrawalNew,
  withdrawalUpdate,
  cryptoWithdrawalNew,
  cryptoWithdrawalUpdate,
  fiatWithdrawalNew,
  fiatWithdrawalUpdate,
  lnInvoicePaid,
}

class WsEventArgs extends EventArgs {
  WebsocketEvent event;
  String msg;

  WsEventArgs(this.event, this.msg);
}

Future<String> _server() async {
  var baseUrl = server() + 'events';
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

  void call(WebsocketEvent wevent, String msg) {
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
    log.info('socket namespace: ${socket.nsp}');
    socket.on('connect', (_) {
      log.info('ws connect');
      nonceLock.synchronized(() async {
        var nonce = nextNonce();
        var sig = createHmacSig(apisecret!, nonce.toString());
        var auth = {"signature": sig, "api_key": apikey, "nonce": nonce};
        log.info('auth: $auth');
        socket.emit('auth', auth);
      });
    });
    socket.on('connecting', (_) {
      log.info('ws connecting');
    });
    socket.on('connect_error', (err) {
      log.info('ws connect error ($err)');
    });
    socket.on('connect_timeout', (_) {
      log.info('ws connect timeout');
    });
    socket.on('version', (data) {
      call(WebsocketEvent.version, data);
      log.info('version: $data');
    });
    socket.on('info', (data) {
      log.info('info: $data');
    });
    socket.on('user_info_update', (data) {
      call(WebsocketEvent.userInfoUpdate, data);
      log.info('user_info_update: $data');
    });
    socket.on('broker_order_new', (data) {
      call(WebsocketEvent.brokerOrderNew, data);
      log.info('broker_order_new: $data');
    });
    socket.on('broker_order_update', (data) {
      call(WebsocketEvent.brokerOrderUpdate, data);
      log.info('broker_order_update: $data');
    });
    socket.on('ln_invoice_paid', (data) {
      call(WebsocketEvent.lnInvoicePaid, data);
      log.info('ln_invoice_paid: $data');
    });
    socket.on('deposit_new', (data) {
      call(WebsocketEvent.depositNew, data);
      log.info('deposit_new: $data');
    });
    socket.on('deposit_update', (data) {
      call(WebsocketEvent.depositUpdate, data);
      log.info('deposit_update: $data');
    });
    socket.on('crypto_deposit_new', (data) {
      call(WebsocketEvent.cryptoDepositNew, data);
      log.info('crypto_deposit_new: $data');
    });
    socket.on('crypto_deposit_update', (data) {
      call(WebsocketEvent.cryptoDepositUpdate, data);
      log.info('crypto_deposit_update: $data');
    });
    socket.on('fiat_deposit_new', (data) {
      call(WebsocketEvent.fiatDepositNew, data);
      log.info('fiat_deposit_new: $data');
    });
    socket.on('fiat_deposit_update', (data) {
      call(WebsocketEvent.fiatDepositUpdate, data);
      log.info('fiat_deposit_update: $data');
    });
    socket.on('withdrawal_new', (data) {
      call(WebsocketEvent.withdrawalNew, data);
      log.info('withdrawal_new: $data');
    });
    socket.on('withdrawal_update', (data) {
      call(WebsocketEvent.withdrawalUpdate, data);
      log.info('withdrawal_update: $data');
    });
    socket.on('crypto_withdrawal_new', (data) {
      call(WebsocketEvent.cryptoWithdrawalNew, data);
      log.info('crypto_withdrawal_new: $data');
    });
    socket.on('crypto_withdrawal_update', (data) {
      call(WebsocketEvent.cryptoWithdrawalUpdate, data);
      log.info('crypto_withdrawal_update: $data');
    });
    socket.on('fiat_withdrawal_new', (data) {
      call(WebsocketEvent.fiatWithdrawalNew, data);
      log.info('fiat_withdrawal_new: $data');
    });
    socket.on('fiat_withdrawal_update', (data) {
      call(WebsocketEvent.fiatWithdrawalUpdate, data);
      log.info('fiat_withdrawal_update: $data');
    });
    socket.on('disconnect', (_) {
      log.info('ws disconnect');
    });

    return socket;
  }
}
