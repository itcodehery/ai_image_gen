import 'package:equatable/equatable.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../utils/app_directory.dart';
import '../utils/strings.dart';

part 'app_directory_state.dart';

class AppDirectoryCubit extends Cubit<AppDirectoryState> {
  AppDirectoryCubit(String path) : super(AppDirectoryInitial(path)) {
    getPath();
  }

  Future<void> changePath(String path) async {
    await PathSharedPreferences.setPath(path);
    emit(AppDirectoryUpdated(path));
  }

  Future<void> getPath() async {
    final String? selectedPath = await PathSharedPreferences.getPath();
    emit(AppDirectoryUpdated(selectedPath ?? pathHint));
  }

  Future<void> resetPath() async {
    await PathSharedPreferences.setPath('');
    emit(AppDirectoryInitial());
  }
}
