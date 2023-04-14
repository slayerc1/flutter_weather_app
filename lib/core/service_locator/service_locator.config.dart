// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/weather/data/datasources/weather_datasource.dart' as _i5;
import '../../features/weather/data/repositories/weather_repository_impl.dart'
    as _i7;
import '../../features/weather/domain/repositories/weather_repository.dart'
    as _i6;
import '../../features/weather/presentation/bloc/weather_bloc.dart' as _i8;
import '../blocs/gps/gps_bloc.dart' as _i3;
import '../blocs/location/location_bloc.dart' as _i4;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i3.GpsBloc>(() => _i3.GpsBloc());
    gh.factory<_i4.LocationBloc>(() => _i4.LocationBloc());
    gh.factory<_i5.WeatherDatasource>(() => _i5.WeatherDatasource());
    gh.factory<_i6.WeatherRepository>(
        () => _i7.WeatherRepositoryImpl(gh<_i5.WeatherDatasource>()));
    gh.factory<_i8.WeatherBloc>(
        () => _i8.WeatherBloc(gh<_i6.WeatherRepository>()));
    return this;
  }
}
