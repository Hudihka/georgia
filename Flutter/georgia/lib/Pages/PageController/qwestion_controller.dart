import 'package:flutter/material.dart';
import 'package:georgia/Model/qwestion.dart';
import 'package:georgia/Recources/enum_colors.dart';

class QwestionController extends StatelessWidget {
  final Qwestion qwestion;

  QwestionController({required this.qwestion});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [],
    );
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

    return 
    
    
    
    
    
    // MaterialButton(
    //     color: EnumColors.clear.color(),
    //     onPressed: () {
    //             print(index);
    //           }
    //           );
  }
}

/*
    private func generateViewButton(index: Int) -> UIView {
        let view = UIView()
        view.backgroundColor = EnumColors.white
        view.addRadius(number: 8)
        
        let labelNumber = UILabel()
        labelNumber.textColor = EnumColors.black
        labelNumber.font = EnumFont.bold(18).font
        labelNumber.text = "\(index + 1)"
        labelNumber.textAlignment = .center
        
        let labelQwestion = UILabel()
        labelQwestion.textColor = EnumColors.black
        labelQwestion.font = EnumFont.semibold(18).font
        labelQwestion.textAlignment = .left
        labelQwestion.numberOfLines = 0
        labelQwestion.text = qwestion?.answer.qwestions[index]
        
        view.addSubview(labelNumber)
        labelNumber.snp.makeConstraints { make in
            make.size.equalTo(20)
            make.left.equalToSuperview().inset(Offsets.constant8)
            make.centerY.equalTo(view.snp.centerY)
        }
        
        let widthLabel = wDdevice - 20 - 2 * Offsets.constant8 - 2 * Offsets.constant16
        view.addSubview(labelQwestion)
        labelQwestion.snp.makeConstraints { make in
            make.right.top.bottom.equalToSuperview().inset(Offsets.constant8)
            make.left.equalTo(labelNumber.snp.right).offset(Offsets.constant8)
            make.height.greaterThanOrEqualTo(20)
            make.width.equalTo(widthLabel)
        }
        
        view.addBorder(number: 3, color: EnumColors.black)
        
        if let answerTest = qwestion?.answerTest {
            if answerTest.indexTrue == index + 1 {
                view.backgroundColor = EnumColors.green
            } else if answerTest.indexWrong == index + 1 {
                view.backgroundColor = EnumColors.red
            }
        } else {
            
            let button = UIButton()
            button.tag = index + 1
            button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            button.setTitle(nil, for: .normal)
            view.addSubview(button)
            button.snp.makeConstraints { make in
                make.top.bottom.left.right.equalToSuperview()
            }
        }
        
        
        
        return view
    }
*/