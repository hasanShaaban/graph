class SignupDataModel {


  final String? firstName;
  final String? lastName;
  final String? birthDate;
  final String? gender;
  final String? studyYear;
  final String? specialization;
  final String? role;
  final String? image;
  final bool? isStudent;

  SignupDataModel({
 
    this.firstName,
    this.lastName,
    this.birthDate,
    this.gender,
    this.studyYear,
    this.specialization,
    this.role,
    this.image,
    this.isStudent,
  });

  SignupDataModel copyWith({
    String? firstName,
    String? lastName,
    String? birthDate,
    String? gender,
    String? studyYear,
    String? specialization,
    String? role,
    String? image,
    bool? isStudent,
  }) {
    return SignupDataModel(
 
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      birthDate: birthDate ?? this.birthDate,
      gender: gender ?? this.gender,
      studyYear: studyYear ?? this.studyYear,
      specialization: specialization ?? this.specialization,
      role: role ?? this.role,
      image: image ?? this.image,
      isStudent: isStudent ?? this.isStudent,
    );
  }
}
