class Constants {
  static String signinJson = """
  {
    "type":"SafeArea",
    "child": {
      "type": "Center",
      "child":{
        "type": "SingleChildScrollView",
        "child":{
          "type": "Padding",
          "padding": "20, 0, 20, 0",
          "child": {
            "type": "Column",
            "crossAxisAlignment": "centre",
            "mainAxisAlignment": "center",
            "mainAxisSize": "max",
            "textBaseline": "alphabetic",
            "textDirection": "ltr",
            "verticalDirection": "down",
            "children":[
              {
                "type": "Row",
                "mainAxisAlignment": "center",
                "crossAxisAlignment": "centre",
                "mainAxisSize": "max",
                "children":[
                  {
                    "type": "AssetImage",
                    "name": "images/app/app_icon.png",
                    "boxFit": "cover",
                    "width" : 70.0,
                    "height" : 70.0
                  }
                ]
              },
              {
                "type": "SizedBox",
                "height": 40.0
              },
              {
                "type": "Container",
                "child": {
                  "type" : "TextFormField",
                  "name": "email",
                  "initialValue": "",
                  "placeholder": "Input ID",
                  "textCaptalization": "words",
                  "textColor": "#878787",
                  "hintTextColor": "#878787"
                }
              },
              {
                "type": "Container",
                "child": {
                  "type" : "TextFormField",
                  "name": "password",
                  "maxLines": 1,
                  "obscureText": "true",
                  "placeholder": "Input Password",
                  "textColor": "#878787",
                  "hintTextColor": "#878787"
                }
              },
              {
                "type": "RaisedButton",
                "color": "primaryColor",
                "padding": "8,8,8,8",
                "textColor": "#FFFFFF",
                "elevation": 8.0,
                "splashColor": "#71544D",
                "borderRadius": 10.0,
                "click_event": "username&Password",
                "child": {
                  "type": "Container",
                  "width": "infinity",
                  "height": 40.0,
                  "alignment": "center",
                  "child" : {
                    "type": "Text",
                    "textAlign": "center",
                    "style": {"fontSize": 18.0},
                    "data": "Sign In"
                  }
                }
              },
              {
                "type": "Row",
                "mainAxisAlignment": "spaceAround",
                "crossAxisAlignment": "centre",
                "mainAxisSize": "max",
                "children":[
                  {
                    "type": "FlatButton",
                    "padding": "8,8,8,8",
                    "textColor": "#757575",
                    "splashColor": "#71544D",
                    "click_event": "forgotPassword",
                    "child" : {
                      "type": "Text",
                      "data": "Forgot your password?"
                    }
                  },
                  {
                    "type": "FlatButton",
                    "padding": "8,8,8,8",
                    "textColor": "##757575",
                    "splashColor": "#71544D",
                    "click_event": "signup",
                    "child" : {
                      "type": "Text",
                      "data": "Register"
                    }
                  }
                ]
              }
            ]
          }
        }
      }
    }
  }
  """;

// Sign In JSON 2
  static String signinJson2 = """
  {
    "type":"SafeArea",
    "child": {
      "type": "Stack",
      "children": [
        {
          "type": "AssetImage",
          "name": "images/app/login_background.jpeg",
          "width": "infinity",
          "boxFit": "cover"
        },
        {
          "type": "Center",
          "child": {
            "type": "SingleChildScrollView",
            "child": {
              "type": "Column",
              "crossAxisAlignment": "start",
              "mainAxisAlignment": "center",
              "mainAxisSize": "max",
              "textBaseline": "alphabetic",
              "textDirection": "ltr",
              "verticalDirection": "down",
              "children":[
                {
                  "type": "Row",
                  "mainAxisAlignment": "spaceAround",
                  "crossAxisAlignment": "centre",
                  "mainAxisSize": "max",
                  "children":[
                    {
                      "type": "AssetImage",
                      "name": "images/app/app_icon.png",
                      "boxFit": "cover",
                      "width" : 70.0,
                      "height" : 70.0
                    },
                    {
                      "type": "Text",
                      "data": "Sign In",
                      "style": {"fontWeight": "bold", "fontSize": 30.0, "color": "#FFFFFF"}
                    }
                  ]
                },
                {
                  "type": "SizedBox",
                  "height": 40.0
                },
                {
                  "type": "Stack",
                  "alignment": "bottomCenter",
                  "children": [
                    {
                      "type": "Card",
                      "color": "transparent",
                      "child": {
                        "type": "Padding",
                        "padding": "20, 10, 20, 20",
                        "child": {
                          "type": "Column",
                          "children": [
                            {
                              "type": "Container",
                              "child": {
                                "type" : "TextFormField",
                                "name": "email",
                                "initialValue": "",
                                "placeholder": "Input ID",
                                "textCaptalization": "words",
                                "textColor": "#878787",
                                "hintTextColor": "#878787",
                                "border":{"borderRadius": 10.0}
                              }
                            },
                            {
                              "type": "Container",
                              "child": {
                                "type" : "TextFormField",
                                "name": "password",
                                "maxLines": 1,
                                "obscureText": "true",
                                "placeholder": "Input Password",
                                "textColor": "#878787",
                                "hintTextColor": "#878787",
                                "border":{"borderRadius": 10.0}
                              }
                            }
                          ]
                        }
                      }
                    },
                    {
                      "type": "Container",
                      "height": 200.0,
                      "child": {
                        "type": "Align",
                        "alignment": "bottomCenter",
                        "child": {
                          "type": "Column",
                          "mainAxisAlignment": "end",
                          "children": [
                            {
                              "type": "RaisedButton",
                              "color": "primaryColor",
                              "padding": "8,8,8,8",
                              "textColor": "#FFFFFF",
                              "elevation": 8.0,
                              "splashColor": "#71544D",
                              "borderRadius": 10.0,
                              "click_event": "username&Password",
                              "child": {
                                "type": "Text",
                                "textAlign": "center",
                                "style": {"fontSize": 18.0},
                                "data": "Sign In"
                              }
                            }
                          ]
                        }
                      }
                    }
                  ]
                },
                {
                  "type": "SizedBox",
                  "height": 40.0
                },
                {
                  "type": "Row",
                  "mainAxisAlignment": "spaceAround",
                  "crossAxisAlignment": "centre",
                  "mainAxisSize": "max",
                  "children":[
                    {
                      "type": "FlatButton",
                      "padding": "8,8,8,8",
                      "textColor": "#FFFFFF",
                      "splashColor": "#71544D",
                      "click_event": "forgotPassword",
                      "child" : {
                        "type": "Text",
                        "data": "Forgot your password?"
                      }
                    },
                    {
                      "type": "FlatButton",
                      "padding": "8,8,8,8",
                      "textColor": "#FFFFFF",
                      "splashColor": "#71544D",
                      "click_event": "signup",
                      "child" : {
                        "type": "Text",
                        "data": "Register"
                      }
                    }
                  ]
                }
              ]
            }
          }
        }
      ]
    }
  }
  """;

