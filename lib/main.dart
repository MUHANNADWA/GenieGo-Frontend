import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:geniego/utils/helpers/helper_functions.dart';
import 'package:get_storage/get_storage.dart';
import 'package:geniego/app.dart';

void main() async {
  // Initialize Widgets Binding
  WidgetsFlutterBinding.ensureInitialized();

  BackgroundIsolateBinaryMessenger.ensureInitialized(
      ServicesBinding.rootIsolateToken!);

  // Initialize Environment Variables
  await dotenv.load();

  // Initialize Get Storage
  await GetStorage.init();

  // To Delete Everything In Storage
  // GetStorage().erase();

  AppHelper.setFullScreen(true);

  // Run App
  runApp(const App());
}
