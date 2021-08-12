import 'package:caixinha_boas_novas/dao/good_news_dao.dart';
import 'package:caixinha_boas_novas/models/good_news.dart';
import 'package:flutter/material.dart';

class GoodNewsForm extends StatefulWidget {
  @override
  _GoodNewsFormState createState() => _GoodNewsFormState();
}

class _GoodNewsFormState extends State<GoodNewsForm> {
  final TextEditingController _descriptionController = TextEditingController();

  final GoodNewsDao _dao = GoodNewsDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New contact'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                labelText: 'Full name',
              ),
              style: TextStyle(
                fontSize: 24.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: SizedBox(
                width: double.maxFinite,
                child: RaisedButton(
                  child: Text('Create'),
                  onPressed: () {
                    final String description = _descriptionController.text;
                    final GoodNews newContact = GoodNews(0, description);
                    _dao.save(newContact).then((id) => Navigator.pop(context));
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}