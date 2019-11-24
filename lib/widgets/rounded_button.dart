import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;
  final Color textColor;
  final VoidCallback onPressed;

  const RoundedButton({
    this.buttonColor,
    this.buttonText,
    this.textColor,
    @required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: buttonColor,
      borderRadius: BorderRadius.circular(30.0),
      elevation: 5.0,
      child: MaterialButton(
        onPressed: onPressed,
        height: 42.0,
        child: Text(
          buttonText,
          style: Theme.of(context).textTheme.button.copyWith(color: textColor, fontSize: 20.0),
        ),
      ),
    );
  }
}

class RoundedButtonSmall extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;
  final Color textColor;
  final VoidCallback onPressed;

  const RoundedButtonSmall({
    this.buttonColor,
    this.buttonText,
    this.textColor,
    @required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: buttonColor,
      borderRadius: BorderRadius.circular(30.0),
      elevation: 5.0,
      child: MaterialButton(
        onPressed: onPressed,
        height: 35.0,
        child: Text(
          buttonText,
          style: Theme.of(context).textTheme.button.copyWith(color: textColor),
        ),
      ),
    );
  }
}