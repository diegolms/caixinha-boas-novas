import 'package:caixinha_boas_novas/dao/good_news_dao.dart';
import 'package:caixinha_boas_novas/models/good_news.dart';
import 'package:caixinha_boas_novas/screens/good_news_form.dart';
import 'package:flutter/material.dart';

class GoodNewsList extends StatefulWidget {
  @override
  _GoodNewsListState createState() => _GoodNewsListState();
}

class _GoodNewsListState extends State<GoodNewsList> {
  final GoodNewsDao _dao = GoodNewsDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
      ),
      body: FutureBuilder<List<GoodNews>>(
        initialData: [],
        future: _dao.findAll(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Text('Loading')
                  ],
                ),
              );
              break;
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              final List<GoodNews>? goodNews = snapshot.data;
              return ListView.builder(
                itemBuilder: (context, index) {
                  final GoodNews contact = goodNews![index];
                  return _GoodNewsItem(contact);
                },
                itemCount: goodNews!.length,
              );
              break;
          }
          return Text('Unknown error');
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(
            MaterialPageRoute(
              builder: (context) => GoodNewsForm(),
            ),
          )
              .then(
                (value) => setState(() {}),
          );
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}

class _GoodNewsItem extends StatelessWidget {
  final GoodNews goodNew;

  _GoodNewsItem(this.goodNew);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          goodNew.description,
          style: TextStyle(
            fontSize: 24.0,
          ),
        ),
      ),
    );
  }
}
