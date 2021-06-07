import 'package:encrypt/encrypt.dart' as ENCRYPT;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EncryptService
{

  final iv  = ENCRYPT.IV.fromLength(16);

  final encrypter = ENCRYPT.Encrypter(ENCRYPT.AES(ENCRYPT.Key.fromUtf8('WlFsdCYyJPPmKAVeA9ir+A==')));


  String encrypt( String password ){

    final key = ENCRYPT.Key.fromUtf8('WlFsdCYyJPPmKAVeA9ir+A==');
    final iv  = ENCRYPT.IV.fromLength(16);

    final encrypter = ENCRYPT.Encrypter(ENCRYPT.AES(key));

    final encrypted = encrypter.encrypt(password, iv: iv);

    return encrypted.base64;
  }

  void copyToClipboard( String decryptedPassword, BuildContext context){

    final decrypted = encrypter.decrypt(ENCRYPT.Encrypted.fromBase64(decryptedPassword), iv: iv);
    
    // copy to clipboard
    Clipboard.setData( ClipboardData(text: decrypted) );

    Fluttertoast.showToast(
      msg: 'Copied to your Clipboard',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
      backgroundColor: Color(0xff6C5DD3).withOpacity(0.7),
      textColor: Colors.white,
      fontSize: 17
    );
  }
}