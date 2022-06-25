import 'package:flutter/cupertino.dart';
import '../../../core/view_models/base_view_model.dart';

class PageViewerVM extends BaseViewModel{

  int _currentPage=0;
  int get currentPage=>_currentPage;
  setPage(int page){
    _currentPage=page;
    notifyListeners();

  }



  List<Map<String,String>> pageViewData=[
    {
      "text":"Hold down on any app\nto edit your home screen",
      "image":"assets/icons/mobile_4.png"
    }, {
      "text":"Tap the plus button\non the top left corner",
      "image":"assets/icons/mobile_2.png"
    }, {
      "text":"Search for Nstant\nand add the widget",
      "image":"assets/icons/mobile_3.png"
    },
  ];

}