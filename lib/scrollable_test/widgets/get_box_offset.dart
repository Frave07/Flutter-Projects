import 'package:flutter/material.dart';


class GetBoxOffset extends StatefulWidget {

  final Widget child;
  final Function(Offset offset) offset;

  const GetBoxOffset({Key? key, required this.offset, required this.child}) : super(key: key);

  @override
  State<GetBoxOffset> createState() => _GetBoxOffsetState();
}

class _GetBoxOffsetState extends State<GetBoxOffset> {

  GlobalKey widgetKey = GlobalKey();

  late Offset offset;

  @override
  void initState() {
    
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      
      final box = widgetKey.currentContext?.findRenderObject() as RenderBox;
      offset = box.localToGlobal(Offset.zero);
      widget.offset(offset);

    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      key: widgetKey,
      child: widget.child
    );
  }
}