import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:nvh_movie_app/di/app_injector.dart';

import 'injection.config.dart';
import 'injector.dart';

final getIt = GetIt.instance;

class MovieInjectionModule extends InjectionModule {
  MovieInjectionModule._();

  static final MovieInjectionModule _instance = MovieInjectionModule._();

  static MovieInjectionModule get I => _instance;

  @override
  Future<void> dependencies({
    required Injector injector,
  }) async => _configureDependencies();
}
@InjectableInit(
  initializerName: 'initData',
  preferRelativeImports: false,
  asExtension: false,
)
Future _configureDependencies() async {
  await initData(AppInjector.I.instance);
}

abstract class InjectionModule {
  Future<void> dependencies({
    required Injector injector,
  });
}

