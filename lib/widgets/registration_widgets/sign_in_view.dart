import 'package:flutter/material.dart';
import 'package:xiflutter/dynamic_widget/dynamic_widget.dart';
import 'package:xiflutter/models/constants.dart';
import 'package:xiflutter/widgets/registration_widgets/sign_up_view.dart';
import 'package:xiflutter/widgets/registration_widgets/forgot_password_view.dart';

class SignInView extends StatefulWidget {
  final String jsonString;

  SignInView({this.jsonString});

  @override
  _SignInViewState createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  //final Map<String, TextEditingController> controllers = Map();
  final _formKey = GlobalKey<FormState>();

  // @override
  // void dispose() {
  //   for (TextEditingController controller in controllers.values) {
  //     if (controller != null) {
  //       controller.dispose();
  //     }
  //   }
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.black,
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
        widget.jsonString, context, SignInClickListener());
  }
}

class SignInClickListener implements SigninListener {
  final Map<String, TextEditingController> controllers = Map();

  @override
  void onClicked(String event, BuildContext context) {
    print("Receive click event: " + event);
    print("context" + context.toString());
    if (event == "username&Password") {
      print(
          "UserName = ${controllers['email'].text} \n Password = ${controllers["password"].text}");
    } else if (event == "signup") {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  SignUpView(jsonString: Constants.signupJson)));
    } else if (event == "forgotPassword") {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  ForgotPasswordView(jsonString: Constants.forgotPassword)));
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
