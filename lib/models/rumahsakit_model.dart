class RumahSakit {
  final String name;
  final String address;
  final String region;
  final String phone;
  final String province;

  RumahSakit({
    this.name,
    this.address,
    this.region,
    this.phone,
    this.province,
  });

  factory RumahSakit.fromJson(Map<String, dynamic> json) => RumahSakit(
        name: json['name'],
        address: json['address'],
        region: json['region'],
        phone: json['phone'],
        province: json['province'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'address': address,
        'region': region,
        'phone': phone,
        'province': province,
      };
}
