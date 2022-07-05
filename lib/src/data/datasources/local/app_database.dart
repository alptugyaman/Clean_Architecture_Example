import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'package:tokens/src/data/datasources/local/DAOs/alert_dao.dart';
import 'package:tokens/src/domain/entities/alert_tokens.dart';

part 'app_database.g.dart';

@Database(version: 1, entities: [AlertTokens])
abstract class AppDatabase extends FloorDatabase {
  AlertDao get alertDao;
}
