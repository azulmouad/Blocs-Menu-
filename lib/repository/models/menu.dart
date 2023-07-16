class MenuModel {
  final String title;
  final String subtitle;
  final bool status;

  MenuModel(
      {required this.title, required this.subtitle, required this.status});

  factory MenuModel.fromJson(Map<String, dynamic> json) {
    return MenuModel(
      title: json["title"] as String,
      subtitle: json["subtitle"] as String,
      status: json["status"] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "subtitle": subtitle,
      "status": status,
    };
  }

  MenuModel copyWith({
    final String? title,
    final String? subtitle,
    final bool? status,
  }) {
    return MenuModel(
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      status: status ?? this.status,
    );
  }
}
