import 'dart:core';

class NetworkTimestamp {
  int timestamp = 0;

  NetworkTimestamp(int timestamp) {
    this.timestamp = timestamp;
  }

  bool get isEpochal {
    return 0 == timestamp;
  }

  NetworkTimestamp addSeconds(int count) {
    throw UnimplementedError('`addSeconds` must be implemented by concrete class');
  }

  NetworkTimestamp addMinutes(int count) {
    return addSeconds(60 * count);
  }

  NetworkTimestamp addHours(int count) {
    return addMinutes(60 * count);
  }

  @override
  String toString() {
    return timestamp.toString();
  }
}

class NetworkTimestampDatetimeConverter {
  DateTime epoch = DateTime(0);
  int timeUnits = 1;

  NetworkTimestampDatetimeConverter(DateTime epoch, String timeUnits) {
    this.epoch = epoch;
    this.timeUnits = getTimeUnits(timeUnits);
  }

  DateTime toDatetime(int rawTimestamp) {
    return DateTime.fromMillisecondsSinceEpoch(this.epoch.millisecondsSinceEpoch + (rawTimestamp * this.timeUnits));
  }

  int getTimeUnits(String timeUnits){
    switch (timeUnits) {
      case 'hours':
        return 60 * 60 * 1000;
      case 'minutes':
        return 60 * 1000;
      case 'seconds':
        return 1000;
      case 'milliseconds':
        return 1;
      default:
        throw ArgumentError('timeUnits must be one of: hours, minutes, seconds, milliseconds');
    }
  }

  int toDifference(DateTime referenceDatetime) {
    if (referenceDatetime.isBefore(epoch)){
      throw RangeError('timestamp cannot be before epoch');
    }

    return (referenceDatetime.millisecondsSinceEpoch - epoch.millisecondsSinceEpoch) ~/ timeUnits;
  }
}