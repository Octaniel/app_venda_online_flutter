import 'package:Venda_Online_Ui/app/modules/home/widgets/section_list.dart';
import 'package:Venda_Online_Ui/app/modules/home/widgets/section_stagerred.dart';
import 'package:Venda_Online_Ui/app/routes/app_pages.dart';
import 'package:Venda_Online_Ui/app/widgets/drawer/custom_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import '../home_controller.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends GetView<HomeController> {
  final WebSocketChannel channel = IOWebSocketChannel.connect(
      Uri(scheme: "ws", host: "localhost", port: 8080, path: "/socket"));

  @override
  Widget build(BuildContext context) {
    _sendMessage();
    return Scaffold(
      drawer: CustomDrawer(),
      body: Stack(
        children: [
        StreamBuilder(
        stream: channel.stream,
        builder: (context, snapshot) {
          controller.getAll();
          return snapshot.hasData
              ? snapshot.data
              .toString()
              .text
              .make()
              : ''.text.make();
        },
      ),
      Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: const [
                  Color.fromARGB(255, 211, 118, 130),
                  Color.fromARGB(255, 253, 181, 168)
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          ),
          CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                snap: true,
                floating: true,
                elevation: 0,
                backgroundColor: Colors.transparent,
                flexibleSpace: const FlexibleSpaceBar(
                  title: Text('Loja do Daniel'),
                  centerTitle: true,
                ),
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.shopping_cart),
                    color: Colors.white,
                    onPressed: () => Get.toNamed(Routes.CARRINHO),
                  ),
                ],
              ),
              GetBuilder<HomeController>(
                builder: (homeController) {
                  final List<Widget> children = homeController.homeList.map<
                      Widget>(
                          (section) {
                        switch (section.tipo) {
                          case 'List':
                            return SectionList(section);
                          case 'Staggered':
                            return SectionStaggered(section);
                          default:
                            return Container();
                        }
                      }
                  ).toList();

                  return SliverList(
                    delegate: SliverChildListDelegate(children),
                  );
                },
              )],
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _sendMessage() {
    channel.sink.add("jj");
  }
}
