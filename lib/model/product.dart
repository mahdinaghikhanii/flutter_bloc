class Product {
  int id = 0;
  String name = '';
  double price = 0;
  double off = 0;
  String note = '';
  String picurl = '';

  Product(
      {required this.id,
      required this.name,
      required this.price,
      required this.off,
      required this.note,
      required this.picurl});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    off = json['off'];
    note = json['note'];
    picurl = json['picurl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    data['off'] = off;
    data['note'] = note;
    data['picurl'] = picurl;
    return data;
  }

  static Future<List<Product>> loadData() async {
    return Future.delayed(const Duration(seconds: 3), () {
      return [
        Product(
            id: 1,
            name: "iphone se",
            price: 300,
            note: "this is new iphone se 64GB",
            picurl:
                'https://www.backmarket.co.uk/cdn-cgi/image/format=auto,quality=75,width=3840/https://d1eh9yux7w8iql.cloudfront.net/product_images/21896_3cdee697-34c0-4a03-8073-6edc5dc6719d.jpg',
            off: 0),
        Product(
            id: 2,
            name: "iphone xr",
            price: 300,
            note: "this is new iphone se xr 64",
            picurl:
                'https://www.backmarket.co.uk/cdn-cgi/image/format=auto,quality=75,width=640/https://d1eh9yux7w8iql.cloudfront.net/product_images/161659_848a30d3-eb74-4100-904a-4d98c61112d6.jpg',
            off: 0),
        Product(
            id: 3,
            name: "iphone se",
            price: 300,
            note: "this is new iphone se 64GB",
            picurl:
                'https://www.backmarket.co.uk/cdn-cgi/image/format=auto,quality=75,width=3840/https://d1eh9yux7w8iql.cloudfront.net/product_images/21896_3cdee697-34c0-4a03-8073-6edc5dc6719d.jpg',
            off: 0),
        Product(
            id: 4,
            name: "iphone 11",
            price: 300,
            note: "this is new iphone 11 128",
            picurl:
                'https://www.backmarket.co.uk/cdn-cgi/image/format=auto,quality=75,width=640/https://d1eh9yux7w8iql.cloudfront.net/product_images/290057_15e344e7-089c-4ba1-8871-294737418908.jpg',
            off: 0),
      ];
    });
  }
}
