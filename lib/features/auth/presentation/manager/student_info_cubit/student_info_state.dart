part of 'student_info_cubit.dart';

@immutable
sealed class StudentInfoState {}

final class StudentInfoInitial extends StudentInfoState {}

final class StudentInfoLoading extends StudentInfoState {}

final class StudentInfoSuccess extends StudentInfoState {
  final Map<String, dynamic> response;

 StudentInfoSuccess(this.response);
  
}

final class StudentInfoFailuer extends StudentInfoState {
  final String errorMessage;

 StudentInfoFailuer(this.errorMessage);
}


