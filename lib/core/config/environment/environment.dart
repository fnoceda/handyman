import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment{
  static initEnvirionment()async{
    await dotenv.load(fileName: '.env');
  }
  static String apiUrl = dotenv.env['API_URL'] ?? 'the api key is not configure';
}