import 'dart:async';

import 'package:finance_kline_core/finance_kline_core.dart';
import 'package:market_interface/market_interface.dart';

abstract class Market {
  FutureOr<List<String>> getInstruments({required InstrumentType type});

  FutureOr<OhlcvSeries> getKlineHistory({
    required String instrument,
    required Interval interval,
    required int limit,
  });

  Set<Interval> getSupportedIntervals();
}
