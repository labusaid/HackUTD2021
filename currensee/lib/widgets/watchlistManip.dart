import 'package:flutter/material.dart';
import 'package:currensee/widgets/watchlist.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:auto_size_text/auto_size_text.dart';

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
    var aWL = Provider.of<WatchDict>(context, listen: false);
    var len = aWL.dict.length;
    return ListTile(
      title: Text(
        'Watchlist',
        style: GoogleFonts.lato(),
      ),
      subtitle: AutoSizeText(
        '$len Items',
        style: GoogleFonts.lato(),
        maxLines: 1,
      ),
      // trailing: IconButton(
      //     icon: Icon(Icons.add),
      //     onPressed: () => {
      //           showDialog(
      //               context: context,
      //               child: Dialog(
      //                 child: Column(children: [
      //                   TextField(
      //                     decoration: InputDecoration(hintText: "Add to list"),
      //                     controller: _c,
      //                   ),
      //                   FlatButton(
      //                     onPressed: () {
      //                       add(_c.text);
      //                       Navigator.pop(context);
      //                     },
      //                     child: Text('Confirm Add'),
      //                   ),
      //                 ]),
      //               ))
      //         }),
    );
  }
}
