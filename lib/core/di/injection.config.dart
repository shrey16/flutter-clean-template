// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_clean_template/app/router/app_router.dart' as _i635;
import 'package:flutter_clean_template/core/di/app_module.dart' as _i31;
import 'package:flutter_clean_template/features/counter/data/datasources/counter_local_data_source.dart'
    as _i1053;
import 'package:flutter_clean_template/features/counter/data/repositories/counter_repository_impl.dart'
    as _i573;
import 'package:flutter_clean_template/features/counter/domain/repositories/counter_repository.dart'
    as _i814;
import 'package:flutter_clean_template/features/counter/domain/usecases/get_counter.dart'
    as _i722;
import 'package:flutter_clean_template/features/counter/domain/usecases/increment_counter.dart'
    as _i153;
import 'package:flutter_clean_template/features/counter/presentation/bloc/counter_bloc.dart'
    as _i508;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final appModule = _$AppModule();
    gh.lazySingleton<_i635.AppRouter>(() => appModule.appRouter);
    gh.lazySingleton<_i361.Dio>(() => appModule.dio);
    gh.lazySingleton<_i1053.CounterLocalDataSource>(
      () => _i1053.CounterLocalDataSourceImpl(),
    );
    gh.lazySingleton<_i814.CounterRepository>(
      () => _i573.CounterRepositoryImpl(gh<_i1053.CounterLocalDataSource>()),
    );
    gh.factory<_i722.GetCounter>(
      () => _i722.GetCounter(gh<_i814.CounterRepository>()),
    );
    gh.factory<_i153.IncrementCounter>(
      () => _i153.IncrementCounter(gh<_i814.CounterRepository>()),
    );
    gh.factory<_i508.CounterBloc>(
      () => _i508.CounterBloc(
        gh<_i722.GetCounter>(),
        gh<_i153.IncrementCounter>(),
      ),
    );
    return this;
  }
}

class _$AppModule extends _i31.AppModule {}
