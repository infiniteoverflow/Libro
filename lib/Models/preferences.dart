import 'package:hive/hive.dart';
part 'preferences.g.dart';

@HiveType(typeId: 1)
class Preferences {
  @HiveField(0)
  final bool firstTime;

  Preferences({this.firstTime});
}