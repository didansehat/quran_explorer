import 'package:flutter/material.dart';

import '../models/detail_surah.dart';
import '../models/surah.dart';
import '../services/quran_service.dart';

class DetailSuratPage extends StatefulWidget {
  final Surah surah;

  const DetailSuratPage({
    super.key,
    required this.surah,
  });

  @override
  State<DetailSuratPage> createState() => _DetailSuratPageState();
}

class _DetailSuratPageState extends State<DetailSuratPage> {
  final QuranService _service = QuranService();

  late Future<DetailSurat> _futureDetail;

  @override
  void initState() {
    super.initState();
    _futureDetail = _service.fetchDetail(widget.surah.nomor);
  }

  void _reload() {
    setState(() {
      _futureDetail = _service.fetchDetail(widget.surah.nomor);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.surah.namaLatin),
      ),
      body: FutureBuilder<DetailSurat>(
        future: _futureDetail,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return _buildError(snapshot.error);
          }

          final detail = snapshot.data;

          if (detail == null) {
            return const Center(
              child: Text('Data surah tidak tersedia.'),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.only(bottom: 24),
            itemCount: detail.ayat.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return _buildHeader(detail);
              }

              final ayat = detail.ayat[index - 1];

              return Card(
                margin: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 6,
                ),
                elevation: 0,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                  side: BorderSide(
                    color: Colors.teal.shade100,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 16,
                        backgroundColor: Colors.teal.shade100,
                        child: Text(
                          '${ayat.nomorAyat}',
                          style: TextStyle(
                            color: Colors.teal.shade800,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          ayat.teksArab,
                          textAlign: TextAlign.right,
                          textDirection: TextDirection.rtl,
                          style: const TextStyle(
                            fontSize: 26,
                            height: 1.9,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        ayat.teksLatin,
                        style: TextStyle(
                          fontSize: 15,
                          fontStyle: FontStyle.italic,
                          color: Colors.teal.shade700,
                        ),
                      ),
                      const Divider(height: 24),
                      Text(
                        ayat.teksIndonesia,
                        style: const TextStyle(
                          fontSize: 15,
                          height: 1.6,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildHeader(DetailSurat detail) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.teal.shade700,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Text(
            detail.nama,
            textAlign: TextAlign.center,
            textDirection: TextDirection.rtl,
            style: const TextStyle(
              fontSize: 32,
              color: Colors.white,
              height: 1.8,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '${detail.namaLatin} • ${detail.arti}',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            '${detail.tempatTurun} • ${detail.ayat.length} ayat',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white70,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildError(Object? error) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.cloud_off,
              size: 64,
              color: Colors.red.shade300,
            ),
            const SizedBox(height: 16),
            const Text(
              'Gagal memuat detail surah',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              error.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey.shade700),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _reload,
              icon: const Icon(Icons.refresh),
              label: const Text('Coba Lagi'),
            ),
          ],
        ),
      ),
    );
  }
}