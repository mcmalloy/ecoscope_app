import 'dart:core' as prefix0;
import 'dart:core';
import 'dart:math';
import 'package:ecoscope_app/animations/animated_wave.dart';
import 'package:flutter/material.dart';
import 'package:ecoscope_app/services/authentication.dart';

class LoginSignupPage extends StatefulWidget{
  LoginSignupPage({this.auth,this.onSignedIn});

  final BaseAuth auth;
  final VoidCallback onSignedIn;
  @override
  State<StatefulWidget> createState() => new _LoginPageState();
}

enum FormMode {LOGIN, SIGNUP, FORGOTPASSWORD}

class _LoginPageState extends State<LoginSignupPage> {
// Create a global key that will uniquely identify the Form widget and allow us to validate the form
  final _formKey = new GlobalKey<FormState>();

  String _email;
  String _password;
  String _errorMessage;

  // Initial form is login form
  FormMode _formMode = FormMode.LOGIN;
  bool _isIos;
  bool _isLoading;
  String passwordText = "Password";

  // Check if form is valid before performing login or signup
  bool _validateAndSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  // Perform login or signup
  void _validateAndSubmit() async {
    setState(() {
      _errorMessage = "";
      _isLoading = true;
    });
      if (_validateAndSave()) {
        String userId = "";
        try {
          if (_formMode == FormMode.LOGIN) {
            userId = await widget.auth.signIn(_email, _password);
            print('Signed in: $userId');
          }
          else if(_formMode == FormMode.FORGOTPASSWORD){
            print("EMAIL IN QUESTION: "+_email);
            try {
              await widget.auth.resetPassword(_email);
            } catch (e) {
              print(e);
            }
          }
          else {
            userId = await widget.auth.signUp(_email, _password);
            widget.auth.sendEmailVerification();
            _showVerifyEmailSentDialog();
            print('Signed up user: $userId');
          }
          setState(() {
            _isLoading = false;
          });

          if (userId != null && userId.length > 0 && _formMode == FormMode.LOGIN) {
            widget.onSignedIn();
          }
        } catch (e) {
          print('Error: $e');
          setState(() {
            _isLoading = false;
            if (_isIos) {
              _errorMessage = e.details;
            } else
              _errorMessage = e.message;
          });
        }
      }
  }
  @override
  void initState() {
    _errorMessage = "";
    _isLoading = false;
    super.initState();
  }

  void _changeFormToSignUp() {
    _formKey.currentState.reset();
    _errorMessage = "";
    passwordText="Password";
    setState(() {
      _formMode = FormMode.SIGNUP;
    });
  }

  void _changeFormToLogin() {
    _formKey.currentState.reset();
    _errorMessage = "";
    passwordText="Password";
    setState(() {
      _formMode = FormMode.LOGIN;
    });
  }

  void _changeFormForgotPassword() {
    _formKey.currentState.reset();
    _errorMessage = "";
    passwordText="New Password";
    setState(() {
      _formMode = FormMode.FORGOTPASSWORD;
    });
  }

