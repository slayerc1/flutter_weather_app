// To parse this JSON data, do
//
//     final weatherForecastResponse = weatherForecastResponseFromJson(jsonString);

import 'dart:convert';

class WeatherForecastResponse {
    WeatherForecastResponse({
        required this.cod,
        required this.message,
        required this.cnt,
        required this.list,
        required this.city,
    });

    String cod;
    int message;
    int cnt;
    List<ListElement> list;
    City city;

    factory WeatherForecastResponse.fromRawJson(String str) => WeatherForecastResponse.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory WeatherForecastResponse.fromJson(Map<String, dynamic> json) => WeatherForecastResponse(
        cod: json["cod"],
        message: json["message"],
        cnt: json["cnt"],
        list: List<ListElement>.from(json["list"].map((x) => ListElement.fromJson(x))),
        city: City.fromJson(json["city"]),
    );

    Map<String, dynamic> toJson() => {
        "cod": cod,
        "message": message,
        "cnt": cnt,
        "list": List<dynamic>.from(list.map((x) => x.toJson())),
        "city": city.toJson(),
    };
}

class City {
    City({
        required this.id,
        required this.name,
        required this.coord,
        required this.country,
        required this.population,
        required this.timezone,
        required this.sunrise,
        required this.sunset,
    });

    int id;
    String name;
    Coord coord;
    String country;
    int population;
    int timezone;
    int sunrise;
    int sunset;

    factory City.fromRawJson(String str) => City.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["id"],
        name: json["name"],
        coord: Coord.fromJson(json["coord"]),
        country: json["country"],
        population: json["population"],
        timezone: json["timezone"],
        sunrise: json["sunrise"],
        sunset: json["sunset"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "coord": coord.toJson(),
        "country": country,
        "population": population,
        "timezone": timezone,
        "sunrise": sunrise,
        "sunset": sunset,
    };
}

class Coord {
    Coord({
        required this.lat,
        required this.lon,
    });

    double lat;
    double lon;

    factory Coord.fromRawJson(String str) => Coord.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Coord.fromJson(Map<String, dynamic> json) => Coord(
        lat: json["lat"]?.toDouble(),
        lon: json["lon"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "lat": lat,
        "lon": lon,
    };
}

class ListElement {
    ListElement({
        required this.dt,
        required this.main,
        required this.weather,
        required this.clouds,
        required this.wind,
        required this.visibility,
        required this.pop,
        required this.sys,
        required this.dtTxt,
        this.rain,
    });

    int dt;
    MainClass main;
    List<WeatherData> weather;
    Clouds clouds;
    Wind wind;
    int visibility;
    double pop;
    Sys sys;
    DateTime dtTxt;
    Rain? rain;

    factory ListElement.fromRawJson(String str) => ListElement.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        dt: json["dt"],
        main: MainClass.fromJson(json["main"]),
        weather: List<WeatherData>.from(json["weather"].map((x) => WeatherData.fromJson(x))),
        clouds: Clouds.fromJson(json["clouds"]),
        wind: Wind.fromJson(json["wind"]),
        visibility: json["visibility"],
        pop: json["pop"]?.toDouble(),
        sys: Sys.fromJson(json["sys"]),
        dtTxt: DateTime.parse(json["dt_txt"]),
        rain: json["rain"] == null ? null : Rain.fromJson(json["rain"]),
    );

    Map<String, dynamic> toJson() => {
        "dt": dt,
        "main": main.toJson(),
        "weather": List<dynamic>.from(weather.map((x) => x.toJson())),
        "clouds": clouds.toJson(),
        "wind": wind.toJson(),
        "visibility": visibility,
        "pop": pop,
        "sys": sys.toJson(),
        "dt_txt": dtTxt.toIso8601String(),
        "rain": rain?.toJson(),
    };
}

class Clouds {
    Clouds({
        required this.all,
    });

    int all;

    factory Clouds.fromRawJson(String str) => Clouds.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Clouds.fromJson(Map<String, dynamic> json) => Clouds(
        all: json["all"],
    );

