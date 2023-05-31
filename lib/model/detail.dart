class MealDetail {
  final List<Meals>? meals;

  MealDetail({
    this.meals,
  });

  MealDetail.fromJson(Map<String, dynamic> json)
      : meals = (json['meals'] as List?)?.map((dynamic e) => Meals.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'meals' : meals?.map((e) => e.toJson()).toList()
  };
}

class Meals {
  final String? idMeal;
  final String? strMeal;
  final dynamic strDrinkAlternate;
  final String? strCategory;
  final String? strArea;
  final String? strInstructions;
  final String? strMealThumb;
  final String? strTags;
  final String? strYoutube;
  final dynamic strSource;
  final dynamic strImageSource;
  final dynamic strCreativeCommonsConfirmed;
  final dynamic dateModified;

  Meals({
    this.idMeal,
    this.strMeal,
    this.strDrinkAlternate,
    this.strCategory,
    this.strArea,
    this.strInstructions,
    this.strMealThumb,
    this.strTags,
    this.strYoutube,
    this.strSource,
    this.strImageSource,
    this.strCreativeCommonsConfirmed,
    this.dateModified,
  });

  Meals.fromJson(Map<String, dynamic> json)
      : idMeal = json['idMeal'] as String?,
        strMeal = json['strMeal'] as String?,
        strDrinkAlternate = json['strDrinkAlternate'],
        strCategory = json['strCategory'] as String?,
        strArea = json['strArea'] as String?,
        strInstructions = json['strInstructions'] as String?,
        strMealThumb = json['strMealThumb'] as String?,
        strTags = json['strTags'] as String?,
        strYoutube = json['strYoutube'] as String?,
        strSource = json['strSource'],
        strImageSource = json['strImageSource'],
        strCreativeCommonsConfirmed = json['strCreativeCommonsConfirmed'],
        dateModified = json['dateModified'];

  Map<String, dynamic> toJson() => {
    'idMeal' : idMeal,
    'strMeal' : strMeal,
    'strDrinkAlternate' : strDrinkAlternate,
    'strCategory' : strCategory,
    'strArea' : strArea,
    'strInstructions' : strInstructions,
    'strMealThumb' : strMealThumb,
    'strTags' : strTags,
    'strYoutube' : strYoutube,
    'strSource' : strSource,
    'strImageSource' : strImageSource,
    'strCreativeCommonsConfirmed' : strCreativeCommonsConfirmed,
    'dateModified' : dateModified
  };
}