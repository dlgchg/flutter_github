class UserEntity {
	String gistsUrl;
	String reposUrl;
	bool twoFactorAuthentication;
	String followingUrl;
	String bio;
	String createdAt;
	String login;
	String type;
	String blog;
	int privateGists;
	int totalPrivateRepos;
	String subscriptionsUrl;
	String updatedAt;
	bool siteAdmin;
	int diskUsage;
	int collaborators;
	String company;
	int ownedPrivateRepos;
	int id;
	int publicRepos;
	String gravatarId;
	UserPlan plan;
	String email;
	String organizationsUrl;
	bool hireable;
	String starredUrl;
	String followersUrl;
	int publicGists;
	String url;
	String receivedEventsUrl;
	int followers;
	String avatarUrl;
	String eventsUrl;
	String htmlUrl;
	int following;
	String name;
	String location;
	String nodeId;

	UserEntity({this.gistsUrl, this.reposUrl, this.twoFactorAuthentication, this.followingUrl, this.bio, this.createdAt, this.login, this.type, this.blog, this.privateGists, this.totalPrivateRepos, this.subscriptionsUrl, this.updatedAt, this.siteAdmin, this.diskUsage, this.collaborators, this.company, this.ownedPrivateRepos, this.id, this.publicRepos, this.gravatarId, this.plan, this.email, this.organizationsUrl, this.hireable, this.starredUrl, this.followersUrl, this.publicGists, this.url, this.receivedEventsUrl, this.followers, this.avatarUrl, this.eventsUrl, this.htmlUrl, this.following, this.name, this.location, this.nodeId});

	UserEntity.fromJson(Map<String, dynamic> json) {
		gistsUrl = json['gists_url'];
		reposUrl = json['repos_url'];
		twoFactorAuthentication = json['two_factor_authentication'];
		followingUrl = json['following_url'];
		bio = json['bio'];
		createdAt = json['created_at'];
		login = json['login'];
		type = json['type'];
		blog = json['blog'];
		privateGists = json['private_gists'];
		totalPrivateRepos = json['total_private_repos'];
		subscriptionsUrl = json['subscriptions_url'];
		updatedAt = json['updated_at'];
		siteAdmin = json['site_admin'];
		diskUsage = json['disk_usage'];
		collaborators = json['collaborators'];
		company = json['company'];
		ownedPrivateRepos = json['owned_private_repos'];
		id = json['id'];
		publicRepos = json['public_repos'];
		gravatarId = json['gravatar_id'];
		plan = json['plan'] != null ? new UserPlan.fromJson(json['plan']) : null;
		email = json['email'];
		organizationsUrl = json['organizations_url'];
		hireable = json['hireable'];
		starredUrl = json['starred_url'];
		followersUrl = json['followers_url'];
		publicGists = json['public_gists'];
		url = json['url'];
		receivedEventsUrl = json['received_events_url'];
		followers = json['followers'];
		avatarUrl = json['avatar_url'];
		eventsUrl = json['events_url'];
		htmlUrl = json['html_url'];
		following = json['following'];
		name = json['name'];
		location = json['location'];
		nodeId = json['node_id'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['gists_url'] = this.gistsUrl;
		data['repos_url'] = this.reposUrl;
		data['two_factor_authentication'] = this.twoFactorAuthentication;
		data['following_url'] = this.followingUrl;
		data['bio'] = this.bio;
		data['created_at'] = this.createdAt;
		data['login'] = this.login;
		data['type'] = this.type;
		data['blog'] = this.blog;
		data['private_gists'] = this.privateGists;
		data['total_private_repos'] = this.totalPrivateRepos;
		data['subscriptions_url'] = this.subscriptionsUrl;
		data['updated_at'] = this.updatedAt;
		data['site_admin'] = this.siteAdmin;
		data['disk_usage'] = this.diskUsage;
		data['collaborators'] = this.collaborators;
		data['company'] = this.company;
		data['owned_private_repos'] = this.ownedPrivateRepos;
		data['id'] = this.id;
		data['public_repos'] = this.publicRepos;
		data['gravatar_id'] = this.gravatarId;
		if (this.plan != null) {
      data['plan'] = this.plan.toJson();
    }
		data['email'] = this.email;
		data['organizations_url'] = this.organizationsUrl;
		data['hireable'] = this.hireable;
		data['starred_url'] = this.starredUrl;
		data['followers_url'] = this.followersUrl;
		data['public_gists'] = this.publicGists;
		data['url'] = this.url;
		data['received_events_url'] = this.receivedEventsUrl;
		data['followers'] = this.followers;
		data['avatar_url'] = this.avatarUrl;
		data['events_url'] = this.eventsUrl;
		data['html_url'] = this.htmlUrl;
		data['following'] = this.following;
		data['name'] = this.name;
		data['location'] = this.location;
		data['node_id'] = this.nodeId;
		return data;
	}
}

class UserPlan {
	int privateRepos;
	String name;
	int collaborators;
	int space;

	UserPlan({this.privateRepos, this.name, this.collaborators, this.space});

	UserPlan.fromJson(Map<String, dynamic> json) {
		privateRepos = json['private_repos'];
		name = json['name'];
		collaborators = json['collaborators'];
		space = json['space'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['private_repos'] = this.privateRepos;
		data['name'] = this.name;
		data['collaborators'] = this.collaborators;
		data['space'] = this.space;
		return data;
	}
}
