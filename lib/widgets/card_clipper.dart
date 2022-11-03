import 'package:flutter/material.dart';

class CardClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    final double _xScaling = size.width / 360.052;
    final double _yScaling = size.height / 433.025;
    path.lineTo(
        0.011000000000002785 * _xScaling, 45.210999999999956 * _yScaling);
    path.cubicTo(
      0.011000000000002785 * _xScaling,
      45.210999999999956 * _yScaling,
      0.35999999999999943 * _xScaling,
      34.82999999999993 * _yScaling,
      6.023000000000003 * _xScaling,
      28.67199999999997 * _yScaling,
    );
    path.cubicTo(
      11.686000000000007 * _xScaling,
      22.51400000000001 * _yScaling,
      22.663000000000004 * _xScaling,
      20.58099999999996 * _yScaling,
      22.663000000000004 * _xScaling,
      20.58099999999996 * _yScaling,
    );
    path.cubicTo(
      22.663000000000004 * _xScaling,
      20.58099999999996 * _yScaling,
      143.763 * _xScaling,
      3.0299999999999727 * _yScaling,
      143.763 * _xScaling,
      3.0299999999999727 * _yScaling,
    );
    path.cubicTo(
      154.2677025336433 * _xScaling,
      1.3821691870701898 * _yScaling,
      164.86426301641015 * _xScaling,
      0.38560022969579677 * _yScaling,
      175.492 * _xScaling,
      0.04599999999999227 * _yScaling,
    );
    path.cubicTo(
      186.20861303310514 * _xScaling,
      -0.09658956144977537 * _yScaling,
      196.9239989060984 * _xScaling,
      0.41167894885984424 * _yScaling,
      207.57899999999998 * _xScaling,
      1.5679999999999836 * _yScaling,
    );
    path.cubicTo(
      207.57899999999998 * _xScaling,
      1.5679999999999836 * _yScaling,
      260.879 * _xScaling,
      9.408999999999992 * _yScaling,
      260.879 * _xScaling,
      9.408999999999992 * _yScaling,
    );
    path.cubicTo(
      260.879 * _xScaling,
      9.408999999999992 * _yScaling,
      337.511 * _xScaling,
      20.534999999999968 * _yScaling,
      337.511 * _xScaling,
      20.534999999999968 * _yScaling,
    );
    path.cubicTo(
      337.511 * _xScaling,
      20.534999999999968 * _yScaling,
      348.66200000000003 * _xScaling,
      22.212999999999965 * _yScaling,
      354.297 * _xScaling,
      29.001999999999953 * _yScaling,
    );
    path.cubicTo(
      359.932 * _xScaling,
      35.79099999999994 * _yScaling,
      360.052 * _xScaling,
      47.688999999999965 * _yScaling,
      360.052 * _xScaling,
      47.688999999999965 * _yScaling,
    );
    path.cubicTo(
      360.052 * _xScaling,
      47.688999999999965 * _yScaling,
      359.987 * _xScaling,
      127.72899999999993 * _yScaling,
      359.987 * _xScaling,
      127.72899999999993 * _yScaling,
    );
    path.cubicTo(
      359.987 * _xScaling,
      127.72899999999993 * _yScaling,
      359.95300000000003 * _xScaling,
      433.029 * _yScaling,
      359.95300000000003 * _xScaling,
      433.029 * _yScaling,
    );
    path.cubicTo(
      359.95300000000003 * _xScaling,
      433.029 * _yScaling,
      3.552713678800501e-14 * _xScaling,
      433.023 * _yScaling,
      3.552713678800501e-14 * _xScaling,
      433.023 * _yScaling,
    );
    path.cubicTo(
      3.552713678800501e-14 * _xScaling,
      433.023 * _yScaling,
      0.011000000000002785 * _xScaling,
      45.210999999999956 * _yScaling,
      0.011000000000002785 * _xScaling,
      45.210999999999956 * _yScaling,
    );
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
