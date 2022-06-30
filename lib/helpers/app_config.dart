class AppConfig {
  static const String _baseUrl = 'https://api.seatgeek.com/2';
  static const String _client_id = 'Mjc2NjI1Njd8MTY1NjU4NjU0MS45NTAyNjcz';

  static String getEvents(String params) => "$_baseUrl/events?client_id=$_client_id&q=$params";
}
