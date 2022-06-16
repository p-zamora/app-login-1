import 'package:apppzl/core/network/networkInfo.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class NetWorkInfoImpl implements NetWorkInfo{
  final InternetConnectionChecker connectionChecker;

  NetWorkInfoImpl({ required this.connectionChecker});

  @override 
  Future<bool> get isConnected => connectionChecker.hasConnection;

}