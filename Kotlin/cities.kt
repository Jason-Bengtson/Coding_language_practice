data class City (val name: String, val lattitude: Double, val longitude: Double) {}

// Step 1
fun listCities() : MutableList<City> {
    val atlanta = City("Atlanta", 33.7490, -84.3880)
    val bozeman = City("Bozeman", 45.6770, -111.0429)
    val newYork = City("New York", 40.7128, -74.0060)
    val sanFran = City("San Francisco", 37.7749, -122.4194)
    val tacoma = City("Tacoma", 47.2529, -122.4443)

    val cityList = mutableListOf<City>()

    cityList.add(atlanta)
    cityList.add(bozeman)
    cityList.add(newYork)
    cityList.add(sanFran)
    cityList.add(tacoma)

    return cityList
}

// Step 2
fun haversine(lat1: Double, lon1: Double, lat2: Double, lon2: Double): Double {
    val R = 6372.8 // in kilometers
    val l1 = Math.toRadians(lat1)
    val l2 = Math.toRadians(lat2)
    val dl = Math.toRadians(lat2 - lat1)
    val dr = Math.toRadians(lon2 - lon1)

    return 2 * R *Math.asin(Math.sqrt(Math.pow(Math.sin(dl / 2), 2.0) +
            Math.pow(Math.sin(dr / 2), 2.0) * Math.cos(l1) * Math.cos(l2)))
}

// Step 3
fun distanceFromSeattle(city: City): Double {
    val seattle = City("Seattle", 47.6062, -122.3321)

    return haversine(city.lattitude, city.longitude, seattle.lattitude, seattle.longitude)
}

fun main(args: Array<String>) {

    var cityLocations = listCities()
    println("**********Step Two**********")
    for (city in cityLocations)
        println(city)
    println()

    println("**********Step Three**********")
    println("The distance between Seattle and Tacoma is " + distanceFromSeattle(cityLocations[4]) + "km")
    println()

    println("**********Step Four**********")
    println("A new List with the distances of all cities in list to \nSeattle: ")
    val distances = cityLocations.map {distanceFromSeattle(it) }
    println(distances)
    println()


    println("**********Step Five**********")
    println("List of cities over 1000km from Seattle: ")
    cityLocations.filter { city -> distanceFromSeattle(city) > 1000 }.forEach({ println(it.name) })
    println()

    println("**********Step Six**********")
    val west = cityLocations.filter { it -> it.longitude < -89.97803 }.map { it -> it.name }
    println(west)
    println()

    println("**********Step Seven**********")
    val max = cityLocations.maxBy { it -> distanceFromSeattle(it) }
    println("Max Distance: " + max)
    println()

    println("**********Step Eight**********")
    val mappedCities: Map<String, City> = cityLocations.map{it -> it.name to it}.toMap()
    mappedCities.forEach{name, city -> println("Name: $name, City: $city")}
    if (mappedCities.containsKey("Bozeman"))
        println("The lattitude of Bozeman is " + mappedCities.getValue("Bozeman").lattitude)
}