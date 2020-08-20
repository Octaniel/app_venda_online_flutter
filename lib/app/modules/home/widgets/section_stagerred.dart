import 'dart:io';

import 'package:Venda_Online_Ui/app/data/model/home.dart';
import 'package:Venda_Online_Ui/app/modules/home/widgets/section_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import 'item_tile.dart';

class SectionStaggered extends StatelessWidget {
  const SectionStaggered(this.section);

  final HomeModel section;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SectionHeader(section),
          GridView.count(
            crossAxisCount: 2,
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            children: section.imagens.map((e) => AspectRatio( aspectRatio: 1,
              child: ItemTile(e),
            )).toList(),
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
          ),
//          StaggeredGridView.countBuilder(
//            padding: EdgeInsets.zero,
//            shrinkWrap: true,
//            crossAxisCount: 4,
//            itemCount: section.items.length,
//            itemBuilder: (_, index) {
//              return Image.network(
//                section.items[index].image,
//                fit: BoxFit.cover,
//              );
//            },
//            staggeredTileBuilder: (index) =>
//                StaggeredTile.count(2, index.isEven ? 2 : 1),
//            mainAxisSpacing: 4,
//            crossAxisSpacing: 4,
//          )
        ],
      ),
    );
  }
}
