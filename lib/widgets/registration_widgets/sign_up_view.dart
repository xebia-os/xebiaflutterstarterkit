import 'package:flutter/material.dart';
import 'package:xiflutter/dynamic_widget/dynamic_widget.dart';

class SignUpView extends StatefulWidget {
  final String jsonString;

  SignUpView({this.jsonString});

  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
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
        widget.jsonString, context, SignUpClickListener());
  }
}

class SignUpClickListener implements SigninListener {
  final Map<String, TextEditingController> controllers = Map();

  @override
  void onClicked(String event, BuildContext context) {
    print("Receive click event: " + event);
    print("controller : " + context.toString());
    if (event == "signupDone") {
      print(
          "UserName = ${controllers['username'].text} \n ${controllers['email'].text} \n Password = ${controllers["password"].text}");
    } else if (event == "login") {
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
