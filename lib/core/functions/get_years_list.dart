import 'package:graph/core/services/get_it_service.dart';
import 'package:graph/core/utils/years_and_major.dart';
import 'package:graph/features/profile/data/repos/profile_local_data_source.dart';


ProfileLocalDataSource profileLocalDataSource = getIt.get<ProfileLocalDataSource>();

  Future<List<String>> getYearsList() async {
    final studentYear = await profileLocalDataSource.getStudentYear();
    return List.generate(studentYear, (index){
      int i = index + 1;
      return Year.yearbyId[i]!;
    });
  }