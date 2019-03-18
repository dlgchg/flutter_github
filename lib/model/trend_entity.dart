class TrendEntity {
	int forks;
	List<TrendBuiltby> builtby;
	String author;
	String name;
	String description;
	String language;
	String languagecolor;
	int stars;
	String url;
	int currentperiodstars;

	TrendEntity({this.forks, this.builtby, this.author, this.name, this.description, this.language, this.languagecolor, this.stars, this.url, this.currentperiodstars});

	TrendEntity.fromJson(Map<String, dynamic> json) {
		forks = json['forks'];
		if (json['builtBy'] != null) {
			builtby = new List<TrendBuiltby>();
			(json['builtBy'] as List).forEach((v) { builtby.add(new TrendBuiltby.fromJson(v)); });
		}
		author = json['author'];
		name = json['name'];
		description = json['description'];
		language = json['language'];
		languagecolor = json['languageColor'];
		stars = json['stars'];
		url = json['url'];
		currentperiodstars = json['currentPeriodStars'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['forks'] = this.forks;
		if (this.builtby != null) {
      data['builtBy'] = this.builtby.map((v) => v.toJson()).toList();
    }
		data['author'] = this.author;
		data['name'] = this.name;
		data['description'] = this.description;
		data['language'] = this.language;
		data['languageColor'] = this.languagecolor;
		data['stars'] = this.stars;
		data['url'] = this.url;
		data['currentPeriodStars'] = this.currentperiodstars;
		return data;
	}
}

class TrendBuiltby {
	String href;
	String avatar;
	String username;

	TrendBuiltby({this.href, this.avatar, this.username});

	TrendBuiltby.fromJson(Map<String, dynamic> json) {
		href = json['href'];
		avatar = json['avatar'];
		username = json['username'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['href'] = this.href;
		data['avatar'] = this.avatar;
		data['username'] = this.username;
		return data;
	}
}
