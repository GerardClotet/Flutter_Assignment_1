class Trip {
  String loc_name, description, descAsset, profile_pic, big_pic;
  int cost;
  Trip({
    this.loc_name,
    this.description,
    this.descAsset,
    this.profile_pic,
    this.big_pic,
    this.cost,
  });
}

final santorini = Trip(
  loc_name: 'Santorini',
  cost: 1450,
  description: 'Things to do in Santorini Greece. Discover the most Romantinc Holiday destination in Greece.',
  profile_pic: 'assets/profile_pic.png',
  big_pic: 'assets/background.jpg',
  descAsset: 'assets/desc_asset.jpg',
);
