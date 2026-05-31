import 'dart:io';

import 'package:city_drive/src/feature/auth/models/user_dto.dart';
import 'package:image_picker/image_picker.dart';
import 'package:city_drive/src/core/rest_client/rest_client.dart';
import 'package:city_drive/src/feature/auth/models/request/user_payload.dart';
import 'package:city_drive/src/feature/profile/data/profile_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_cubit.freezed.dart';

class ProfileCubit extends Cubit<ProfileCubitState> {
  ProfileCubit({
    required IProfileRepository repository,
  })  : _repository = repository,
        super(const ProfileCubitState.initial());
  final IProfileRepository _repository;

  Future<void> updateProfile({
    required UserPayload userPayload,
    XFile? avatar,
  }) async {
    try {
      emit(const ProfileCubitState.loading());

      final result = await _repository.editProfile(
        payload: userPayload,
        imageFile: avatar,
      );
      // log('$user', name: 'edit cubit response');
      emit(ProfileCubitState.loaded(dto: result));
    } on RestClientException catch (e) {
      emit(
        ProfileCubitState.error(
          message: e.message,
        ),
      );
    } catch (e) {
      emit(
        ProfileCubitState.error(
          message: e.toString(),
        ),
      );
    }
  }

  Future<void> deleteProfile() async {
    try {
      emit(const ProfileCubitState.loading());

      await _repository.deleteProfile();
      // log('$user', name: 'edit cubit response');
      emit(const ProfileCubitState.deleted());
    } on RestClientException catch (e) {
      emit(
        ProfileCubitState.error(
          message: e.message,
        ),
      );
    } catch (e) {
      emit(
        ProfileCubitState.error(
          message: e.toString(),
        ),
      );
    }
  }
}

@freezed
class ProfileCubitState with _$ProfileCubitState {
  const factory ProfileCubitState.initial() = _InitialState;

  const factory ProfileCubitState.loading() = _LoadingState;
  const factory ProfileCubitState.deleted() = _DeletedState;

  const factory ProfileCubitState.loaded({required UserDTO dto}) = _LoadedState;

  const factory ProfileCubitState.error({
    required String message,
  }) = _ErrorState;
}
