import 'package:flutter/material.dart';

extension IntToSizedBox on double {
  Widget get hSpace => SizedBox(height: toDouble());
  Widget get wSpace => SizedBox(width: toDouble());
}
