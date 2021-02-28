import 'package:flutter/material.dart';

class WatchlistManip extends StatefulWidget {
  final Function a;
  final Function b;

  WatchlistManip(this.a, this.b);

  @override
  _WatchlistManipState createState() => _WatchlistManipState(a, b);
}

class _WatchlistManipState extends State<WatchlistManip> {
  TextEditingController _c;
  Function add;
  Function remove;

  _WatchlistManipState(this.add, this.remove);

  @override
  initState() {
    _c = new TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'Watchlist\n',
      ),
      trailing: IconButton(
          icon: Icon(Icons.add),
          onPressed: () => {
                showDialog(
                    context: context,
                    child: Dialog(
                      child: Column(children: [
                        TextField(
                          decoration: InputDecoration(hintText: "Add to list"),
                          controller: _c,
                        ),
                        FlatButton(
                          onPressed: () {
                            add(_c.text);
                            Navigator.pop(context);
                          },
                          child: Text('Confirm Add'),
                        ),
                      ]),
                    ))
              }),
    );
  }
}
