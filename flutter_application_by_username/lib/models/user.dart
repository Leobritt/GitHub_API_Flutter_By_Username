class User {
  final String login;
  final int id;
  final String avatarUrl;
  final String url;
  final String urlRepos;

  const User(
      {required this.login,
      required this.id,
      required this.avatarUrl,
      required this.url,
      required this.urlRepos});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        login: json['login'],
        id: json['id'],
        avatarUrl: json['avatar_url'],
        urlRepos: json['repos_url'],
        url: json['html_url']);
  }
}
