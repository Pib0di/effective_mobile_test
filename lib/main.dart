import 'package:effective_mobile_test/core/api/dio_factory.dart';
import 'package:effective_mobile_test/core/api/rest_client.dart';
import 'package:effective_mobile_test/core/services/storage_service.dart';
import 'package:effective_mobile_test/ui/pages/app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //init service
  final prefs = await SharedPreferences.getInstance();
  final storageService = StorageService(prefs);

  //init repository
  final restDio = DioFactory.newInstance();
  final restApi = RestClient(restDio);

  runApp(
    MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (_) => storageService, lazy: false),
        RepositoryProvider(create: (_) => restApi, lazy: false),
      ],
      child: const App(),
    ),
  );
}
