import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_storage/get_storage.dart';
import 'package:geniego/app.dart';

void main() async {
  // Initialize Widgets Binding
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Environment Variables
  await dotenv.load();

  // Initialize Get Storage
  await GetStorage.init();

  // Run App
  runApp(const App());
}