  // SIGN IN 3 CONSTANT
  static String signinJson3 = """
  {
    "type": "SingleChildScrollView",
    "child": {
      "type": "Stack",
      "children": [
        {
          "type": "Container",
          "width": "infinity",
          "height": 300.0,
          "child": {
            "type": "AssetImage",
            "name": "images/app/login_background.jpeg",
            "width": "infinity",
            "boxFit": "cover"
          }
        },
        {
          "type": "Column",
          "mainAxisAlignment": "end",
          "children": [
            {
              "type": "Container",
              "height": 230.0
            },
            {
              "type": "CustomPaint",
              "painter": {
                "name": "CurvePainter",
                "color": "#FFFFFF",
                "paths": [
                  {
                    "pathName": "moveTo",
                    "x": 0.0,
                    "y": 70.0
                  },
                  {
                    "pathName": "lineTo",
                    "x": "superWidth",
                    "y": 0.0
                  },
                  {
                    "pathName": "lineTo",
                    "x": "superWidth",
                    "y": "superHeight"
                  },
                  {
                    "pathName": "lineTo",
                    "x": 0.0,
                    "y": "superHeight"
                  },
                  {
                    "pathName": "lineTo",
                    "x": 0.0,
                    "y": 0.0
                  }
                ]
              },
              "child": {
                "type": "Column",
                "mainAxisAlignment": "spaceBetween",
                "children": [
                  {
                    "type": "Container",
                    "width": 80.0,
                    "height": 80.0,
                    "alignment": "center",
                    "decoration": {
                      "name": "BoxDecoration",
                      "borderRadius": 40.0,
                      "color": "#878787"
                    },
                    "child": {
                      "type": "Text",
                      "data": "Surf",
                      "style": {"color": "#FFFFFF"}
                    }
                  },
                  {
                    "type": "Container",
                    "padding": "20, 20, 20, 20",
                    "child": {
                      "type": "Column",
                      "children": [
                        {
                          "type" : "TextFormField",
                          "name": "email",
                          "labelText": "EMAIL",
                          "textCaptalization": "words",
                          "textColor": "#878787",
                          "hintTextColor": "#878787"
                        },
                        {
                          "type" : "TextFormField",
                          "name": "password",
                          "maxLines": 1,
                          "obscureText": "true",
                          "labelText": "PASSWORD",
                          "textColor": "#878787",
                          "hintTextColor": "#878787",
                          "suffixIcon": {
                            "type": "FlatButton", 
                            "click_event": "forgotPassword",
                            "child": {
                              "type": "Text",
                              "data": "Forgot Password",
                              "textAlign": "center",
                              "style": {"Color": "#878787"}
                            }
                          },
                          "suffixConstraints": {"minWidth": 80.0, "minHeight": 40.0}
                        }
                      ]
                    }
                  },
                  {
                    "type": "Container",
                    "width": "infinity",
                    "alignment": "center",
                    "child": {
                      "type": "Column",
                      "children": [
                        {
                          "type": "RaisedButton",
                          "width": "infinity",
                          "superPadding": "20, 0, 20, 0",
                          "color": "primaryColor",
                          "padding": "8,8,8,8",
                          "textColor": "#FFFFFF",
                          "elevation": 8.0,
                          "splashColor": "#71544D",
                          "borderRadius": 10.0,
                          "click_event": "username&Password",
                          "child": {
                            "type": "Text",
                            "textAlign": "center",
                            "style": {"fontSize": 18.0},
                            "data": "Sign In"
                          }
                        },
                        {
                          "type": "FlatButton",
                          "click_event": "signup",
                          "child": {
                            "type": "Text",
                            "data": "DON\'T HAVE AN ACCOUNT? SIGN UP"
                          }
                        }
                      ]
                    }
                  }
                ]
              }
            }
          ]
        }
      ]
    }
  }
  """;

