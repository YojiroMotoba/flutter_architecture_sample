import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterarchitecturesample/model/repository_list_model.dart';

class RepositoryDetailPage extends StatelessWidget {
  static const pageName = '/repositoryDetailPage';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments
        as RepositoryDetailPageArguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(args.listDataDetail.fullName),
      ),
      body: Center(
        child: Image.network(
          args.listDataDetail.avatarUrl,
          width: 60,
          height: 60,
        ),
      ),
    );
  }
}

class RepositoryDetailPageArguments {
  final ListDataDetail listDataDetail;

  RepositoryDetailPageArguments(this.listDataDetail);
}
