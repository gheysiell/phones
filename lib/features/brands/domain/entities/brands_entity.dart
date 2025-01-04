import 'package:phones/utils/functions.dart';

class Brand {
  int id, amountDevices;
  String name;

  Brand({
    required this.id,
    required this.amountDevices,
    required this.name,
  });

  void format() {
    name = Functions.capitalFirstLetter(name);
  }
}