  // SIGN UP CONSTANT
  static String signupJson = """
  {
    "type":"SafeArea",
    "child": {
      "type": "Center",
      "child":{
        "type": "SingleChildScrollView",
        "child":{
          "type": "Padding",
          "padding": "20, 0, 20, 0",
          "child": {
            "type": "Column",
            "crossAxisAlignment": "centre",
            "mainAxisAlignment": "center",
            "mainAxisSize": "max",
            "textBaseline": "alphabetic",
            "textDirection": "ltr",
            "verticalDirection": "down",
            "children":[
              {
                "type": "Row",
                "mainAxisAlignment": "end",
                "crossAxisAlignment": "centre",
                "mainAxisSize": "max",
                "children":[
                  {
                    "type": "AssetImage",
                    "name": "images/app/app_icon.png",
                    "boxFit": "cover",
                    "width" : 70.0,
                    "height" : 70.0
                  }
                ]
              },
              {
                "type": "SizedBox",
                "height": 40.0
              },
              {
                "type": "Container",
                "child": {
                  "type" : "TextFormField",
                  "name": "username",
                  "initialValue": "",
                  "placeholder": "Input ID",
                  "textCaptalization": "words",
                  "textColor": "#878787",
                  "hintTextColor": "#878787",
                  "fillColor": "#0F0F0F",
                  "border":{"borderRadius": 10.0}
                }
              },
              {
                "type": "Container",
                "child": {
                  "type" : "TextFormField",
                  "name": "email",
                  "initialValue": "",
                  "placeholder": "Email",
                  "textCaptalization": "words",
                  "textColor": "#878787",
                  "hintTextColor": "#878787",
                  "fillColor": "#0F0F0F",
                  "keyboardType": "email",
                  "border":{"borderRadius": 10.0}
                }
              },
              {
                "type": "Container",
                "child": {
                  "type" : "TextFormField",
                  "name": "password",
                  "maxLines": 1,
                  "obscureText": "true",
                  "placeholder": "Input Password",
                  "fillColor": "#0F0F0F",
                  "textColor": "#878787",
                  "hintTextColor": "#878787",
                  "border":{"borderRadius": 10.0}
                }
              },
              {
                "type": "Row",
                "mainAxisAlignment": "spaceAround",
                "crossAxisAlignment": "centre",
                "mainAxisSize": "max",
                "children":[
                  {
                    "type": "FlatButton",
                    "padding": "8,8,8,8",
                    "textColor": "#757575",
                    "splashColor": "#71544D",
                    "click_event": "login",
                    "child" : {
                      "type": "Text",
                      "data": "Have an account? Login"
                    }
                  },
                  {
                    "type": "RaisedButton",
                    "color": "primaryColor",
                    "padding": "8,8,8,8",
                    "textColor": "#FFFFFF",
                    "elevation": 8.0,
                    "splashColor": "#71544D",
                    "click_event": "signupDone",
                    "borderRadius": 10.0,
                    "child" : {
                      "type": "Text",
                      "textAlign": "center",
                      "style": {"fontSize": 18.0},
                      "data": "Sign Up"
                    }
                  }
                ]
              }
            ]
          }
        }
      }
    }
  }
  """;

