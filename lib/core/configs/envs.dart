import "package:flutter_dotenv/flutter_dotenv.dart";

class Envs {
  static String apiKey = dotenv.get("API_KEY");

  static String apiUrl =
      dotenv.get("API_URL", fallback: "https://api.coingecko.com/api/v3/");
}
