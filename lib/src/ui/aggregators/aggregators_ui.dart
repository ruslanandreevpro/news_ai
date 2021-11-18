import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';
import 'package:news_ai/src/widgets/widgets.dart';

class AggregatorsUI extends StatelessWidget {
  AggregatorsUI({Key? key}) : super(key: key);

  static const String routeName = '/aggregators';

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => AggregatorsUI(),
    );
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final String _title = 'Источники';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawerEnableOpenDragGesture: false,
      appBar: CustomAppBar(
        scaffoldKey: _scaffoldKey,
        title: _title,
      ),
      drawer: CustomDrawer(),
      body: Obx(() => ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Obx(() => ListTile(
            leading: Text('${index + 1}'),
            title: Text('Название'),
            subtitle: Text('Источник'),
            trailing: IconButton(
              icon: const Icon(LineIcons.trash),
              onPressed: () {},
            ),
            onTap: () {
              // Get.defaultDialog(
              //     titlePadding: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0.0),
              //     contentPadding: const EdgeInsets.all(24.0),
              //     title: 'Редактирование источника',
              //     content: Column(
              //       children: [
              //         FormInputFieldWithIcon(
              //           controller: _databaseController.sourceTitleController,
              //           iconPrefix: LineIcons.heading,
              //           labelText: 'Название источника',
              //           validator: (value) {},
              //           keyboardType: TextInputType.text,
              //           onChanged: (value) {},
              //           onSaved: (value) => _databaseController.sourceTitleController.text = value!,
              //           maxLines: 1,
              //         ),
              //         const SizedBox(height: 16.0,),
              //         FormInputFieldWithIcon(
              //           controller: _databaseController.sourceURLController,
              //           iconPrefix: LineIcons.chrome,
              //           labelText: 'Адрес источника',
              //           validator: (value) {},
              //           keyboardType: TextInputType.text,
              //           onChanged: (value) {},
              //           onSaved: (value) => _databaseController.sourceURLController.text = value!,
              //           maxLines: 1,
              //         ),
              //         const SizedBox(height: 16.0,),
              //       ],
              //     ),
              //     textConfirm: 'Сохранить',
              //     textCancel: 'Отмена',
              //     onConfirm: () {
              //       _databaseController.updateSource(
              //           sourceId: _databaseController.sourcesList[index].id,
              //           data: {
              //             'title': _databaseController.sourceTitleController.text,
              //             'url': _databaseController.sourceURLController.text,
              //           }
              //       );
              //       Get.back();
              //     }
              // );
            },
          ),);
        }
      ),),
      floatingActionButton: FloatingActionButton(
        child: const Icon(LineIcons.plus),
        tooltip: 'Добавить источник',
        onPressed: () {
          // Get.defaultDialog(
          //     titlePadding: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0.0),
          //     contentPadding: const EdgeInsets.all(24.0),
          //     title: 'Добавление источника',
          //     content: Column(
          //       children: [
          //         FormInputFieldWithIcon(
          //           controller: _databaseController.sourceTitleController,
          //           iconPrefix: LineIcons.heading,
          //           labelText: 'Название источника',
          //           validator: (value) {},
          //           keyboardType: TextInputType.text,
          //           onChanged: (value) {},
          //           onSaved: (value) => _databaseController.sourceTitleController.text = value!,
          //           maxLines: 1,
          //         ),
          //         const SizedBox(height: 16.0,),
          //         FormInputFieldWithIcon(
          //           controller: _databaseController.sourceURLController,
          //           iconPrefix: LineIcons.chrome,
          //           labelText: 'Адрес источника',
          //           validator: (value) {},
          //           keyboardType: TextInputType.text,
          //           onChanged: (value) {},
          //           onSaved: (value) => _databaseController.sourceURLController.text = value!,
          //           maxLines: 1,
          //         ),
          //         const SizedBox(height: 16.0,),
          //       ],
          //     ),
          //     textConfirm: 'Сохранить',
          //     textCancel: 'Отмена',
          //     onConfirm: () {
          //       _databaseController.createSource(
          //           data: {
          //             'title': _databaseController.sourceTitleController.text,
          //             'url': _databaseController.sourceURLController.text,
          //           }
          //       );
          //       Get.back();
          //     }
          // );
        },
      ),
    );
  }
}
