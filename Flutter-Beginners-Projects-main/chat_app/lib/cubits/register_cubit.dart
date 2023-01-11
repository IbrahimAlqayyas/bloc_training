import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'register_states.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
}
