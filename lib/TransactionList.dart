import 'package:first_app/Transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
//import 'package:intl/intl.dart';

class transactionList extends StatelessWidget {
  final List<Transaction> transacTion;
  final Function deleteT;

  transactionList(this.transacTion, this.deleteT);

  @override
  Widget build(BuildContext context) {
    return transacTion.isEmpty
        ? LayoutBuilder(builder: (ctx, constraint) {
            return Column(
              children: [
                Text('No transactions added not yet :(',
                    style: TextStyle(
                      color: Colors.purple,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans',
                      fontSize: 35.2,
                    )),
                SizedBox(
                  height: 13,
                ),
                Container(
                    height: constraint.maxHeight * 0.6,
                    child: Image.asset(
                      'images/justin-lee-tomie03.jpg',
                      fit: BoxFit.cover,
                    ))
              ],
            );
          })
        : ListView.builder(
            itemBuilder: (dan, index) {
              return Card(
                elevation: 5,
                margin: EdgeInsets.symmetric(vertical: 9.2, horizontal: 7.3),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 50,
                    child: Padding(
                      padding: EdgeInsets.all(6),
                      child: FittedBox(
                        child: Text(
                          '\$${transacTion[index].total}',
                          style: TextStyle(
                            color: Colors.redAccent,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  title: Text(
                    transacTion[index].tilte,
                    style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontSize: 23.4),
                  ),
                  subtitle: Text(
                    DateFormat.yMMMMEEEEd().format(
                      transacTion[index].date,
                    ),
                    style: TextStyle(
                        color: Colors.purple,
                        fontWeight: FontWeight.bold,
                        fontSize: 22.4),
                  ),
                  trailing: MediaQuery.of(context).size.width > 460
                      ? TextButton.icon(
                          onPressed: () => deleteT(transacTion[index].id),
                          icon: Icon(Icons.delete,color: Colors.blue,),
                          label: Text('Delete'),
                  )
                      : IconButton(
                          icon: Icon(Icons.delete),
                          color: Colors.blue,
                          focusColor: Colors.red,
                          onPressed: () => deleteT(transacTion[index].id),
                        ),
                ),
              );
            },
            itemCount: transacTion.length,
          );
  }
}
