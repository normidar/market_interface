enum Interval {
  $1s,
  $1m,
  $3m,
  $5m,
  $15m,
  $30m,
  $1h,
  $2h,
  $4h,
  $6h,
  $8h,
  $12h,
  $1d,
  $2d,
  $3d,
  $1w,
  $1M;

  /// Converts the interval to a [Duration].
  /// Note: For $1M (1 month), an approximate duration of 30 days is used.
  Duration get duration {
    switch (this) {
      case Interval.$1s:
        return const Duration(seconds: 1);
      case Interval.$1m:
        return const Duration(minutes: 1);
      case Interval.$3m:
        return const Duration(minutes: 3);
      case Interval.$5m:
        return const Duration(minutes: 5);
      case Interval.$15m:
        return const Duration(minutes: 15);
      case Interval.$30m:
        return const Duration(minutes: 30);
      case Interval.$1h:
        return const Duration(hours: 1);
      case Interval.$2h:
        return const Duration(hours: 2);
      case Interval.$4h:
        return const Duration(hours: 4);
      case Interval.$6h:
        return const Duration(hours: 6);
      case Interval.$8h:
        return const Duration(hours: 8);
      case Interval.$12h:
        return const Duration(hours: 12);
      case Interval.$1d:
        return const Duration(days: 1);
      case Interval.$2d:
        return const Duration(days: 2);
      case Interval.$3d:
        return const Duration(days: 3);
      case Interval.$1w:
        return const Duration(days: 7);
      case Interval.$1M:
        return const Duration(days: 30);
    }
  }
}
