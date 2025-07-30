class SupportModel {
  final String id;
  final String name;
  final String desc;
  final String address;
  final String tollFree;
  final String region;
  final String type;
  final String availableHours;

  SupportModel({
    required this.id,
    required this.name,
    required this.desc,
    required this.address,
    required this.tollFree,
    required this.region,
    required this.type,
    required this.availableHours,
  });

  // Create from Firestore document
  factory SupportModel.fromMap(Map<String, dynamic> map, String id) {
    return SupportModel(
      id: id,
      name: map['name'] ?? '',
      desc: map['desc'] ?? '',
      address: map['address'] ?? '',
      tollFree: map['tollFree'] ?? '',
      region: map['region'] ?? '',
      type: map['type'] ?? '',
      availableHours: map['availableHours'] ?? '',
    );
  }

  // Convert to Map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'desc': desc,
      'address': address,
      'tollFree': tollFree,
      'region': region,
      'type': type,
      'availableHours': availableHours,
    };
  }

  // Create a copy with updated fields
  SupportModel copyWith({
    String? id,
    String? name,
    String? desc,
    String? address,
    String? tollFree,
    String? region,
    String? type,
    String? availableHours,
  }) {
    return SupportModel(
      id: id ?? this.id,
      name: name ?? this.name,
      desc: desc ?? this.desc,
      address: address ?? this.address,
      tollFree: tollFree ?? this.tollFree,
      region: region ?? this.region,
      type: type ?? this.type,
      availableHours: availableHours ?? this.availableHours,
    );
  }

  @override
  String toString() {
    return 'SupportModel(id: $id, name: $name, desc: $desc, address: $address, tollFree: $tollFree, region: $region, type: $type, availableHours: $availableHours)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SupportModel &&
        other.id == id &&
        other.name == name &&
        other.desc == desc &&
        other.address == address &&
        other.tollFree == tollFree &&
        other.region == region &&
        other.type == type &&
        other.availableHours == availableHours;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        desc.hashCode ^
        address.hashCode ^
        tollFree.hashCode ^
        region.hashCode ^
        type.hashCode ^
        availableHours.hashCode;
  }
} 