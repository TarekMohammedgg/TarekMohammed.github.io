class Project {
  final String title;
  final String description;
  final List<String> tags;
  final String? githubUrl;
  final String? imagePath; // Path to project screenshot/image

  Project({
    required this.title,
    required this.description,
    required this.tags,
    this.githubUrl,
    this.imagePath,
  });
}
