class Repositories {
  final String? repo_name;
  final String? created_date;
  final String? last_pushed;
  final String? Description;
  final String? branch;
  final String? language;
  final String? url;
  final int? stars;

  Repositories(
      {
      this.repo_name,
      this.created_date,
      this.last_pushed,
      this.Description,
      this.branch,
      this.language,
      this.url,
      this.stars
      });
}
