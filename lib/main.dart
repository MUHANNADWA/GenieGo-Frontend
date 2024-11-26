import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:geniego/app.dart';

void main() async {
  // Initialize Widgets Binding
  WidgetsFlutterBinding.ensureInitialized();

  // await dotenv.load();

  // final ipv4 = await Ipify.ipv4();
  // log(ipv4.toString());

  // final mygeo = await Ipify.geo(dotenv.env['IPTFY_GEO_KEY']!, ip: ipv4);
  // log(mygeo.location!.country.toString());

  // Initialize Get Storage
  await GetStorage.init();

  // Run App
  runApp(const App());
}
