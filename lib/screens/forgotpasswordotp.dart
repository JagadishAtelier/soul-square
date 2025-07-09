import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: OTPPage()));
}

class OTPPage extends StatefulWidget {
  @override
  State<OTPPage> createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF1D2671), Color(0xFFC33764)],
          ),
        ),

        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                ),

                Center(
                  child: Text(
                    "Enter the code",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),

                const SizedBox(height: 20),
                const Text(
                  "We have sent an OTP on +91 00000 00000",
                  style: TextStyle(color: Colors.white70),
                ),
                const SizedBox(height: 30),

               Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                   SizedBox(
                  height: 48,
                  width: 48,
                  child: TextFormField(
                    onSaved: (pin1) {},
                    onChanged: (value) {
                      if(value.length ==1){
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    keyboardType: TextInputType.number,
                    maxLines: 1,
                    cursorColor: Colors.pinkAccent,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.pinkAccent),
                      ),
                      enabledBorder: OutlineInputBorder(),
                    ),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
                SizedBox(
                  height: 48,
                  width: 48,
                  child: TextFormField(
                    onSaved: (pin1) {}
                    ,
                    onChanged: (value) {
                      if(value.length ==1){
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    keyboardType: TextInputType.number,
                    maxLines: 1,
                    cursorColor: Colors.pinkAccent,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.pinkAccent),
                      ),
                      enabledBorder: OutlineInputBorder(),
                    ),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),

                SizedBox(
                  height: 48,
                  width: 48,
                  child: TextFormField(
                    onSaved: (pin1) {},
                    onChanged: (value) {
                      if(value.length ==1){
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    keyboardType: TextInputType.number,
                    maxLines: 1,
                    cursorColor: Colors.pinkAccent,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.pinkAccent),
                      ),
                      enabledBorder: OutlineInputBorder(),
                    ),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),

                SizedBox(
                  height: 48,
                  width: 48,
                  child: TextFormField(
                    onSaved: (pin1) {},
                    onChanged: (value) {
                      if(value.length ==1){
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    keyboardType: TextInputType.number,
                    maxLines: 1,
                    cursorColor: Colors.pinkAccent,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Colors.pinkAccent),
                      ),
                      enabledBorder: OutlineInputBorder(),
                    ),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),

                ],
               ),

                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  height: 46,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    onPressed: () {},
                    child: Ink(
                      decoration:  BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFF97216F), Color(0xFFB2156A)],
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                      ),
                      child:  Center(
                        child: Text(
                          'Verify the code',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
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
}
