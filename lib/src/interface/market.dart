import 'dart:async';

import 'package:market_interface/src/type/instrument_type.dart';

abstract class Market {
  FutureOr<List<String>> getInstruments({required InstrumentType type});

  
}
