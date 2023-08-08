import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class ChatApiClient {
  ChatApiClient({
    http.Client? httpClient,
  }) : this._(
        baseUrl: 'https://base-api-url.com',
        httpClient: httpClient,
      );

  ChatApiClient._({
    required String baseUrl,
    http.Client? httpClient,
  })  : _baseUrl = baseUrl,
        _httpClient = httpClient ?? http.Client();

  final String _baseUrl;
  final http.Client _httpClient;

  Future<List<dynamic>> getChats() {
    final uri = Uri.parse('$_baseUrl/chats');
    return _handleRequest(
      (headers) => _httpClient.get(
        uri,
        headers: headers,
      ),
    );
  }

  Future<Map<String, dynamic>> startChat({
    required String userId,
  }) {
    final uri = Uri.parse('$_baseUrl/chats');
    return _handleRequest(
      (headers) => _httpClient.post(
        uri,
        headers: headers,
        body: jsonEncode({
          'userId': userId,
        }),
      ),
    );
  }

  Future<Map<String, dynamic>> getChat({
    required String chatId,
  }) {
    final uri = Uri.parse('$_baseUrl/chats/$chatId');
    return _handleRequest(
      (headers) => _httpClient.get(
        uri,
        headers: headers,
      ),
    );
  }

  Future<List<dynamic>> getUsers() {
    final uri = Uri.parse('$_baseUrl/users');
    return _handleRequest(
      (headers) => _httpClient.get(
        uri,
        headers: headers,
      ),
    );
  }

  Future<Map<String, dynamic>> getUser({
    required String userId,
  }) {
    final uri = Uri.parse('$_baseUrl/users/$userId');
    return _handleRequest(
      (headers) => _httpClient.get(
        uri,
        headers: headers,
      ),
    );
  }

  Future<dynamic> _handleRequest(
    Future<http.Response> Function(Map<String, String>) request,
  ) async {
    try {
      final headers = await _getRequestHeaders();
      final response = await request(headers);
      final body = jsonDecode(response.body);

      if (response.statusCode != HttpStatus.ok) {
        throw Exception('${response.statusCode}, error: ${body['message']}');
      }

      return body;
    } on TimeoutException {
      throw Exception('Request timeout. Please try again');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  Future<Map<String, String>> _getRequestHeaders() async {
    return <String, String>{
      HttpHeaders.contentTypeHeader: ContentType.json.value,
      HttpHeaders.acceptHeader: ContentType.json.value,
    };
  }
}