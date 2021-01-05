import 'package:flutter/material.dart';
import 'package:xiflutter/dynamic_widget/utils.dart';

class CurvePainter extends CustomPainter {
  BuildContext context;
  String color;
  String style;
  List<dynamic> paths;

  CurvePainter(
      {@required this.context, this.color, this.style = 'fill', this.paths});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = setThemeColor(context, color);
    paint.style = style == null ? PaintingStyle.fill : getPaintingStyle(style);

    final path = iteratePath(size);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }

  getPaintingStyle(String fillStyle) {
    if (fillStyle == 'fill') {
      return PaintingStyle.fill;
    } else {
      return PaintingStyle.stroke;
    }
  }

  double getParsedSize(
      Map<String, dynamic> dictPath, String dictKey, Size size) {
    if (dictPath.containsKey(dictKey)) {
      if (dictPath[dictKey] == 'superWidth') {
        return size.width;
      } else if (dictPath[dictKey] == 'superHeight') {
        return size.height;
      } else {
        return dictPath[dictKey];
      }
    } else {
      return 0.0;
    }
  }

  Path iteratePath(Size size) {
    var path = Path();
    paths.map((dictPath) {
      String pathName =
          dictPath.containsKey('pathName') ? dictPath['pathName'] : null;
      switch (pathName) {
        case 'moveTo':
          double x = getParsedSize(dictPath, 'x', size);
          double y = getParsedSize(dictPath, 'y', size);
          path.moveTo(x, y);
          break;
        case 'lineTo':
          double x = getParsedSize(dictPath, 'x', size);
          double y = getParsedSize(dictPath, 'y', size);
          path.lineTo(x, y);
          break;
        case 'quadraticBezierTo':
          double x1 = getParsedSize(dictPath, 'x1', size);
          double y1 = getParsedSize(dictPath, 'y1', size);
          double x2 = getParsedSize(dictPath, 'x2', size);
          double y2 = getParsedSize(dictPath, 'y2', size);
          path.quadraticBezierTo(x1, y1, x2, y2);
          break;
        default:
          break;
      }
    }).toList();

    return path;
  }
}
