import 'package:contact_list/features/contact/domain/usecases/contact_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resources/data_state.dart';
import 'get_contact_list_event.dart';
import 'get_contact_list_state.dart';

class GetContactListBloc extends Bloc<GetContactListEvent, GetContactListState> {
  final ContactUseCase _contactUseCase;

  GetContactListBloc(this._contactUseCase) : super(GetContactListInitial()) {
    on<GetContactListRequested>(onGetContactList);
  }

  Future<void> onGetContactList(
    GetContactListRequested event,
    Emitter<GetContactListState> emit,
  ) async {
    emit(GetContactListLoading());

    final result = await _contactUseCase.getContactList();

    if(result is DataStateSuccess) {
      emit(GetContactListSuccess(contactList: result.data!));
    }

    if(result is DataStateException) {
      emit(GetContactListFailure(message: result.exception));
    }
  }
}