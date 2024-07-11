import 'package:flutter/material.dart';
import 'package:mirror_wall/Provider/bookmark_provider.dart';
import 'package:provider/provider.dart';

import '../../utils/globaldata.dart';

class Bookcomponents extends StatefulWidget {
  const Bookcomponents({super.key});

  @override
  State<Bookcomponents> createState() => _BookcomponentsState();
}

class _BookcomponentsState extends State<Bookcomponents> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("BookMark"),
          actions: [
            IconButton(
                onPressed: () {
                  Provider.of<Deleteprovider>(context, listen: false)
                      .deleteAll();
                },
                icon: Icon(Icons.delete))
          ],
        ),
        body: Container(
          child: Consumer<Deleteprovider>(
            builder: (context, delete, _) {
              return ListView.builder(
                  itemCount: Book.urldata.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      child: ListTile(
                        title: Text(Book.urldata[index]),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            delete.delete(index);
                          },
                        ),
                      ),
                    );
                  });
            },
          ),
        )
        // Column(
        //   children: [
        //     ...Book.urldata.map((e) => Row(
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           children: [
        //             Card(
        //               elevation: 2,
        //               child: Container(
        //                   margin: EdgeInsets.only(left: 13),
        //                   height: 70,
        //                   width: 320,
        //                   child: Center(
        //                       child: Row(
        //                           mainAxisAlignment:
        //                               MainAxisAlignment.spaceBetween,
        //                           children: [
        //                         Text(e),
        //                         IconButton(
        //                             onPressed: () {
        //                               int index = Book.urldata.indexOf(e);
        //                               Provider.of<Deleteprovider>(context,
        //                                       listen: false)
        //                                   .delete(index);
        //                             },
        //                             icon: Icon(Icons.delete))
        //                       ]))),
        //             ),
        //           ],
        //         )),
        //   ],
        // )
        );
  }
}
