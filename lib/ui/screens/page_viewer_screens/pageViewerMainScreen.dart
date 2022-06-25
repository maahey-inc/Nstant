import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/ui/screens/finish_screen/finishScreen.dart';
import 'package:my_app/ui/screens/page_viewer_screens/pageViewContent.dart';
import 'package:my_app/ui/screens/page_viewer_screens/pageViewerVM.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/colorsConstant.dart';
import '../../../core/utils/textStyle.dart';
import '../../widgets/buttonDefault.dart';


class PageViewerMainScreen extends StatelessWidget {
  const PageViewerMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PageViewerVM>(
      builder: (context, pageModel, child) => Scaffold(
        backgroundColor: backgroundMainColor,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Text(
                    "Finally, add the widget\nto your home screen",
                    style: headingTextStyleNew,
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
              Expanded(
                flex: 8,
                child: PageView.builder(
                    onPageChanged: (val) => pageModel.setPage(val),
                    itemCount: pageModel.pageViewData.length,
                    itemBuilder: (context, index) => PageViewContent(
                        text: pageModel.pageViewData[index]["text"].toString(),
                        image:
                            pageModel.pageViewData[index]["image"].toString())),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        pageModel.pageViewData.length,
                        (index) => AnimatedContainer(
                          margin: EdgeInsets.all(5),
                          duration: const Duration(milliseconds: 200),
                          height: 6,
                          width: pageModel.currentPage == index ? 20 : 6,
                          decoration: BoxDecoration(
                              color: pageModel.currentPage == index
                                  ? textColorPrimary
                                  : textColorSecondary,
                              borderRadius: BorderRadius.circular(3)),
                        ),
                      ),
                    ),
                    const Spacer(),
                    DefaultButton(
                      txtStyle: buttonSimpleTextStyleNew,
                      btnColor: backgroundWidgetColor,
                      press: () {
                         Get.to(const FinishScreen());
                      },
                      text: "I've enabled the Widget",
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
