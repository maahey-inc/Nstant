import '../../../core/enums/view_state.dart';
import '../../../core/view_models/base_view_model.dart';

class WelcomeViewModel extends BaseViewModel{
  loginWithEmailPassword() async {
    setState(ViewState.busy);

    //request from server
    setState(ViewState.idle);
  }
}