    Map<String, dynamic> toJson() => {
        "all": all,
    };
}

class MainClass {
    MainClass({
        required this.temp,
        required this.feelsLike,
        required this.tempMin,
        required this.tempMax,
        required this.pressure,
        required this.seaLevel,
        required this.grndLevel,
        required this.humidity,
        required this.tempKf,
    });

    double temp;
    double feelsLike;
    double tempMin;
    double tempMax;
    int pressure;
    int seaLevel;
    int grndLevel;
    int humidity;
    double tempKf;

    factory MainClass.fromRawJson(String str) => MainClass.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory MainClass.fromJson(Map<String, dynamic> json) => MainClass(
        temp: json["temp"]?.toDouble(),
        feelsLike: json["feels_like"]?.toDouble(),
        tempMin: json["temp_min"]?.toDouble(),
        tempMax: json["temp_max"]?.toDouble(),
        pressure: json["pressure"],
        seaLevel: json["sea_level"],
        grndLevel: json["grnd_level"],
        humidity: json["humidity"],
        tempKf: json["temp_kf"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "temp": temp,
        "feels_like": feelsLike,
        "temp_min": tempMin,
        "temp_max": tempMax,
        "pressure": pressure,
        "sea_level": seaLevel,
        "grnd_level": grndLevel,
        "humidity": humidity,
        "temp_kf": tempKf,
    };
}

class Rain {
    Rain({
        required this.the3H,
    });

    double the3H;

    factory Rain.fromRawJson(String str) => Rain.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Rain.fromJson(Map<String, dynamic> json) => Rain(
        the3H: json["3h"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "3h": the3H,
    };
}

class Sys {
    Sys({
        required this.pod,
    });

    Pod pod;

    factory Sys.fromRawJson(String str) => Sys.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Sys.fromJson(Map<String, dynamic> json) => Sys(
        pod: podValues.map[json["pod"]]!,
    );

    Map<String, dynamic> toJson() => {
        "pod": podValues.reverse[pod],
    };
}

enum Pod { D, N }

final podValues = EnumValues({
    "d": Pod.D,
    "n": Pod.N
});

class WeatherData {
    WeatherData({
        required this.id,
        required this.main,
        required this.description,
        required this.icon,
    });

    int id;
    MainEnum main;
    Description description;
    String icon;

    factory WeatherData.fromRawJson(String str) => WeatherData.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory WeatherData.fromJson(Map<String, dynamic> json) => WeatherData(
        id: json["id"],
        main: mainEnumValues.map[json["main"]]!,
        description: descriptionValues.map[json["description"]]!,
        icon: json["icon"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "main": mainEnumValues.reverse[main],
        "description": descriptionValues.reverse[description],
        "icon": icon,
    };
}

enum Description { CIELO_CLARO, ALGO_DE_NUBES, MUY_NUBOSO, NUBES_DISPERSAS, NUBES, LLUVIA_LIGERA }

final descriptionValues = EnumValues({
    "algo de nubes": Description.ALGO_DE_NUBES,
    "cielo claro": Description.CIELO_CLARO,
    "lluvia ligera": Description.LLUVIA_LIGERA,
    "muy nuboso": Description.MUY_NUBOSO,
    "nubes": Description.NUBES,
    "nubes dispersas": Description.NUBES_DISPERSAS
});

enum MainEnum { CLEAR, CLOUDS, RAIN }

final mainEnumValues = EnumValues({
    "Clear": MainEnum.CLEAR,
    "Clouds": MainEnum.CLOUDS,
    "Rain": MainEnum.RAIN
});

class Wind {
    Wind({
        required this.speed,
        required this.deg,
        required this.gust,
    });

    double speed;
    int deg;
    double gust;

    factory Wind.fromRawJson(String str) => Wind.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Wind.fromJson(Map<String, dynamic> json) => Wind(
        speed: json["speed"]?.toDouble(),
        deg: json["deg"],
        gust: json["gust"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "speed": speed,
        "deg": deg,
        "gust": gust,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
