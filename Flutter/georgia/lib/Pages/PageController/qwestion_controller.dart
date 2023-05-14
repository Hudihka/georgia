import 'package:flutter/material.dart';
import 'package:georgia/Model/qwestion.dart';
import 'package:georgia/Recources/enum_colors.dart';
import 'package:georgia/Recources/enum_offsets.dart';

import '../../Data/images_manager.dart';
import '../../Recources/enum_font.dart';
import '../../Support/constant.dart';
import 'package:url_launcher/url_launcher.dart';

class QwestionController extends StatelessWidget {
  final Qwestion qwestion;

  const QwestionController({super.key, required this.qwestion});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _listAllWidgets(),
    );
    // return CustomScrollView(
    //   slivers: _listAllWidgets(),
    // );
  }

  List<Widget> _listAllWidgets() {
    List<Widget> list = [];
    final Widget spacer = Container(
      height: EnumOffsets.offset8.offset(),
    );

    if (_imageWidget() != null) {
      list.add(_imageWidget()!);
      list.add(spacer);
    }

    list.add(_title());
    list.add(spacer);

    int maxIndex = qwestion.answer.qwestions().length;

    for (var i = 0; i < maxIndex; i++) {
      list.add(_buttonOfIndex(i));
      list.add(spacer);
    }

    list.add(_buttonWeb());
    list.add(spacer);

    return list;
  }

  Widget? _imageWidget() {
    final Image? image = ImagesManager.getImage(qwestion.idQwestion);

    if (image == null) {
      return null;
    }

    return GestureDetector(
        onTap: () {
          print("object");
        },
        child: SizedBox(
          height: Const.widthDewice * 0.70,
          width: Const.widthDewice,
          child: image,
        ));
  }

  Widget _title() {
    return Padding(
        padding:
            EdgeInsets.symmetric(horizontal: EnumOffsets.offset16.offset()),
        child: Text(qwestion.title,
            textAlign: TextAlign.left,
            maxLines: 999,
            style: TextStyleExtension.generate(
                size: 22, style: EnumFontStyle.semiBold)));
  }

  Widget _buttonOfIndex(int index) {
    final isEnableButton = qwestion.answerTest == null;
    EnumColors colorBacground = EnumColors.white;

    if (qwestion.answerTest != null) {
      final int indexTrue = qwestion.answerTest!.indexTrue;

      if (indexTrue == index + 1) {
        colorBacground = EnumColors.green;
      } else if (qwestion.answerTest?.indexWrong != null &&
          qwestion.answerTest!.indexWrong == index + 1) {
        colorBacground = EnumColors.red;
      }
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: EnumOffsets.offset16.offset()),
      child: GestureDetector(
          onTap: isEnableButton
              ? () {
                  print(index);
                }
              : null,
          child: Container(
            decoration: BoxDecoration(
                color: colorBacground.color(),
                border: Border.all(color: EnumColors.black.color(), width: 3),
                borderRadius: BorderRadius.all(Radius.circular(8))),
            child: Row(children: [
              Container(
                width: EnumOffsets.offset8.offset(),
              ),
              SizedBox(
                width: 20,
                height: 20,
                child: Text("${index + 1}",
                    textAlign: TextAlign.center,
                    style: TextStyleExtension.generate(
                        size: 16, style: EnumFontStyle.bold)),
              ),
              Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(qwestion.answer.qwestions()[index],
                      textAlign: TextAlign.left,
                      maxLines: 999,
                      style: TextStyleExtension.generate(
                          size: 18, style: EnumFontStyle.bold)))
            ]),
          )),
    );
  }

  Widget _buttonWeb() {
    return Container(
      width: double.infinity,
      child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: EnumOffsets.offset16.offset()),
          child: MaterialButton(
              onPressed: () async {
                String url =
                    "https://teoria.on.ge/tickets?ticket=${qwestion.idQwestion}";
                final uri = Uri.parse(url);
                if (await canLaunchUrl(uri)) {
                  await launchUrl(uri);
                }
              },
              color: EnumColors.black.color(),
              height: 40,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                "На сайт (${qwestion.idQwestion})",
                textAlign: TextAlign.center,
                style: TextStyleExtension.generate(
                    size: 18,
                    style: EnumFontStyle.semiBold,
                    color: EnumColors.white),
              ))),
    );
  }
}
