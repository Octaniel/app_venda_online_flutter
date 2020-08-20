import 'package:Venda_Online_Ui/app/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerTile extends StatelessWidget {
  final IconData iconData;
  final String title;
  final String url;

   DrawerTile({this.iconData, this.title, this.url});

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).primaryColor;
    return InkWell(
      onTap: () {
        Get.find<AppController>().url = url;
        print(url);
        Get.offNamed(url);
      },
      child: SizedBox(
        height: 60,
        child: GetX<AppController>(
          builder: (value){
            return Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  child: Icon(
                    iconData,
                    size: 32,
                    color: value.url == url?primaryColor:Colors.grey[700],
                  ),
                ),
                Text(title,
                  style: TextStyle(
                    fontSize: 16,
                    color: value.url == url?primaryColor:Colors.grey[700],
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
