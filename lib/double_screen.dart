import 'package:counter/bloc/DoubleBloc.dart';
import 'package:flutter/material.dart';


class DoubleScreen extends StatefulWidget {
  DoubleScreen({Key key}) : super(key: key);

  @override
  _DoubleScreenState createState() => _DoubleScreenState();
}

class _DoubleScreenState extends State<DoubleScreen> {
  DoubleBloc _bloc = DoubleBloc();

  @override
  void initState() {
    super.initState();
    _bloc.sendEvent.add(FetchEvent());
  }

  void dispose() {
    _bloc.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Que pedos!!"),

      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Now counter is:',
            ),
            StreamBuilder<int>(
                stream: _bloc.counterStream,
                builder: (context, snapshot) {
                  return Text(
                    '${snapshot.data}',
                    style: Theme.of(context).textTheme.headline4,
                  );
                }),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "Bot1",
            onPressed: () {
              _bloc.sendEvent.add(DoubleEvent());
            },
            tooltip: 'Double',
            child: Icon(Icons.trending_up),
          ),
          SizedBox(
            height: 10.0,
          ),
          FloatingActionButton(
            heroTag: "but2",
            onPressed: () {
              _bloc.sendEvent.add(ClearEvent());
            },
            tooltip: "Borrar",
            child: Icon(Icons.clear_all),
          )
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
