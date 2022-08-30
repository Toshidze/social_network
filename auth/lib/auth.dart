import 'dart:io';

import 'package:auth/controller/app_auth_controller.dart';
import 'package:auth/controller/app_token_controller.dart';
import 'package:auth/controller/app_user_controller.dart';
import 'package:conduit/conduit.dart';

class AppService extends ApplicationChannel {
  late final ManagedContext managedContext;

  @override
  Future prepare() {
    final persistentStore = _initDatabase();
    managedContext = ManagedContext(
        ManagedDataModel.fromCurrentMirrorSystem(), persistentStore);
    return super.prepare();
  }

  @override
  Controller get entryPoint => Router()
    ..route('token/[:refresh]').link(() => AppAuthController(managedContext))
    ..route('user')
        .link(() => AppTokenController())!
        .link(() => AppUserController(managedContext));

  PostgreSQLPersistentStore _initDatabase() {
    final username = Platform.environment['DB_USERNAME'] ?? 'admin';
    final password = Platform.environment['DB_PASSWORD'] ?? 'root';
    final host = Platform.environment['DB_HOST'] ?? '127.0.0.1';
    final port = int.parse(Platform.environment['DB_PORT'] ?? '5432');
    final databaseName = Platform.environment['DB_NAME'] ?? 'postgres';
    return PostgreSQLPersistentStore(
      username,
      password,
      host,
      port,
      databaseName,
    );
  }
}
