class ImageMapper {

  static String getImage(String icon) {
    switch (icon) {
      case '01d':
        return 'clear_sky_d';
      case '01n':
        return 'clear_sky_n';
      case '02d':
        return 'few_clouds_d';
      case '02n':
        return 'few_clouds_n';
      case '03d':
      case '03n':
        return 'scattered_clouds';
      case '04d':
      case '04n':
        return 'broken_clouds';
      case '09d':
      case '09n':
        return 'shower_rain';
      case '10d':
        return 'rain_d';
      case '10n':
        return 'rain_n';
      case '11d':
      case '11n':
        return 'thunderstorm';
      case '13d':
      case '13n':
        return 'snow';
      case '50d':
      case '50n':
        return 'mist';
    }
    return '';
  }
}