import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../core/view_models/base_view_model.dart';


class AddContactViewModel extends BaseViewModel {
  BuildContext context;


  AddContactViewModel({required this.context}) {
    getContact();
  }
  List<Contact>? _contacts;
  List<Contact>? get contact=>_contacts;
  void getContact() async {
    if (await FlutterContacts.requestPermission()) {
      _contacts = await FlutterContacts.getContacts(
          withProperties: true, withPhoto: true);
      print("${_contacts!.length}");
     notifyListeners();
    }
  }
  ///////////////////////////////////////////////////////////////////

  bool _loading = false;
  String? searchTerm;
  String _searchTerm = '';



  ///////////////////////////////////////////////////////////////////

  bool _hasPermission = false;

  bool get hasPermission => _hasPermission;

  setHasPermission(bool permission) {
    _hasPermission = permission;
    notifyListeners();
  }


  TextEditingController _searchController = TextEditingController();

  TextEditingController get searchController => _searchController;

  setName(TextEditingController controller) {
    _searchController = controller;
    notifyListeners();
  }



  void _handleInvalidPermissions(PermissionStatus permissionStatus) {
    if (permissionStatus == PermissionStatus.denied) {
      throw PlatformException(
          code: 'PERMISSION_DENIED',
          message: 'Access to location data denied',
          details: null);
    } else if (permissionStatus == PermissionStatus.restricted) {
      throw PlatformException(
          code: 'PERMISSION_DISABLED',
          message: 'Location data is not available on device',
          details: null);
    }
  }

  Future<PermissionStatus> _getContactPermission() async {
    final status = await Permission.contacts.status;
    if (!status.isGranted) {
      final result = await Permission.contacts.request();
      return result;
    } else {
      return status;
    }
  }

}