import 'package:airpay/src/helpers/dialog_helper.dart';
import 'package:airpay/src/utilities/app_exception_helper.dart';

class BaseController {
  void handleError(error)
  {
    if (error is BadRequestException){
      var message = error.message;
      DialogHelper.showErrorDialog(message: message);
    } else if (error is FetchDataException){
      var message = error.message;
      DialogHelper.showErrorDialog(message: message);
    } else if(error is ApiNotRespondingException){
      DialogHelper.showErrorDialog(message: 'Opps! It took longer to respond');
    }
  }
}