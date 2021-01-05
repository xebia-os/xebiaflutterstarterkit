import 'package:flutter/material.dart';
import 'package:xiflutter/dynamic_widget/dynamic_widget.dart';

class ForgotPasswordView extends StatefulWidget {
  final String jsonString;

  ForgotPasswordView({this.jsonString});

  @override
  _ForgotPasswordViewState createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder<Widget>(
        future: _buildWidget(context),
        builder: (BuildContext ctx, AsyncSnapshot<Widget> snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
          }
          return snapshot.hasData
              ? SizedBox.expand(
                  child: snapshot.data,
                )
              : Text("Loading...");
        },
      ),
    );
  }

  Future<Widget> _buildWidget(BuildContext context) async {
    return DynamicWidgetBuilder.build(
        widget.jsonString, context, ForgotPasswordClickListener());
  }
}

class ForgotPasswordClickListener implements SigninListener {
  final Map<String, TextEditingController> controllers = Map();

  @override
  void onClicked(String event, BuildContext context) {
    print("Receive click event: " + event);
    print("controller : " + context.toString());
    if (event == "resetPassword") {
      Navigator.pop(context);
    } else if (event == "back") {
      Navigator.pop(context);
    }
  }

  @override
  void addController(TextEditingController controller, String name) {
    // TODO: implement addController
    if (!controllers.containsKey(name)) {
      controllers[name] = controller;
    }
  }
}
