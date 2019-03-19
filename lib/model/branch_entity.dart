class BranchEntity {
	bool protected;
	String name;
	BranchCommit commit;

	BranchEntity({this.protected, this.name, this.commit});

	BranchEntity.fromJson(Map<String, dynamic> json) {
		protected = json['protected'];
		name = json['name'];
		commit = json['commit'] != null ? new BranchCommit.fromJson(json['commit']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['protected'] = this.protected;
		data['name'] = this.name;
		if (this.commit != null) {
      data['commit'] = this.commit.toJson();
    }
		return data;
	}
}

class BranchCommit {
	String sha;
	String url;

	BranchCommit({this.sha, this.url});

	BranchCommit.fromJson(Map<String, dynamic> json) {
		sha = json['sha'];
		url = json['url'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['sha'] = this.sha;
		data['url'] = this.url;
		return data;
	}
}
