// Mendefinisikan konstanta untuk kunci JSON di luar kelas
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

  // Constructor fromJson menggunakan konstanta kunci dan penanganan aman (Safe parsing)
  Pizza.fromJson(Map<String, dynamic> json)
      : id = int.tryParse(json[keyId]?.toString() ?? '0') ?? 0,
        pizzaName = json[keyName] != null ? json[keyName].toString() : 'No name',
        description = json[keyDescription]?.toString() ?? '',
        price = double.tryParse(json[keyPrice]?.toString() ?? '0.0') ?? 0.0,
        imageUrl = json[keyImage]?.toString() ?? '';

  // Method toJson menggunakan konstanta kunci
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