  // Forgot Password JSON
  static String forgotPassword = """
  {
    "type":"SafeArea",
    "child": {
      "type": "Padding",
      "padding": "20, 0, 20, 0",
      "child": {
        "type": "Column",
        "crossAxisAlignment": "centre",
        "mainAxisAlignment": "start",
        "mainAxisSize": "max",
        "textBaseline": "alphabetic",
        "textDirection": "ltr",
        "verticalDirection": "down",
        "children":[
          {
            "type": "Row",
            "mainAxisSize": "max",
            "mainAxisAlignment": "start",
            "children": [
              {
                "type": "FlatButton",
                "splashColor": "#71544D",
                "click_event": "back",
                "minWidth": 35.0,
                "child" : {
                  "type": "Icon",
                  "data": "arrow_back",
                  "color": "#757575",
                  "size": 30.0
                }
              },
              {
                "type": "Container",
                "alignment": "center",
                "padding": "20,8,20,8",
                "child": {
                  "type": "Text",
                  "data": "Forgot Password",
                  "maxLines": 3,
                  "overflow": "ellipsis",
                  "style": {
                    "color": "#7f8082",
                    "fontSize": 30.0,
                    "fontWeight": "bold"
                  }
                }
              }
            ]
          },
          {
            "type": "Expanded",
            "child": {
              "type": "Column",
              "crossAxisAlignment": "center",
              "mainAxisAlignment": "center",
              "mainAxisSize": "max",
              "textBaseline": "alphabetic",
              "textDirection": "ltr",
              "verticalDirection": "down",
              "children":[
                {
                  "type": "Container",
                  "child": {
                    "type" : "TextFormField",
                    "name": "email",
                    "initialValue": "",
                    "placeholder": "Email",
                    "textCaptalization": "words",
                    "textColor": "#878787",
                    "hintTextColor": "#878787",
                    "fillColor": "#0F0F0F",
                    "keyboardType": "email",
                    "border":{"borderRadius": 10.0}
                  }
                },
                {
                  "type": "SizedBox",
                  "height": 40.0
                },
                {
                  "type": "RaisedButton",
                  "color": "primaryColor",
                  "padding": "8,8,8,8",
                  "textColor": "#FFFFFF",
                  "elevation": 8.0,
                  "splashColor": "#71544D",
                  "borderRadius": 10.0,
                  "click_event": "resetPassword",
                  "child": {
                    "type": "Container",
                    "width": "infinity",
                    "height": 40.0,
                    "alignment": "center",
                    "child" : {
                      "type": "Text",
                      "textAlign": "center",
                      "style": {"fontSize": 18.0},
                      "data": "Reset Password"
                    }
                  }
                }
              ]
            }
          }
        ]
      }
    }
  }
  """;

