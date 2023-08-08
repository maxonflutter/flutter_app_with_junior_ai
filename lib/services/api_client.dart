import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class EcommerceApiClient {
  EcommerceApiClient({
    http.Client? httpClient,
  }) : this._(
          baseUrl: 'https://base-api-url.com',
          httpClient: httpClient,
        );

  EcommerceApiClient._({
    required String baseUrl,
    http.Client? httpClient,
  })  : _baseUrl = baseUrl,
        _httpClient = httpClient ?? http.Client();

  final String _baseUrl;
  final http.Client _httpClient;

  Future<List<dynamic>> getProducts() {
    final uri = Uri.parse('$_baseUrl/products');
    return _handleRequest(
      (headers) => _httpClient.get(
        uri,
        headers: headers,
      ),
    );
  }

  Future<Map<String, dynamic>> addProduct({
    required Map<String, dynamic> product,
  }) {
    final uri = Uri.parse('$_baseUrl/products');
    return _handleRequest(
      (headers) => _httpClient.post(
        uri,
        headers: headers,
        body: jsonEncode(product),
      ),
    );
  }

  Future<Map<String, dynamic>> updateProduct({
    required String id,
    required Map<String, dynamic> product,
  }) {
    final uri = Uri.parse('$_baseUrl/products/$id');
    return _handleRequest(
      (headers) => _httpClient.put(
        uri,
        headers: headers,
        body: jsonEncode(product),
      ),
    );
  }

  Future<void> deleteProduct({
    required String id,
  }) {
    final uri = Uri.parse('$_baseUrl/products/$id');
    return _handleRequest(
      (headers) => _httpClient.delete(
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