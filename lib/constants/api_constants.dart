class ApiConstants {
  //* Base URL
  static const String baseUrl = 'https://newsapi.org/v2';

  //* API Key (sebaiknya disimpan lebih aman di .env)
  static const String apiKey = ''http:'http://45.149.187.204:3000/api/auth/login';

  //* Endpoints
  static const String everythingEndpoint = '/everything';
  static const String topHeadlinesEndpoint = '/top-headlines';
  static const String sourcesEndpoint = '/sources';

  //* Default parameters
  static const Map<String, String> defaultParams = {
    'country': 'us',
    'pageSize': '20',
  };

  //* Headers
  static Map<String, String> get headers {
    return {'X-Api-key': apiKey, 'Content-Type': 'application/json'};
  }

  //* Authorization header alternatif
  static Map<String, String> get authHeaders {
    return {'Authorization': apiKey, 'Content-Type': 'application/json'};
  }
}
