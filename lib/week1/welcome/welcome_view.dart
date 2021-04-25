import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WelcomeView extends StatelessWidget {
  final appBarTitle = 'Cefri is learning Flutter';
  final _randomImageUrl = 'https://picsum.photos/200/300';

  MaterialColor get randomColor => Colors.primaries[Random().nextInt(17)];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(context),
        body: Column(
          children: [
            Expanded(flex: 5, child: buildListViewTop(context)),
            Expanded(
              flex: 5,
              child: buildListView(),
            ),
            Expanded(flex: 1, child: buildDismissible())
          ],
        ));
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
        centerTitle: false,
        actions: [
          buildIconButton(context)
        ],
        title: buildRowTitle(context),
      );
  }

  IconButton buildIconButton(BuildContext context) {
    return IconButton(
              icon: Icon(Icons.favorite),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => Column(),
                );
              });
  }

  Row buildRowTitle(BuildContext context) {
    return Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(Icons.wallpaper),
            buildTextApp(context)
          ],
        );
  }

  Text buildTextApp(BuildContext context) {
    return Text(appBarTitle,
              style: Theme.of(context)
                  .primaryTextTheme
                  .headline5
                  .copyWith(color: Colors.black));
  }

  ListView buildListViewTop(BuildContext context) {
    return ListView(
      children: [
        Container(
            width: 500,
            height: MediaQuery.of(context).size.height * 0.1,
            color: randomColor),
        Container(
            width: 500,
            height: MediaQuery.of(context).size.height * 0.1,
            color: randomColor),
        Container(
            width: 500,
            height: MediaQuery.of(context).size.height * 0.1,
            color: randomColor),
      ],
    );
  }

  ListView buildListView() {
    return ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return buildListViewCard(index);
        });
  }

  Card buildListViewCard(int index) {
    return Card(
      child: ListTile(
        //leading: CImage.network(_randomImageUrl),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(_randomImageUrl),
        ),
        title: Text('cef $index'),
        trailing: Icon(Icons.settings),
      ),
    );
  }

  Dismissible buildDismissible() {
    return Dismissible(
        key: UniqueKey(),
        background: Container(color: Colors.red),
        secondaryBackground: Container(
          color: Colors.blue,
        ),
        child: Container(
          color: randomColor,
        ));
  }
}
