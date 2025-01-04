import 'package:flutter_dotenv/flutter_dotenv.dart';

class Constants {
  static final String apiKey = dotenv.get('API_KEY');
  static const String baseUrl = 'https://zylalabs.com/api/2281/mobile+phone+database+api/';
  static const String baseUrlImages = 'https://mobile-phone-database.s3.amazonaws.com/images/';
  static Duration timeoutHttpDuration = const Duration(seconds: 10);
  static String timeoutGenericMessage = 'timeout exception in';
  static String generalGenericMessage = 'generic exception in';
}
