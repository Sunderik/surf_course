// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:task_280049/core/core.dart' as _i8;
import 'package:task_280049/core/domain/models/colors_state_model.dart' as _i7;
import 'package:task_280049/core/logic/repositories/colors_repository.dart' as _i5;
import 'package:task_280049/core/logic/services/file_service.dart' as _i3;
import 'package:task_280049/core/logic/services/notification_service.dart' as _i4;
import 'package:task_280049/core/logic/usecases/colors_usecase.dart' as _i6;

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
    gh.factory<_i3.IFileService>(() => _i3.FileServiceImpl());
    gh.factory<_i4.INotificationService>(() => _i4.SnackBarNotificationService());
    gh.factory<_i5.IColorsRepository>(() => _i5.ColorsRepositoryImpl(gh<_i3.IFileService>()));
    gh.singleton<_i6.ColorsUseCase>(_i6.ColorsUseCase(gh<_i5.IColorsRepository>()));
    gh.singleton<_i7.ColorsStateModel>(_i7.ColorsStateModel(gh<_i8.ColorsUseCase>()));
    return this;
  }
}
