import 'package:dio/dio.dart';
import 'package:get/get.dart' as getx;

import '../../common_functionality/logout/model/logout_response_model.dart';
import '../../routes/routes.dart';
import '../../storage/local_storage.dart';
import '../../utils/ui_utils.dart';
import '../api_hitter.dart';
import '../app_end_points.dart';
import '../dio_exceptions.dart';

class CommonProvider {
  ApiHitter apiHitter = ApiHitter();

  Future<LogoutResponseModel?> logOutAPI() async {
    try {
      Response response = await apiHitter.postApi(endPoint: EndPoints.logOut);

      LogoutResponseModel data = LogoutResponseModel.fromJson(response.data);
      Prefs.erase();
    //  getx.Get.offAllNamed(Routes.loginScreen);

      showResponseData(
        data,
        type: 'logOutAPI',
      );
      return data;
    } catch (e) {
      if (e is DioException) {
        throw DioExceptions.fromDioError(dioError: e);
      }
    }
    return null;
  }
}
