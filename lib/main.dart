import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:restaurant/view_model/data/local/shared_helper.dart';
import 'firebase_options.dart';
import 'my_app.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedHelper.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

