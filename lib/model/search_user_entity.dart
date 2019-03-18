class SearchUserEntity {
	int totalCount;
	bool incompleteResults;
	List<SearchUserItem> items;

	SearchUserEntity({this.totalCount, this.incompleteResults, this.items});

	SearchUserEntity.fromJson(Map<String, dynamic> json) {
		totalCount = json['total_count'];
		incompleteResults = json['incomplete_results'];
		if (json['items'] != null) {
			items = new List<SearchUserItem>();
			(json['items'] as List).forEach((v) { items.add(new SearchUserItem.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['total_count'] = this.totalCount;
		data['incomplete_results'] = this.incompleteResults;
		if (this.items != null) {
      data['items'] = this.items.map((v) => v.toJson()).toList();
    }
		return data;
	}
}

class SearchUserItem {
	String gistsUrl;
	String reposUrl;
	String followingUrl;
	String starredUrl;
	String login;
	String followersUrl;
	String type;
	String url;
	String subscriptionsUrl;
	double score;
	String receivedEventsUrl;
	String avatarUrl;
	String eventsUrl;
	String htmlUrl;
	bool siteAdmin;
	int id;
	String gravatarId;
	String nodeId;
	String organizationsUrl;

	SearchUserItem({this.gistsUrl, this.reposUrl, this.followingUrl, this.starredUrl, this.login, this.followersUrl, this.type, this.url, this.subscriptionsUrl, this.score, this.receivedEventsUrl, this.avatarUrl, this.eventsUrl, this.htmlUrl, this.siteAdmin, this.id, this.gravatarId, this.nodeId, this.organizationsUrl});

	SearchUserItem.fromJson(Map<String, dynamic> json) {
		gistsUrl = json['gists_url'];
		reposUrl = json['repos_url'];
		followingUrl = json['following_url'];
		starredUrl = json['starred_url'];
		login = json['login'];
		followersUrl = json['followers_url'];
		type = json['type'];
		url = json['url'];
		subscriptionsUrl = json['subscriptions_url'];
		score = json['score'];
		receivedEventsUrl = json['received_events_url'];
		avatarUrl = json['avatar_url'];
		eventsUrl = json['events_url'];
		htmlUrl = json['html_url'];
		siteAdmin = json['site_admin'];
		id = json['id'];
		gravatarId = json['gravatar_id'];
		nodeId = json['node_id'];
		organizationsUrl = json['organizations_url'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['gists_url'] = this.gistsUrl;
		data['repos_url'] = this.reposUrl;
		data['following_url'] = this.followingUrl;
		data['starred_url'] = this.starredUrl;
		data['login'] = this.login;
		data['followers_url'] = this.followersUrl;
		data['type'] = this.type;
		data['url'] = this.url;
		data['subscriptions_url'] = this.subscriptionsUrl;
		data['score'] = this.score;
		data['received_events_url'] = this.receivedEventsUrl;
		data['avatar_url'] = this.avatarUrl;
		data['events_url'] = this.eventsUrl;
		data['html_url'] = this.htmlUrl;
		data['site_admin'] = this.siteAdmin;
		data['id'] = this.id;
		data['gravatar_id'] = this.gravatarId;
		data['node_id'] = this.nodeId;
		data['organizations_url'] = this.organizationsUrl;
		return data;
	}
}
