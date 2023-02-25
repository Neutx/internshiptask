

import 'package:flutter/cupertino.dart';

class CardProvider extends ChangeNotifier{

  List<String> _urlImages = [];
  bool isDragging = false;
  double _angle = 0;
  Offset _position = Offset.zero;
  Size _screenSize = Size.zero;

  List<String> get urlImages => _urlImages;
  Offset get position => _position;
  double get angle => _angle;

  CardProvider( ){
    resetUsers();
  }


  void setScreenSize(Size size)=> _screenSize = size;


  void startPosition(DragStartDetails details){
    isDragging = true;
    notifyListeners();
  }

  void updatePosition(DragUpdateDetails details){
    _position += details.delta;

    final x = _position.dx;
    _angle = 45 * x /_screenSize.width;

    notifyListeners();
  }

  void endPosition(){
    resetPosition();
  }

  void resetPosition(){
    isDragging = false;
    _position = Offset.zero;
    _angle = 0;
    notifyListeners();
  }

  void resetUsers() {
    _urlImages=<String>[
      'https://i.pinimg.com/564x/0f/57/f2/0f57f272647ccdaabf6c6f7b18294edc.jpg',
      'https://i.pinimg.com/564x/49/7a/87/497a879cbf3c741cb68c783e07100c81.jpg',
      'https://i.pinimg.com/564x/55/11/73/5511730ae81cae6ccfea6f70b12a83a5.jpg',
      'https://i.pinimg.com/564x/41/07/17/4107179aa84c85b1daa075249ea79072.jpg',
      'https://i.pinimg.com/564x/5f/f6/45/5ff6457433cdb24e9cb150fe612c66ce.jpg',
      'https://i.pinimg.com/750x/a0/1c/fd/a01cfdefc7403353b7db68890e0f7970.jpg',
      'https://i.pinimg.com/564x/1b/37/a1/1b37a183cff9079b231308b8fb512acb.jpg',
      'https://i.pinimg.com/564x/1a/44/59/1a445998e01b19e106c1f3fc63ad4baa.jpg',
    ].reversed.toList();

    notifyListeners();
  }




}