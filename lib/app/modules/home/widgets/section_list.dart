import 'dart:io';

import 'package:Venda_Online_Ui/app/data/model/home.dart';
import 'package:Venda_Online_Ui/app/modules/home/widgets/section_header.dart';
import 'package:flutter/material.dart';

import 'item_tile.dart';

class SectionList extends StatelessWidget {
  const SectionList(this.section);

  final HomeModel section;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SectionHeader(section),
          SizedBox(
            height: 150,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                return ItemTile(section.imagens[index]);
              },
              separatorBuilder: (_, __) => const SizedBox(
                width: 4,
              ),
              itemCount: section.imagens.length,
            ),
          )
        ],
      ),
    );
  }
}
