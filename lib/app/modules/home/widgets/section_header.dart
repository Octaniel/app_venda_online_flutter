import 'package:Venda_Online_Ui/app/data/model/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:velocity_x/velocity_x.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader(this.section);

  final HomeModel section;

  @override
  Widget build(BuildContext context) {
    return section.nome.text.white.extraBold
        .size(18)
        .make()
        .box
        .padding(EdgeInsets.symmetric(vertical: 8))
        .make();
  }
}
