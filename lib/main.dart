import 'package:flutter/material.dart';
import 'package:for_shared_preferences/for_shared_preferences.dart';
import 'package:for_shared_preferences/services/shared_preference_service/shared_preference_service.dart';
import 'domain/repositories/shared_preference_repository.dart';

///TODO : shared_preferences :
///likes - 8687
///pub points - 140
///popularity - 100 %
///date : 27/02/2024

late final LocalRepository localRepository;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final db = await LocalDataSourceImpl.init;
  LocalDataSource dataSource = LocalDataSourceImpl(db: db);
  localRepository = LocalRepositoryImpl(dataSource: dataSource);

  runApp(const ForSharedPreferences());
}
