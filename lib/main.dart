// ignore_for_file: deprecated_member_use, prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
// import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'SI Calc',
    home: SIForm(),
  ));
}

// ignore: use_key_in_widget_constructors
class SIForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SIFormState();
  }
}

class _SIFormState extends State<SIForm> {
  var currencies = ['Rupees', 'Dollars', 'Pounds'];
  var currency = '';
  var displayResult = '';
  var formkey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    currency = currencies[0];
  }

  TextEditingController pamt = TextEditingController();
  TextEditingController int = TextEditingController();
  TextEditingController term = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextStyle? textStyle = Theme.of(context).textTheme.subtitle2;
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Container(
            // padding: EdgeInsets.all(10.0),
            height: 30.0,
            width: 250.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                color: Colors.white,
                width: 1.2,
              ),
            ),
            child: Center(
              child: const Text(
                'Simple Interest Calculator',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ),
        backgroundColor: Colors.blueAccent.shade700,
      ),
      body: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: Form(
          key: formkey,
          child: Padding(
            padding: const EdgeInsets.all(1.0),
            child: ListView(
              children: <Widget>[
                const SizedBox(
                  height: 12.0,
                ),
                Center(
                  child: Container(
                    child: Text(
                      '@GitHub/yashraj56',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 55.0,
                ),
                const Center(
                  child: Image(
                    image: AssetImage("assets/img1.png"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 0.0),
                  child: TextFormField(
                    controller: pamt,
                    keyboardType: TextInputType.number,
                    style: textStyle,
                    decoration: InputDecoration(
                        labelStyle: textStyle,
                        labelText: 'Principal Amount',
                        hintText: 'Ex: Enter principal amount:Rs 12000',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
                  child: TextFormField(
                    controller: int,
                    style: textStyle,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: 'Rate Of Interest',
                        hintText: 'Ex: In Percent: 5.27',
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0))),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: TextFormField(
                            controller: term,
                            style: textStyle,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                labelText: 'Term',
                                labelStyle: textStyle,
                                hintText: 'Ex: Time in years',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50.0))),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25.0,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(50.0, 0.0, 20.0, 5.0),
                          child: ButtonTheme(
                            minWidth: 130,
                            height: 50,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: RaisedButton(
                                elevation: 5.0,
                                color: Colors.blueAccent.shade700,
                                child: Text(
                                  'Calculate',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                textColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                onPressed: () {
                                  setState(() {
                                    if (formkey.currentState!.validate()) {
                                      // ignore: unnecessary_this
                                      this.displayResult = _calculatetotal();
                                    }
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                        // Container(
                        //   width: 3.0 * 5,
                        // ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 5.0),
                          child: ButtonTheme(
                            minWidth: 130,
                            height: 50,
                            child: RaisedButton(
                              child: Text(
                                'Reset',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              textColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              color: Colors.blueAccent.shade700,
                              elevation: 5.0,
                              onPressed: () {
                                setState(() {
                                  _reset();
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20.0, 10.0, 10.0, 0.0),
                    child: Text(
                      // ignore: unnecessary_this
                      this.displayResult + '.',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onDropDownItemSelected(String newvalue) {
    setState(() {
      // ignore: unnecessary_this
      this.currency = newvalue;
    });
  }

  String _calculatetotal() {
    double principal = double.parse(pamt.text);
    double interest = double.parse(int.text);
    double years = double.parse(term.text);
    double total = principal + (principal * interest * years) / 100;

    String res =
        "After $years years, your investment will be worth $total $currency";
    return res;
  }

  void _reset() {
    pamt.text = '';
    int.text = '';
    term.text = '';
    displayResult = '';
    currency = currencies[0];
  }
}
