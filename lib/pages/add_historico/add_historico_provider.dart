import 'package:flutter/services.dart';
import 'package:hackatagro/services/safety/change_notifier_safety.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart' as http;
import 'dart:collection';
import 'dart:convert';
import 'dart:core';
import 'dart:typed_data';

class AddHistoricoProvider extends ChangeNotifierSafety {
  List<OrderInfo> historico = new List<OrderInfo>.empty(growable: true);

  void cadastrarBlockchain() {}

  void getSteps() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final client = Web3Client(
        "https://rinkeby.infura.io/v3/24a134bcd80347f18b5a9de01f7b9685",
        http.Client());
    rootBundle.loadString('assets/standardToken.json').then((abi) async {
      final contract = DeployedContract(
          ContractAbi.fromJson(abi, "StandardTOken"),
          EthereumAddress.fromHex(
              "0x2C4e20CE742FA3Fc194B5fB0745Fe90ca81cb807"));
      var transfer = contract.function('getActions');

      Credentials credentials =
          EthPrivateKey.fromHex('0x' + prefs.getString('privKey')!);
      historico.clear();
      List information = await client.call(
          sender: await credentials.extractAddress(),
          contract: contract,
          function: transfer,
          params: []);
      information = information[0];
      var i = 0;
      while (i < information.length) {
        var hospitalName = information[i][2].toString();
        var description = information[i][3];
        var dataHora = information[i][4];
        historico.add(OrderInfo(
          id: i,
          date: DateTime.now(),
          driverInfo: DriverInfo(
            name: 'Lucas',
            thumbnailUrl:
                'https://i.pinimg.com/originals/08/45/81/084581e3155d339376bf1d0e17979dc6.jpg',
          ),
          deliveryProcesses: [
            DeliveryProcess(
              'Inicio do plantio',
              messages: [
                DeliveryMessage('8:30am', '200 sementes'),
              ],
            ),
            DeliveryProcess(
              'Aplicacao de anti-praga',
              messages: [
                DeliveryMessage('13:00pm',
                    'Puro Neen Óleo Natural Anti Pragas Quimiagri 1 Litro'),
              ],
            ),
            DeliveryProcess.complete(),
          ],
        ));

        i++;
      }
    });
  }

  @override
  void resetState() {}
}

class OrderInfo {
  const OrderInfo({
    required this.id,
    required this.date,
    required this.driverInfo,
    required this.deliveryProcesses,
  });

  final int id;
  final DateTime date;
  final DriverInfo driverInfo;
  final List<DeliveryProcess> deliveryProcesses;
}

class DriverInfo {
  const DriverInfo({
    required this.name,
    required this.thumbnailUrl,
  });

  final String name;
  final String thumbnailUrl;
}

class DeliveryProcess {
  const DeliveryProcess(
    this.name, {
    this.messages = const [],
  });

  const DeliveryProcess.complete()
      : this.name = 'Done',
        this.messages = const [];

  final String name;
  final List<DeliveryMessage> messages;

  bool get isCompleted => name == 'Done';
}

class DeliveryMessage {
  const DeliveryMessage(this.createdAt, this.message);

  final String createdAt; // final DateTime createdAt;
  final String message;

  @override
  String toString() {
    return '$createdAt $message';
  }
}
