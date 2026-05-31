class CompanyEntity {
  const CompanyEntity({
    required this.userId,
    required this.name,
    required this.bin,
    required this.address,
    required this.foundedYear,
    this.createdAt,
  });

  final int userId;
  final String name;
  final String bin;
  final String address;
  final String foundedYear;
  final DateTime? createdAt;

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'name': name,
        'bin': bin,
        'address': address,
        'foundedYear': foundedYear,
        'createdAt': createdAt?.toIso8601String(),
      };

  factory CompanyEntity.fromJson(Map<String, dynamic> json) => CompanyEntity(
        userId: json['userId'] as int,
        name: json['name'] as String,
        bin: json['bin'] as String,
        address: json['address'] as String,
        foundedYear: json['foundedYear'] as String,
        createdAt: json['createdAt'] != null
            ? DateTime.parse(json['createdAt'] as String)
            : null,
      );
}
