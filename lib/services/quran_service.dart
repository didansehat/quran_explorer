import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/surah.dart';
import '../models/detail_surah.dart';

class QuranService {
  static const String _baseUrl = 'https://equran.id/api/v2';

  Future<List<Surah>> fetchSurah() async {
    final response = await http.get(Uri.parse('$_baseUrl/surat'));

    if (response.statusCode != 200) {
      throw Exception('Gagal memuat daftar surah (HTTP ${response.statusCode})');
    }

    final body = jsonDecode(response.body) as Map<String, dynamic>;

    if (body['code'] != 200) {
      throw Exception(body['message'] ?? 'Respons API tidak valid');
    }

    final data = body['data'];

    if (data is! List) {
      throw Exception('Format data daftar surah tidak valid');
    }

    return data.map((item) => Surah.fromJson(item as Map<String, dynamic>)).toList();
  }

  Future<DetailSurat> fetchDetail(int nomor) async {
    final response = await http.get(Uri.parse('$_baseUrl/surat/$nomor'));

    if (response.statusCode != 200) {
      throw Exception('Gagal memuat detail surah (HTTP ${response.statusCode})');
    }

    final body = jsonDecode(response.body) as Map<String, dynamic>;

    if (body['code'] != 200) {
      throw Exception(body['message'] ?? 'Respons API tidak valid');
    }

    final data = body['data'];

    if (data is! Map<String, dynamic>) {
      throw Exception('Format data detail surah tidak valid');
    }

    return DetailSurat.fromJson(data);
  }
}