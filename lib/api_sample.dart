class Countries {
    int updated;
    String country;
    CountryInfo countryInfo;
    int cases;
    int todayCases;
    int deaths;
    int todayDeaths;
    int recovered;
    int todayRecovered;
    int active;
    int critical;
    int casesPerOneMillion;
    int deathsPerOneMillion;
    int tests;
    int testsPerOneMillion;
    int population;
    Continent continent;
    int oneCasePerPeople;
    int oneDeathPerPeople;
    int oneTestPerPeople;
    double activePerOneMillion;
    double recoveredPerOneMillion;
    double criticalPerOneMillion;

    Countries({
        required this.updated,
        required this.country,
        required this.countryInfo,
        required this.cases,
        required this.todayCases,
        required this.deaths,
        required this.todayDeaths,
        required this.recovered,
        required this.todayRecovered,
        required this.active,
        required this.critical,
        required this.casesPerOneMillion,
        required this.deathsPerOneMillion,
        required this.tests,
        required this.testsPerOneMillion,
        required this.population,
        required this.continent,
        required this.oneCasePerPeople,
        required this.oneDeathPerPeople,
        required this.oneTestPerPeople,
        required this.activePerOneMillion,
        required this.recoveredPerOneMillion,
        required this.criticalPerOneMillion,
    });

}

enum Continent {
    AFRICA,
    ASIA,
    AUSTRALIA_OCEANIA,
    EMPTY,
    EUROPE,
    NORTH_AMERICA,
    SOUTH_AMERICA
}

class CountryInfo {
    int? id;
    String? iso2;
    String? iso3;
    double lat;
    double long;
    String flag;

    CountryInfo({
        required this.id,
        required this.iso2,
        required this.iso3,
        required this.lat,
        required this.long,
        required this.flag,
    });

}


