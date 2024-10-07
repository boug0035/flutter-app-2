class DataItem {
  final String fact;
  final int length;

  DataItem({required this.fact, required this.length});

  factory DataItem.fromJson(Map<String, dynamic> json) {
    return DataItem(
      fact: json['fact'] as String,
      length: json['length'] as int,
    );
  }
}
