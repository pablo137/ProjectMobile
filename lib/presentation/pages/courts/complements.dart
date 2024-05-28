
import 'package:flutter/material.dart';

class ColorFilters{
  static const ColorFilter greyscale = ColorFilter.matrix(<double>[
    0.8, 0, 0, 0, 0,   
    0, 0.8, 0, 0, 0,   
    0, 0, 0.8, 0, 0,   
    0, 0, 0, 1, 0,   
  ]);
}
