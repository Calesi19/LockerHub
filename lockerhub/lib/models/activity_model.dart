// A model class representing an activity log in the database. The model has a unit number, a date, and a description.


class ActivityModel {
  String id;
  int number;
  String date;
  String description;

  ActivityModel(
      { required this.id ,required this.number, required this.date, required this.description});
}

