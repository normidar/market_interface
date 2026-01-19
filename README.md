# market_interface

[![GitHub](https://img.shields.io/github/license/normidar/market_interface.svg)](https://github.com/normidar/market_interface/blob/main/LICENSE)
[![pub package](https://img.shields.io/pub/v/market_interface.svg)](https://pub.dartlang.org/packages/market_interface)
[![GitHub Stars](https://img.shields.io/github/stars/normidar/market_interface.svg)](https://github.com/normidar/market_interface/stargazers)
[![Twitter](https://img.shields.io/twitter/url/https/twitter.com/normidar.svg?style=social&label=Follow%20%40normidar)](https://twitter.com/normidar)
[![Github-sponsors](https://img.shields.io/badge/sponsor-30363D?logo=GitHub-Sponsors&logoColor=#EA4AAA)](https://github.com/sponsors/normidar)

A Dart interface library for market data providers, part of the Coin Galaxy ecosystem. This package provides a standardized interface for fetching financial market data including instruments and OHLCV (Open, High, Low, Close, Volume) candlestick data.

## Features

- 📊 **Standardized Market Interface**: Abstract interface for implementing various market data providers
- 🔄 **Multiple Instrument Types**: Support for spot, perpetual, futures, margin, and options markets
- ⏱️ **Flexible Time Intervals**: 18 predefined intervals from 1 second to 1 month
- 📈 **OHLCV Data**: Retrieve candlestick/kline historical data
- 🎯 **Type-Safe**: Strongly typed enums for instrument types and intervals

## Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  market_interface: ^0.0.1
```

Then run:

```bash
dart pub get
```

## Usage

### Implementing the Market Interface

To create a market data provider, implement the `Market` abstract class:

```dart
import 'package:market_interface/market_interface.dart';
import 'package:finance_kline_core/finance_kline_core.dart';

class MyMarketProvider implements Market {
  @override
  Future<List<String>> getInstruments({required InstrumentType type}) async {
    // Implement logic to fetch available instruments for the given type
    // Example: ['BTC/USDT', 'ETH/USDT', 'SOL/USDT']
    return [];
  }

  @override
  Future<OhlcvSeries> getKlineHistory({
    required String instrument,
    required Interval interval,
    required int limit,
  }) async {
    // Implement logic to fetch OHLCV/candlestick data
    // Returns an OhlcvSeries from finance_kline_core package
    return OhlcvSeries([]);
  }

  @override
  Set<Interval> getSupportedIntervals() {
    // Return the set of intervals your market provider supports
    return {
      Interval.$1m,
      Interval.$5m,
      Interval.$15m,
      Interval.$1h,
      Interval.$4h,
      Interval.$1d,
    };
  }
}
```

### Using a Market Provider

```dart
void main() async {
  final market = MyMarketProvider();

  // Get all spot trading pairs
  final spotInstruments = await market.getInstruments(
    type: InstrumentType.spot,
  );
  print('Available spot instruments: $spotInstruments');

  // Fetch 1-hour candlestick data
  final klineData = await market.getKlineHistory(
    instrument: 'BTC/USDT',
    interval: Interval.$1h,
    limit: 100,
  );
  print('Fetched ${klineData.length} candles');

  // Check supported intervals
  final intervals = market.getSupportedIntervals();
  print('Supported intervals: $intervals');
}
```

## API Reference

### Market Interface

The main abstract class that must be implemented:

#### Methods

- **`getInstruments({required InstrumentType type})`**
  - Returns a list of available instrument symbols for the specified type
  - Parameters:
    - `type`: The type of instruments to retrieve (spot, perpetual, futures, margin, options)
  - Returns: `FutureOr<List<String>>`

- **`getKlineHistory({required String instrument, required Interval interval, required int limit})`**
  - Fetches historical OHLCV candlestick data
  - Parameters:
    - `instrument`: The trading pair symbol (e.g., 'BTC/USDT')
    - `interval`: The time interval for each candle
    - `limit`: Maximum number of candles to retrieve
  - Returns: `FutureOr<OhlcvSeries>`

- **`getSupportedIntervals()`**
  - Returns the set of time intervals supported by this market provider
  - Returns: `Set<Interval>`

### InstrumentType Enum

Represents different types of financial instruments:

- `spot` - Spot trading markets
- `perpetual` - Perpetual futures/swaps
- `futures` - Dated futures contracts
- `margin` - Margin trading markets
- `options` - Options contracts

### Interval Enum

Predefined time intervals for candlestick data:

- **Seconds**: `$1s`
- **Minutes**: `$1m`, `$3m`, `$5m`, `$15m`, `$30m`
- **Hours**: `$1h`, `$2h`, `$4h`, `$6h`, `$8h`, `$12h`
- **Days**: `$1d`, `$2d`, `$3d`
- **Weeks**: `$1w`
- **Months**: `$1M`

## Dependencies

This package depends on:

- [`finance_kline_core`](https://pub.dev/packages/finance_kline_core) ^0.0.3 - Core data structures for OHLCV data

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the terms specified in the [LICENSE](LICENSE) file.

## Part of Coin Galaxy

This package is part of the Coin Galaxy ecosystem for cryptocurrency and financial market data processing.

## Support

- 🐦 Follow on Twitter: [@normidar](https://twitter.com/normidar)
- 💖 Sponsor: [GitHub Sponsors](https://github.com/sponsors/normidar)
- ⭐ Star on [GitHub](https://github.com/normidar/market_interface)