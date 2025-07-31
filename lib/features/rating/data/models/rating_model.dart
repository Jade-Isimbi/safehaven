class RatingModel {
  final String id;
  final String message;
  final String rating;
  final String region;
  final String userID;

  RatingModel({
    required this.id,
    required this.message,
    required this.rating,
    required this.region,
    required this.userID,
  });

  factory RatingModel.fromMap(Map<String, dynamic> map, String id) {
    return RatingModel(
      id: id,
      message: map['message'] ?? '',
      rating: map['rating'] ?? '',
      region: map['region'] ?? '',
      userID: map['userID'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'message': message,
      'rating': rating,
      'region': region,
      'userID': userID,
    };
  }
}