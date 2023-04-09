import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkChecker{
  Future<bool> get isConnect;
}
class NetworkCheckerWithPackage implements NetworkChecker{
  final intrentcheck=InternetConnectionChecker();
  @override
  Future<bool> get isConnect =>intrentcheck.hasConnection;

}