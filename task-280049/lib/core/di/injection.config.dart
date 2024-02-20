// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:task_280049/core/core.dart' as _i9;
import 'package:task_280049/core/domain/models/colors_state_model.dart' as _i8;
import 'package:task_280049/core/logic/mappers/color_mapper.dart' as _i3;
import 'package:task_280049/core/logic/repositories/colors_repository.dart'
    as _i6;
import 'package:task_280049/core/logic/services/file_service.dart' as _i4;
import 'package:task_280049/core/logic/services/notification_service.dart'
    as _i5;
import 'package:task_280049/core/logic/usecases/colors_usecase.dart' as _i7;

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
    gh.singleton<_i3.ColorMapper>(_i3.ColorMapper());
    gh.factory<_i4.IFileService>(() => _i4.FileServiceImpl());
    gh.factory<_i5.INotificationService>(
        () => _i5.SnackBarNotificationService());
    gh.factory<_i6.IColorsRepository>(() => _i6.ColorsRepositoryImpl(
          gh<_i4.IFileService>(),
          gh<_i3.ColorMapper>(),
        ));
    gh.singleton<_i7.ColorsUseCase>(
        _i7.ColorsUseCase(gh<_i6.IColorsRepository>()));
    gh.singleton<_i8.ColorsStateModel>(
        _i8.ColorsStateModel(gh<_i9.ColorsUseCase>()));
    return this;
  }
}
