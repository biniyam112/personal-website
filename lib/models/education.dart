class Education {
  final String description;
  final String linkName;
  final String? linkAddress;
  final String period;

  Education({
    required this.description,
    required this.linkName,
    this.linkAddress,
    required this.period,
  });
}
