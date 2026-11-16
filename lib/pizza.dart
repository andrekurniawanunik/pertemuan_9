// Konstanta kunci JSON untuk mencegah kesalahan pengetikan (typo)
const String keyId = 'id';
const String keyName = 'pizzaName';
const String keyDescription = 'description';
const String keyPrice = 'price';
const String keyImage = 'imageUrl';

class Pizza {
  final int id;
  final String pizzaName;
  final String description;
  final double price;
  final String imageUrl;

  Pizza({
    required this.id,
    required this.pizzaName,
    required this.description,
    required this.price,
    required this.imageUrl,
  });

  // Factory constructor dengan parsing aman (tryParse & operator ??)
  factory Pizza.fromJson(Map<String, dynamic> json) {
    return Pizza(
      id: int.tryParse(json[keyId]?.toString() ?? '') ?? 0,
      pizzaName: json[keyName]?.toString() ?? 'Nama Pizza Tidak Diketahui',
      description: json[keyDescription]?.toString() ?? 'Tidak ada deskripsi',
      price: double.tryParse(json[keyPrice]?.toString() ?? '') ?? 0.0,
      imageUrl: json[keyImage]?.toString() ?? '',
    );
  }

  // Konversi objek Pizza kembali menjadi Map JSON
  Map<String, dynamic> toJson() {
    return {
      keyId: id,
      keyName: pizzaName,
      keyDescription: description,
      keyPrice: price,
      keyImage: imageUrl,
    };
  }
}