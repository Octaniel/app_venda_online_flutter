import 'package:Venda_Online_Ui/app/routes/app_pages.dart';
import 'package:Venda_Online_Ui/app/widgets/drawer/drawer_tile.dart';
import 'package:flutter/material.dart';

import 'custom_drawer_header.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [
                const Color.fromARGB(255, 203, 236, 241),
                Colors.white,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )),
          ),
          ListView(
            children: [
              CustomDrawerHeader(),
              DrawerTile(
                title: "Home",
                iconData: Icons.home,
                url: Routes.HOME,
              ),
              DrawerTile(
                title: "Produtos",
                iconData: Icons.list,
                url: Routes.PRODUTO,
              ),
              DrawerTile(
                title: "Meus Pedidos",
                iconData: Icons.playlist_add_check,
                url: "/meus_pedidos",
              ),
              DrawerTile(
                title: "Lojas",
                iconData: Icons.location_on,
                url: "/lojas",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
