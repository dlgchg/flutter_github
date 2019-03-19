class SearchReposEntity {
	int totalCount;
	bool incompleteResults;
	List<SearchReposItem> items;

	SearchReposEntity({this.totalCount, this.incompleteResults, this.items});

	SearchReposEntity.fromJson(Map<String, dynamic> json) {
		totalCount = json['total_count'];
		incompleteResults = json['incomplete_results'];
		if (json['items'] != null) {
			items = new List<SearchReposItem>();
			(json['items'] as List).forEach((v) { items.add(new SearchReposItem.fromJson(v)); });
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

class SearchReposItem {
	int stargazersCount;
	String pushedAt;
	String subscriptionUrl;
	String language;
	String branchesUrl;
	String issueCommentUrl;
	String labelsUrl;
	double score;
	String subscribersUrl;
	String releasesUrl;
	String svnUrl;
	int id;
	int forks;
	String archiveUrl;
	String gitRefsUrl;
	String forksUrl;
	String statusesUrl;
	String sshUrl;
	SearchReposItemsLicense license;
	String fullName;
	int size;
	String languagesUrl;
	String htmlUrl;
	String collaboratorsUrl;
	String cloneUrl;
	String name;
	String pullsUrl;
	String defaultBranch;
	String hooksUrl;
	String treesUrl;
	String tagsUrl;
	bool private;
	String contributorsUrl;
	bool hasDownloads;
	String notificationsUrl;
	int openIssuesCount;
	String description;
	String createdAt;
	int watchers;
	String keysUrl;
	String deploymentsUrl;
	bool hasProjects;
	bool archived;
	bool hasWiki;
	String updatedAt;
	String commentsUrl;
	String stargazersUrl;
	String gitUrl;
	bool hasPages;
	SearchReposItemsOwner owner;
	String commitsUrl;
	String compareUrl;
	String gitCommitsUrl;
	String blobsUrl;
	String gitTagsUrl;
	String mergesUrl;
	String downloadsUrl;
	bool hasIssues;
	String url;
	String contentsUrl;
	String mirrorUrl;
	String milestonesUrl;
	String teamsUrl;
	bool fork;
	String issuesUrl;
	String eventsUrl;
	String issueEventsUrl;
	String assigneesUrl;
	int openIssues;
	int watchersCount;
	String nodeId;
	String homepage;
	int forksCount;

	SearchReposItem({this.stargazersCount, this.pushedAt, this.subscriptionUrl, this.language, this.branchesUrl, this.issueCommentUrl, this.labelsUrl, this.score, this.subscribersUrl, this.releasesUrl, this.svnUrl, this.id, this.forks, this.archiveUrl, this.gitRefsUrl, this.forksUrl, this.statusesUrl, this.sshUrl, this.license, this.fullName, this.size, this.languagesUrl, this.htmlUrl, this.collaboratorsUrl, this.cloneUrl, this.name, this.pullsUrl, this.defaultBranch, this.hooksUrl, this.treesUrl, this.tagsUrl, this.private, this.contributorsUrl, this.hasDownloads, this.notificationsUrl, this.openIssuesCount, this.description, this.createdAt, this.watchers, this.keysUrl, this.deploymentsUrl, this.hasProjects, this.archived, this.hasWiki, this.updatedAt, this.commentsUrl, this.stargazersUrl, this.gitUrl, this.hasPages, this.owner, this.commitsUrl, this.compareUrl, this.gitCommitsUrl, this.blobsUrl, this.gitTagsUrl, this.mergesUrl, this.downloadsUrl, this.hasIssues, this.url, this.contentsUrl, this.mirrorUrl, this.milestonesUrl, this.teamsUrl, this.fork, this.issuesUrl, this.eventsUrl, this.issueEventsUrl, this.assigneesUrl, this.openIssues, this.watchersCount, this.nodeId, this.homepage, this.forksCount});

	SearchReposItem.fromJson(Map<String, dynamic> json) {
		stargazersCount = json['stargazers_count'];
		pushedAt = json['pushed_at'];
		subscriptionUrl = json['subscription_url'];
		language = json['language'];
		branchesUrl = json['branches_url'];
		issueCommentUrl = json['issue_comment_url'];
		labelsUrl = json['labels_url'];
		score = json['score'];
		subscribersUrl = json['subscribers_url'];
		releasesUrl = json['releases_url'];
		svnUrl = json['svn_url'];
		id = json['id'];
		forks = json['forks'];
		archiveUrl = json['archive_url'];
		gitRefsUrl = json['git_refs_url'];
		forksUrl = json['forks_url'];
		statusesUrl = json['statuses_url'];
		sshUrl = json['ssh_url'];
		license = json['license'] != null ? new SearchReposItemsLicense.fromJson(json['license']) : null;
		fullName = json['full_name'];
		size = json['size'];
		languagesUrl = json['languages_url'];
		htmlUrl = json['html_url'];
		collaboratorsUrl = json['collaborators_url'];
		cloneUrl = json['clone_url'];
		name = json['name'];
		pullsUrl = json['pulls_url'];
		defaultBranch = json['default_branch'];
		hooksUrl = json['hooks_url'];
		treesUrl = json['trees_url'];
		tagsUrl = json['tags_url'];
		private = json['private'];
		contributorsUrl = json['contributors_url'];
		hasDownloads = json['has_downloads'];
		notificationsUrl = json['notifications_url'];
		openIssuesCount = json['open_issues_count'];
		description = json['description'];
		createdAt = json['created_at'];
		watchers = json['watchers'];
		keysUrl = json['keys_url'];
		deploymentsUrl = json['deployments_url'];
		hasProjects = json['has_projects'];
		archived = json['archived'];
		hasWiki = json['has_wiki'];
		updatedAt = json['updated_at'];
		commentsUrl = json['comments_url'];
		stargazersUrl = json['stargazers_url'];
		gitUrl = json['git_url'];
		hasPages = json['has_pages'];
		owner = json['owner'] != null ? new SearchReposItemsOwner.fromJson(json['owner']) : null;
		commitsUrl = json['commits_url'];
		compareUrl = json['compare_url'];
		gitCommitsUrl = json['git_commits_url'];
		blobsUrl = json['blobs_url'];
		gitTagsUrl = json['git_tags_url'];
		mergesUrl = json['merges_url'];
		downloadsUrl = json['downloads_url'];
		hasIssues = json['has_issues'];
		url = json['url'];
		contentsUrl = json['contents_url'];
		mirrorUrl = json['mirror_url'];
		milestonesUrl = json['milestones_url'];
		teamsUrl = json['teams_url'];
		fork = json['fork'];
		issuesUrl = json['issues_url'];
		eventsUrl = json['events_url'];
		issueEventsUrl = json['issue_events_url'];
		assigneesUrl = json['assignees_url'];
		openIssues = json['open_issues'];
		watchersCount = json['watchers_count'];
		nodeId = json['node_id'];
		homepage = json['homepage'];
		forksCount = json['forks_count'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['stargazers_count'] = this.stargazersCount;
		data['pushed_at'] = this.pushedAt;
		data['subscription_url'] = this.subscriptionUrl;
		data['language'] = this.language;
		data['branches_url'] = this.branchesUrl;
		data['issue_comment_url'] = this.issueCommentUrl;
		data['labels_url'] = this.labelsUrl;
		data['score'] = this.score;
		data['subscribers_url'] = this.subscribersUrl;
		data['releases_url'] = this.releasesUrl;
		data['svn_url'] = this.svnUrl;
		data['id'] = this.id;
		data['forks'] = this.forks;
		data['archive_url'] = this.archiveUrl;
		data['git_refs_url'] = this.gitRefsUrl;
		data['forks_url'] = this.forksUrl;
		data['statuses_url'] = this.statusesUrl;
		data['ssh_url'] = this.sshUrl;
		if (this.license != null) {
      data['license'] = this.license.toJson();
    }
		data['full_name'] = this.fullName;
		data['size'] = this.size;
		data['languages_url'] = this.languagesUrl;
		data['html_url'] = this.htmlUrl;
		data['collaborators_url'] = this.collaboratorsUrl;
		data['clone_url'] = this.cloneUrl;
		data['name'] = this.name;
		data['pulls_url'] = this.pullsUrl;
		data['default_branch'] = this.defaultBranch;
		data['hooks_url'] = this.hooksUrl;
		data['trees_url'] = this.treesUrl;
		data['tags_url'] = this.tagsUrl;
		data['private'] = this.private;
		data['contributors_url'] = this.contributorsUrl;
		data['has_downloads'] = this.hasDownloads;
		data['notifications_url'] = this.notificationsUrl;
		data['open_issues_count'] = this.openIssuesCount;
		data['description'] = this.description;
		data['created_at'] = this.createdAt;
		data['watchers'] = this.watchers;
		data['keys_url'] = this.keysUrl;
		data['deployments_url'] = this.deploymentsUrl;
		data['has_projects'] = this.hasProjects;
		data['archived'] = this.archived;
		data['has_wiki'] = this.hasWiki;
		data['updated_at'] = this.updatedAt;
		data['comments_url'] = this.commentsUrl;
		data['stargazers_url'] = this.stargazersUrl;
		data['git_url'] = this.gitUrl;
		data['has_pages'] = this.hasPages;
		if (this.owner != null) {
      data['owner'] = this.owner.toJson();
    }
		data['commits_url'] = this.commitsUrl;
		data['compare_url'] = this.compareUrl;
		data['git_commits_url'] = this.gitCommitsUrl;
		data['blobs_url'] = this.blobsUrl;
		data['git_tags_url'] = this.gitTagsUrl;
		data['merges_url'] = this.mergesUrl;
		data['downloads_url'] = this.downloadsUrl;
		data['has_issues'] = this.hasIssues;
		data['url'] = this.url;
		data['contents_url'] = this.contentsUrl;
		data['mirror_url'] = this.mirrorUrl;
		data['milestones_url'] = this.milestonesUrl;
		data['teams_url'] = this.teamsUrl;
		data['fork'] = this.fork;
		data['issues_url'] = this.issuesUrl;
		data['events_url'] = this.eventsUrl;
		data['issue_events_url'] = this.issueEventsUrl;
		data['assignees_url'] = this.assigneesUrl;
		data['open_issues'] = this.openIssues;
		data['watchers_count'] = this.watchersCount;
		data['node_id'] = this.nodeId;
		data['homepage'] = this.homepage;
		data['forks_count'] = this.forksCount;
		return data;
	}
}

class SearchReposItemsLicense {
	String name;
	String spdxId;
	String key;
	String url;
	String nodeId;

	SearchReposItemsLicense({this.name, this.spdxId, this.key, this.url, this.nodeId});

	SearchReposItemsLicense.fromJson(Map<String, dynamic> json) {
		name = json['name'];
		spdxId = json['spdx_id'];
		key = json['key'];
		url = json['url'];
		nodeId = json['node_id'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['name'] = this.name;
		data['spdx_id'] = this.spdxId;
		data['key'] = this.key;
		data['url'] = this.url;
		data['node_id'] = this.nodeId;
		return data;
	}
}

class SearchReposItemsOwner {
	String gistsUrl;
	String reposUrl;
	String followingUrl;
	String starredUrl;
	String login;
	String followersUrl;
	String type;
	String url;
	String subscriptionsUrl;
	String receivedEventsUrl;
	String avatarUrl;
	String eventsUrl;
	String htmlUrl;
	bool siteAdmin;
	int id;
	String gravatarId;
	String nodeId;
	String organizationsUrl;

	SearchReposItemsOwner({this.gistsUrl, this.reposUrl, this.followingUrl, this.starredUrl, this.login, this.followersUrl, this.type, this.url, this.subscriptionsUrl, this.receivedEventsUrl, this.avatarUrl, this.eventsUrl, this.htmlUrl, this.siteAdmin, this.id, this.gravatarId, this.nodeId, this.organizationsUrl});

	SearchReposItemsOwner.fromJson(Map<String, dynamic> json) {
		gistsUrl = json['gists_url'];
		reposUrl = json['repos_url'];
		followingUrl = json['following_url'];
		starredUrl = json['starred_url'];
		login = json['login'];
		followersUrl = json['followers_url'];
		type = json['type'];
		url = json['url'];
		subscriptionsUrl = json['subscriptions_url'];
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
