import 'package:permission_handler/permission_handler.dart';

import '../../../core/view_models/base_view_model.dart';

class CameraVM extends BaseViewModel{


  CameraVM(){
    cameraPermission();
  }
cameraPermission() async {
  var status = await Permission.camera.status;
  if (status.isDenied) {
    // We didn't ask for permission yet or the permission has been denied before but not permanently.
  }

// You can can also directly ask the permission about its status.
  if (await Permission.location.isRestricted) {
    // The OS restricts access, for example because of parental controls.
  }
  var cameraPermission = await Permission.camera.status;
  print("camera permissions is $cameraPermission");
  final permissionStatus = await Permission.camera.request();




  
  if (permissionStatus == PermissionStatus.granted) {
    // navigate to Xyz screen.
  } else {

  }

}
}