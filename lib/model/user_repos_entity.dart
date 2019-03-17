class UserReposEntity {
	String subscriptionsUrl;
	String reposUrl;
	String followingUrl;
	String name;
	String starredUrl;
	String login;
	String followersUrl;

	UserReposEntity({this.subscriptionsUrl, this.reposUrl, this.followingUrl, this.name, this.starredUrl, this.login, this.followersUrl});

	UserReposEntity.fromJson(Map<String, dynamic> json) {
		subscriptionsUrl = json['subscriptions_url'];
		reposUrl = json['repos_url'];
		followingUrl = json['following_url'];
		name = json['name'];
		starredUrl = json['starred_url'];
		login = json['login'];
		followersUrl = json['followers_url'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['subscriptions_url'] = this.subscriptionsUrl;
		data['repos_url'] = this.reposUrl;
		data['following_url'] = this.followingUrl;
		data['name'] = this.name;
		data['starred_url'] = this.starredUrl;
		data['login'] = this.login;
		data['followers_url'] = this.followersUrl;
		return data;
	}
}
