import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/news_everything_model.dart';
import '../constants/api_constants.dart';
import '../models/news_top_headline_country_model.dart';
import '../models/news_top_headline_source_mode.dart';

class NewsController with ChangeNotifier {
  NewsEverythingModel? _newsModel;
  NewsTopHeadlineCountryModel? _topHeadlineModel;
  NewsTopHeadlineSourceMode? _sourceModel;
  bool _isLoading = false;
  String? _errorMessage;

  NewsEverythingModel? get newsModel => _newsModel;
  NewsTopHeadlineCountryModel? get topHeadlineModel => _topHeadlineModel;
  NewsTopHeadlineSourceMode? get sourceModel => _sourceModel;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchTopHeadlines() async {
    _isLoading = true;
    notifyListeners();

    try {
      final uri = Uri.parse(
        '${ApiConstants.baseUrl}${ApiConstants.topHeadlinesEndpoint}?'
        'country=${ApiConstants.defaultParams['country']}&'
        'pageSize=${ApiConstants.defaultParams['pageSize']}&'
        'apiKey=${ApiConstants.apiKey}',
      );

      log('Request URL: ${uri.toString()}'); // Debugging
      log('Headers: ${ApiConstants.headers}'); // Debugging

      final response = await http.get(uri, headers: ApiConstants.headers);

      log('Response Status: ${response.statusCode}'); // Debugging
      log('Response Body: ${response.body}'); // Debugging

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _topHeadlineModel = NewsTopHeadlineCountryModel.fromJson(data);
        _errorMessage = null;
      } else {
        _errorMessage =
            'Failed to load news: ${response.statusCode} - ${response.body}';
      }
    } catch (e) {
      _errorMessage = 'Error fetching news: ${e.toString()}';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchEverything({required String query}) async {
    _isLoading = true;
    notifyListeners();

    try {
      final uri = Uri.parse(
        '${ApiConstants.baseUrl}${ApiConstants.everythingEndpoint}?'
        'q=$query&'
        'pageSize=${ApiConstants.defaultParams['pageSize']}',
      );

      final response = await http.get(uri, headers: ApiConstants.headers);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _newsModel = NewsEverythingModel.fromJson(data);
        _errorMessage = null;
      } else {
        _errorMessage = 'Failed to load news: ${response.statusCode}';
      }
    } catch (e) {
      _errorMessage = 'Error fetching news: ${e.toString()}';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchBySource({required String sourceId}) async {
    _isLoading = true;
    notifyListeners();

    try {
      final uri = Uri.parse(
        '${ApiConstants.baseUrl}${ApiConstants.topHeadlinesEndpoint}?'
        'sources=$sourceId&'
        'pageSize=${ApiConstants.defaultParams['pageSize']}',
      );

      final response = await http.get(uri, headers: ApiConstants.headers);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _topHeadlineModel = NewsTopHeadlineCountryModel.fromJson(data);
        _errorMessage = null;
      } else {
        _errorMessage = 'Failed to load news: ${response.statusCode}';
      }
    } catch (e) {
      _errorMessage = 'Error fetching news: ${e.toString()}';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchSources() async {
    _isLoading = true;
    notifyListeners();

    try {
      final uri = Uri.parse(
        '${ApiConstants.baseUrl}${ApiConstants.sourcesEndpoint}',
      );

      final response = await http.get(uri, headers: ApiConstants.headers);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _sourceModel = NewsTopHeadlineSourceMode.fromJson(data);
        _errorMessage = null;
      } else {
        _errorMessage = 'Failed to load sources: ${response.statusCode}';
      }
    } catch (e) {
      _errorMessage = 'Error fetching sources: ${e.toString()}';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }
}
