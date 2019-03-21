class ContributionsEntity {
	List<ContributionsContribution> contributions;
	List<ContributionsYear> years;

	ContributionsEntity({this.contributions, this.years});

	ContributionsEntity.fromJson(Map<String, dynamic> json) {
		if (json['contributions'] != null) {
			contributions = new List<ContributionsContribution>();
			(json['contributions'] as List).forEach((v) { contributions.add(new ContributionsContribution.fromJson(v)); });
		}
		if (json['years'] != null) {
			years = new List<ContributionsYear>();
			(json['years'] as List).forEach((v) { years.add(new ContributionsYear.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.contributions != null) {
      data['contributions'] = this.contributions.map((v) => v.toJson()).toList();
    }
		if (this.years != null) {
      data['years'] = this.years.map((v) => v.toJson()).toList();
    }
		return data;
	}
}

class ContributionsContribution {
	String date;
	int intensity;
	String color;
	int count;

	ContributionsContribution({this.date, this.intensity, this.color, this.count});

	ContributionsContribution.fromJson(Map<String, dynamic> json) {
		date = json['date'];
		intensity = json['intensity'];
		color = json['color'];
		count = json['count'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['date'] = this.date;
		data['intensity'] = this.intensity;
		data['color'] = this.color;
		data['count'] = this.count;
		return data;
	}
}

class ContributionsYear {
	int total;
	String year;
	ContributionsYearsRange range;

	ContributionsYear({this.total, this.year, this.range});

	ContributionsYear.fromJson(Map<String, dynamic> json) {
		total = json['total'];
		year = json['year'];
		range = json['range'] != null ? new ContributionsYearsRange.fromJson(json['range']) : null;
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['total'] = this.total;
		data['year'] = this.year;
		if (this.range != null) {
      data['range'] = this.range.toJson();
    }
		return data;
	}
}

class ContributionsYearsRange {
	String start;
	String end;

	ContributionsYearsRange({this.start, this.end});

	ContributionsYearsRange.fromJson(Map<String, dynamic> json) {
		start = json['start'];
		end = json['end'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['start'] = this.start;
		data['end'] = this.end;
		return data;
	}
}