  @override
  Widget build(BuildContext context) {
    _isIos = Theme.of(context).platform == TargetPlatform.iOS;
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(''),
        ),
        body: Stack(
          children: <Widget>[
            _showBody(),
            _showCircularProgress(),
            Container(
              child: AnimatedWave(
                color: Color(0xff2bb2bb),
                height: 120,
                speed: 0.7,
              ),
            ),Container(
              child: AnimatedWave(
                color: Color(0xff87d4c5),
                height: 100,
                speed: 1.0,
                offset: pi,
              ),
            ),
        Container(
          child: AnimatedWave(
            color: Color(0xff1dd3bd),
            height: 100,
            speed: 1.4,
            offset: pi / 2,
          ))
          ],
        ));
  }
  Widget _showCircularProgress(){
    if (_isLoading) {
      return Center(child: CircularProgressIndicator());
    } return Container(height: 0.0, width: 0.0,);

  }

  void _showVerifyEmailSentDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Verify your account"),
          content: new Text("Link to verify account has been sent to your email"),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Dismiss"),
              onPressed: () {
                _changeFormToLogin();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
  // TODO: SUPER INDIAN CODE IN _showBody()!! We only want to display email field during password reset
  Widget _showBody(){
    if(_formMode == FormMode.FORGOTPASSWORD){
      return new Container(
          padding: EdgeInsets.all(16.0),
          child: new Form(
            key: _formKey,
            child: new ListView(
              shrinkWrap: true,
              children: <Widget>[
                _showLogo(),
                _showEmailInput(),
                _showPrimaryButton(),
                _showCreateAccountButton(),
                _showErrorMessage(),
                _showForgotPasswordButton()
              ],
            ),
          ));
    }
    else{
      return new Container(
          padding: EdgeInsets.all(16.0),
          child: new Form(
            key: _formKey,
            child: new ListView(
              shrinkWrap: true,
              children: <Widget>[
                _showLogo(),
                _showEmailInput(),
                _showPasswordInput(),
                _showPrimaryButton(),
                _showCreateAccountButton(),
                _showErrorMessage(),
                _showForgotPasswordButton()
              ],
            ),
          ));
    }

  }

  Widget _showErrorMessage() {
    if (_errorMessage != null && _errorMessage.length > 0) {
      return new Text(
        _errorMessage,
        style: TextStyle(
            fontSize: 16.0,
            color: Colors.red,
            height: 1.0,
            fontWeight: FontWeight.w300),
      );
    } else {
      return new Container(
        height: 0.0,
      );
    }
  }

  Widget _showLogo() {
    return Image(
        image: AssetImage('assets/EcoScopeLogoPlaceholder.png'),
      height: 180,
      );
  }

  Widget _showEmailInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: new InputDecoration(
            hintText: 'Email',
            icon: new Icon(
              Icons.mail,
              color: Colors.grey,
            )),
        validator: (value) {
          if (value.isEmpty) {
            setState(() {
              _isLoading = false;
            });
            return 'Email can\'t be empty';
          }
        },
        onSaved: (value) => _email = value,
      ),
    );
  }

  Widget _showPasswordInput() {
      return Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
        child:
        new TextFormField(
          maxLines: 1,
          obscureText: true,
          autofocus: false,
          decoration: new InputDecoration(
              hintText: passwordText,
              icon: new Icon(
                Icons.lock,
                color: Colors.grey,
              )),
          validator: (value) {
            if (value.isEmpty) {
              setState(() {
                _isLoading = false;
              });
              return 'Email can\'t be empty';
            }
          },
          onSaved: (value) => _password = value,
        ),
      );
  }
  Widget _showPrimaryButton() {
    return new Padding(
        padding: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
        child: SizedBox(
          height: 40.0,
          child: new RaisedButton(
            elevation: 5.0,
            shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
            color: Colors.lightGreen,
            child:
              new Text(_determineButton(), style: new TextStyle(fontSize: 20.0, color: Colors.white)),
            onPressed: _validateAndSubmit,
          )
          ),
        );
  }

  String _determineButton(){   // This String method determines what the textfield inside the Primary button should be.
    String buttonText="";
    if(_formMode == FormMode.LOGIN){
      buttonText = "Login";
      return buttonText;
    }
    else if(_formMode == FormMode.SIGNUP){
     buttonText = "Create Account";
     return buttonText;
    }
    else if(_formMode == FormMode.FORGOTPASSWORD){
      buttonText = "Reset Password";
      return buttonText;
    }
  }

  Widget _showCreateAccountButton() {
    return new FlatButton(
      padding: EdgeInsets.fromLTRB(0, 50, 0, 20),
      child: _formMode == FormMode.LOGIN
          ? new Text('Create an account',
          style: new TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300))
          : new Text('Have an account? Sign in',
          style:
          new TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300)),
      onPressed: _formMode == FormMode.LOGIN
          ? _changeFormToSignUp
          : _changeFormToLogin,
    );
  }

  Widget _showForgotPasswordButton() {
    return new FlatButton(
      child: _formMode == FormMode.LOGIN // Shows the Forgot your password? Button both if you are in create account or login mode
          ? new Text('Forgot your password?',
          style: new TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300))
          : new Text('Forgot your password?',
          style:
          new TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300)),
      onPressed: _changeFormForgotPassword
    );
  }

}