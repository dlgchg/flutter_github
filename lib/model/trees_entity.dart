class TreesEntity {
	List<TreesTree> tree;
	bool truncated;
	String sha;
	String url;

	TreesEntity({this.tree, this.truncated, this.sha, this.url});

	TreesEntity.fromJson(Map<String, dynamic> json) {
		if (json['tree'] != null) {
			tree = new List<TreesTree>();
			(json['tree'] as List).forEach((v) { tree.add(new TreesTree.fromJson(v)); });
		}
		truncated = json['truncated'];
		sha = json['sha'];
		url = json['url'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.tree != null) {
      data['tree'] = this.tree.map((v) => v.toJson()).toList();
    }
		data['truncated'] = this.truncated;
		data['sha'] = this.sha;
		data['url'] = this.url;
		return data;
	}
}

class TreesTree {
	String mode;
	String path;
	int size;
	String type;
	String sha;
	String url;

	TreesTree({this.mode, this.path, this.size, this.type, this.sha, this.url});

	TreesTree.fromJson(Map<String, dynamic> json) {
		mode = json['mode'];
		path = json['path'];
		size = json['size'];
		type = json['type'];
		sha = json['sha'];
		url = json['url'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['mode'] = this.mode;
		data['path'] = this.path;
		data['size'] = this.size;
		data['type'] = this.type;
		data['sha'] = this.sha;
		data['url'] = this.url;
		return data;
	}
}
