// To parse this JSON data, do
//
//     final eatModel = eatModelFromJson(jsonString);

import 'dart:convert';

List<EatModel> eatModelFromJson(String str) => List<EatModel>.from(json.decode(str).map((x) => EatModel.fromJson(x)));

String eatModelToJson(List<EatModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EatModel {
    EatModel({
        this.dayDate,
        this.totalCalories,
        this.totalProtein,
        this.totalFats,
        this.totalCarbohydrates,
        this.meals,
    });

    DateTime dayDate;
    int totalCalories;
    int totalProtein;
    int totalFats;
    int totalCarbohydrates;
    List<Meal> meals;

    factory EatModel.fromJson(Map<String, dynamic> json) => EatModel(
        dayDate: json["day_date"] == null ? null : DateTime.parse(json["day_date"]),
        totalCalories: json["total_calories"] == null ? null : json["total_calories"],
        totalProtein: json["total_protein"] == null ? null : json["total_protein"],
        totalFats: json["total_fats"] == null ? null : json["total_fats"],
        totalCarbohydrates: json["total_carbohydrates"] == null ? null : json["total_carbohydrates"],
        meals: json["meals"] == null ? null : List<Meal>.from(json["meals"].map((x) => Meal.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "day_date": dayDate == null ? null : dayDate.toIso8601String(),
        "total_calories": totalCalories == null ? null : totalCalories,
        "total_protein": totalProtein == null ? null : totalProtein,
        "total_fats": totalFats == null ? null : totalFats,
        "total_carbohydrates": totalCarbohydrates == null ? null : totalCarbohydrates,
        "meals": meals == null ? null : List<dynamic>.from(meals.map((x) => x.toJson())),
    };
}

class Meal {
    Meal({
        this.mealDate,
        this.mealTypeId,
        this.mealTypeName,
        this.products,
    });

    DateTime mealDate;
    int mealTypeId;
    String mealTypeName;
    List<Product> products;

    factory Meal.fromJson(Map<String, dynamic> json) => Meal(
        mealDate: json["meal_date"] == null ? null : DateTime.parse(json["meal_date"]),
        mealTypeId: json["meal_type_id"] == null ? null : json["meal_type_id"],
        mealTypeName: json["meal_type_name"] == null ? null : json["meal_type_name"],
        products: json["products"] == null ? null : List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "meal_date": mealDate == null ? null : mealDate.toIso8601String(),
        "meal_type_id": mealTypeId == null ? null : mealTypeId,
        "meal_type_name": mealTypeName == null ? null : mealTypeName,
        "products": products == null ? null : List<dynamic>.from(products.map((x) => x.toJson())),
    };
}

class Product {
    Product({
        this.mealName,
        this.mealCalories,
        this.mealProtein,
        this.mealFats,
        this.mealCarbohydrates,
        this.mealWeight,
        this.mealUnit,
        this.isEat,
    });

    String mealName;
    double mealCalories;
    double mealProtein;
    double mealFats;
    double mealCarbohydrates;
    int mealWeight;
    String mealUnit;
    bool isEat;

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        mealName: json["meal_name"] == null ? null : json["meal_name"],
        mealCalories: json["meal_calories"] == null ? null : json["meal_calories"].toDouble(),
        mealProtein: json["meal_protein"] == null ? null : json["meal_protein"].toDouble(),
        mealFats: json["meal_fats"] == null ? null : json["meal_fats"].toDouble(),
        mealCarbohydrates: json["meal_carbohydrates"] == null ? null : json["meal_carbohydrates"].toDouble(),
        mealWeight: json["meal_weight"] == null ? null : json["meal_weight"],
        mealUnit: json["meal_unit"] == null ? null : json["meal_unit"],
        isEat: json["is_eat"] == null ? null : json["is_eat"],
    );

    Map<String, dynamic> toJson() => {
        "meal_name": mealName == null ? null : mealName,
        "meal_calories": mealCalories == null ? null : mealCalories,
        "meal_protein": mealProtein == null ? null : mealProtein,
        "meal_fats": mealFats == null ? null : mealFats,
        "meal_carbohydrates": mealCarbohydrates == null ? null : mealCarbohydrates,
        "meal_weight": mealWeight == null ? null : mealWeight,
        "meal_unit": mealUnit == null ? null : mealUnit,
        "is_eat": isEat == null ? null : isEat,
    };
}
