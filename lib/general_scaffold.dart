import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class GeneralScaffold extends StatefulWidget {
  final String title;
  final Widget child;
  final GlobalKey<ScaffoldState> scaffoldKey;

  GeneralScaffold({
    @required this.title,
    @required this.child,
    @required this.scaffoldKey,
  });

  @override
  _GeneralScaffoldState createState() => _GeneralScaffoldState();
}

class _GeneralScaffoldState extends State<GeneralScaffold> {
  bool _connectionStatus = false;
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<ConnectivityResult> subscription;

  @override
  void initState() {
    super.initState();
    initConnectivity();
    subscription =
        Connectivity().onConnectivityChanged.listen(_updateConnectionStatus);
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initConnectivity() async {
    ConnectivityResult result = ConnectivityResult.none;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print(e.toString());
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    switch (result) {
      case ConnectivityResult.wifi:
      case ConnectivityResult.mobile:
        setState(() => _connectionStatus = true);
        break;
      case ConnectivityResult.none:
        setState(() => _connectionStatus = false);
        break;
      default:
        setState(() => _connectionStatus = false);
        break;
    }
  }

  @override
  void dispose() {
    super.dispose();
    subscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: widget.scaffoldKey,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: [
          Visibility(
            visible: !_connectionStatus,
            child: Align(
              alignment: Alignment.topCenter,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 1000),
                padding: EdgeInsets.symmetric(vertical: 10.0),
                height: !_connectionStatus ? 35 : 0,
                width: double.infinity,
                color: !_connectionStatus ? Colors.red : Colors.green,
                alignment: Alignment.center,
                child: Text(
                  !_connectionStatus
                      ? "No Internet Connectivity"
                      : "Internet is available",
                  style: Theme.of(context).textTheme.subtitle2.copyWith(
                        color: Colors.white,
                      ),
                ),
              ),
            ),
          ),
          widget.child,
        ],
      ),
    );
  }
}