  static String dashboardJson = """
  {
    "type": "Scaffold",
    "appBar": {
      "type": "AppBar",
      "title": {
        "type": "Text",
        "data": "Side Menu"
      }
    },
    "drawer": {
      "type": "Drawer",
      "child": {
        "type": "Column",
        "children": [
          {
            "type": "DrawerHeader",
            "child": {
              "type": "Text",
              "data": "Drawer Header"
            },
            "decoration": {
              "name": "BoxDecoration",
              "color": "#878787"
            }
          },
          {
            "type": "ListTile",
            "leading": {
              "type": "Icon",
              "data": "fa.home"
            },
            "title": {
              "type": "Text",
              "data": "Home"
            },
            "tapEvent": "home"
          },
          {
            "type": "ListTile",
            "leading": {
              "type": "Icon",
              "data": "fa.person_pin_circle"
            },
            "title": {
              "type": "Text",
              "data": "Profile"
            },
            "tapEvent": "profile"
          },
          {
            "type": "ListTile",
            "leading": {
              "type": "Icon",
              "data": "fa.settings_applications"
            },
            "title": {
              "type": "Text",
              "data": "Settings"
            },
            "tapEvent": "settings"
          }
        ]
      }
    },
    "bottomNavigationBar": {
      "type": "BottomNavigationBar",
      "currentIndex": 0,
      "items": [
        {
          "icon": "home",
          "label": "Home"
        },
        {
          "icon": "mail",
          "label": "Messages"
        },
        {
          "icon": "person",
          "label": "Profile"
        }
      ],
      "click_event": "tab"
    },
    "children": [
      {
        "type": "Container",
        "child" : {
          "type": "Center",
          "child": {
            "type": "Text",
            "textAlign": "center",
            "style": {"fontSize": 18.0},
            "data": "Home Screen"
          }
        }
      },
      {
        "type": "Container",
        "child" : {
          "type": "Center",
          "child": {
            "type": "Text",
            "textAlign": "center",
            "style": {"fontSize": 18.0},
            "data": "Messages Screen"
          }
        }
      },
      {
        "type": "Container",
        "child" : {
          "type": "Center",
          "child": {
            "type": "Text",
            "textAlign": "center",
            "style": {"fontSize": 18.0},
            "data": "Profile Screen"
          }
        }
      }
    ],
    "body": {
      "type": "Container",
      "child" : {
        "type": "Center",
        "child": {
          "type": "Text",
          "textAlign": "center",
          "style": {"fontSize": 18.0},
          "data": "Dashboard Screen"
        }
      }
    }
  }
  """;

  static String profileJson = """
  {
    "type": "Scaffold",
    "appBar": {
      "type": "AppBar",
      "title": {
        "type": "Text",
        "data": "Side Menu"
      }
    },
    "body": {
      "type": "SafeArea",
      "child": {
        "type": "Column",
        "crossAxisAlignment": "centre",
        "mainAxisAlignment": "center",
        "mainAxisSize": "max",
        "children": [
          {
            "type": "Text",
            "data": "Profile View",
            "style": {
              "color": "#71544D"
            }
          }
        ]
      }
    }
  }
  """;
}
