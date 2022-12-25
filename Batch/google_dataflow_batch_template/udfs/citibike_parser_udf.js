function parse_users(line) {
    var values = line.split(',');
    var obj = new Object();
    obj.user_id = values[0];
    obj.user_type = values[1];
    obj.gender = values[2];
    obj.birth_year = values[3];
    obj.customer_plan = values[4];
    return JSON.stringify(obj);
}

function parse_trips(line) {
    var values = line.split(',');
    var obj = new Object();
    obj.bike_id = values[0];
    obj.user_id = values[1];
    obj.start_station_id = values[2];
    obj.end_station_id = values[3];
    obj.start_time = values[4];
    obj.stop_time = values[5];
    obj.trip_duration = values[6];
    return JSON.stringify(obj);
}

function parse_stations(line) {
     var values = line.split(',');
     var obj = new Object();
     obj.station_id = values[0];
     obj.short_name = values[1];
     obj.latitude = values[2];
     obj.longitude = values[3];
     obj.region_id = values[4];
     obj.rental_methods = values[5];
     obj.capacity = values[6];
     obj.last_reported = values[7];
     return JSON.stringify(obj);
}

function parse_bikes(line) {
    var values = line.split(',');
    var obj = new Object();
    obj.bike_id = values[0];
    obj.bike_type = values[1];
    return JSON.stringify(obj);
}
