class Ayat {
  final int nomorAyat;
  final String teksArab;
  final String teksLatin;
  final String teksIndonesia;

  const Ayat({
    required this.nomorAyat,
    required this.teksArab,
    required this.teksLatin,
    required this.teksIndonesia,
  });

  factory Ayat.fromJson(Map<String, dynamic> json) {
    return Ayat(
      nomorAyat: json['nomorAyat'] as int? ?? 0,
      teksArab: json['teksArab']?.toString() ?? '',
      teksLatin: json['teksLatin']?.toString() ?? '',
      teksIndonesia: json['teksIndonesia']?.toString() ?? '',
    );
  }
}

class DetailSurat {
  final int nomor;
  final String nama;
  final String namaLatin;
  final String arti;
  final String tempatTurun;
  final String deskripsi;
  final List<Ayat> ayat;

  const DetailSurat({
    required this.nomor,
    required this.nama,
    required this.namaLatin,
    required this.arti,
    required this.tempatTurun,
    required this.deskripsi,
    required this.ayat,
  });

  factory DetailSurat.fromJson(Map<String, dynamic> json) {
    final listAyat = (json['ayat'] as List<dynamic>? ?? [])
        .map((item) => Ayat.fromJson(item as Map<String, dynamic>))
        .toList();

    return DetailSurat(
      nomor: json['nomor'] as int? ?? 0,
      nama: json['nama']?.toString() ?? '',
      namaLatin: json['namaLatin']?.toString() ?? '',
      arti: json['arti']?.toString() ?? '',
      tempatTurun: json['tempatTurun']?.toString() ?? '',
      deskripsi: json['deskripsi']?.toString() ?? '',
      ayat: listAyat,
    );
  }
}