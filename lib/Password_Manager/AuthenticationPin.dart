import 'package:flutter/material.dart';
import 'package:flutter_projects/Password_Manager/Widgets/ButtonPin.dart';
import 'package:google_fonts/google_fonts.dart';


class AuthenticationPinPage extends StatefulWidget
{
  @override
  _AuthenticationPinPageState createState() => _AuthenticationPinPageState();
}

class _AuthenticationPinPageState extends State<AuthenticationPinPage> {


  TextEditingController _textEditingController = TextEditingController();



 @override
 Widget build(BuildContext context)
 {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Container(),
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () => Navigator.pop(context)
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Column(
          children: [
            SizedBox(height: 20.0),
            Text('Enter PIN', style: GoogleFonts.getFont('Inter', fontSize: 22, color: Color(0xff6C5DD3), fontWeight: FontWeight.w500)),
            SizedBox(height: 20.0),
            TextField(
              readOnly: true,
              textAlign: TextAlign.center,
              controller: _textEditingController,
              style: GoogleFonts.getFont('Inter', fontSize: 25, letterSpacing: 8),
              decoration: InputDecoration(
                border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey[200]!)),
                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey[200]!)),
                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey[200]!)),
              ),
            ),

            SizedBox(height: 30.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonPin(text: '1', onPressed: () => _textEditingController.text += '1'),
                ButtonPin(text: '2', onPressed: () => _textEditingController.text += '2'),
                ButtonPin(text: '3', onPressed: () => _textEditingController.text += '3'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonPin(text: '4', onPressed: () => _textEditingController.text += '4'),
                ButtonPin(text: '5', onPressed: () => _textEditingController.text += '5'),
                ButtonPin(text: '6', onPressed: () => _textEditingController.text += '6'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonPin(text: '7', onPressed: () => _textEditingController.text += '7'),
                ButtonPin(text: '8', onPressed: () => _textEditingController.text += '8'),
                ButtonPin(text: '9', onPressed: () => _textEditingController.text += '9'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ButtonPin(text: '', isColor: false, onPressed: (){}),
                ButtonPin(text: '0', onPressed: () => _textEditingController.text += '0'),
                ButtonPin(text: '' ,isClear: true, isColor: false, onPressed: () => _textEditingController.clear() ),
              ],
            ),

            SizedBox(height: 20.0),
            TextButton(
              child: Text('Enter Fingerprint', style: GoogleFonts.getFont('Inter', fontSize: 18, color: Color(0xff323A82))),
              onPressed: () => Navigator.pop(context),
            )
          ],
        ),
      ),
     );
  }
}