#!/usr/bin/env fish

set api_key "api key"
set city "your city"

set city (echo $city | curl -Gso /dev/null -w %{url_effective} --data-urlencode @- "" | cut -c 3- || true)
set data (curl -s "http://api.weatherapi.com/v1/current.json?key=$api_key&q=$city")
set code (echo $data | jq -r '.current.condition.code')
set temp (echo $data | jq -r '.current.temp_f')
set feelslike (echo $data | jq -r '.current.feelslike_f')
set humidity (echo $data | jq -r '.current.humidity')
set is_day (echo $data | jq -r '.current.is_day')
set city (echo $data | jq -r '.location.name')
set region (echo $data | jq -r '.location.region')
set precipitation (echo $data | jq -r '.current.precip_in')
set wind_speed (echo $data | jq -r '.current.wind_mph')
set wind_direction (echo $data | jq -r '.current.wind_dir')
set condition (echo $data | jq -r '.current.condition.text')

if test "$is_day" -eq 1
    switch $code
        case 1000
            set icon  # Sunny, Clear/113
        case 1003
            set icon  # Partly cloudy/116
        case 1006
            set icon  # Cloudy/119
        case 1009
            set icon  # Overcast/122
        case 1030
            set icon  # Mist/143
        case 1063
            set icon  # Patchy rain possible/176
        case 1066
            set icon  # Patchy snow possible/179
        case 1069
            set icon  # Patchy sleet possible/182
        case 1072
            set icon  # Patchy freezing drizzle possible/185
        case 1087
            set icon  # Thundery outbreaks possible/200
        case 1114
            set icon  # Blowing snow/227
        case 1117
            set icon  # Blizzard/230
        case 1135
            set icon  # Fog/248
        case 1147
            set icon  # Freezing fog/260
        case 1150
            set icon  # Patchy light drizzle/263
        case 1153
            set icon  # Light drizzle/266
        case 1168
            set icon  # Freezing drizzle/281
        case 1171
            set icon  # Heavy freezing drizzle/284
        case 1180
            set icon  # Patchy light rain/293
        case 1183
            set icon  # Light rain/296
        case 1186
            set icon  # Moderate rain at times/299
        case 1189
            set icon  # Moderate rain/302
        case 1192
            set icon  # Heavy rain at times/305
        case 1195
            set icon  # Heavy rain/308
        case 1198
            set icon  # Light freezing rain/311
        case 1201
            set icon  # Moderate or heavy freezing rain/314
        case 1204
            set icon  # Light sleet/317
        case 1207
            set icon  # Moderate or heavy sleet/320
        case 1210
            set icon  # Patchy light snow/323
        case 1213
            set icon  # Light snow/326
        case 1216
            set icon  # Patchy moderate snow/329
        case 1219
            set icon  # Moderate snow/332
        case 1222
            set icon  # Patchy heavy snow/335
        case 1225
            set icon  # Heavy snow/338
        case 1237
            set icon  # Ice pellets/350
        case 1240
            set icon  # Light rain shower/353
        case 1243
            set icon  # Moderate or heavy rain shower/356
        case 1246
            set icon  # Torrential rain shower/359
        case 1249
            set icon  # Light sleet showers/362
        case 1252
            set icon  # Moderate or heavy sleet showers/365
        case 1255
            set icon  # Light snow showers/368
        case 1258
            set icon  # Moderate or heavy snow showers/371
        case 1261
            set icon  # Light showers of ice pellets/374
        case 1264
            set icon  # Moderate or heavy showers of ice pellets/377
        case 1273
            set icon  # Patchy light rain with thunder/386
        case 1276
            set icon  # Moderate or heavy rain with thunder/389
        case 1279
            set icon  # Patchy light snow with thunder/392
        case 1282
            set icon  # Moderate or heavy snow with thunder/395
    end
else
    switch $code
        case 1000
            set icon  # Sunny, Clear/113
        case 1003
            set icon  # Partly cloudy/116
        case 1006
            set icon  # Cloudy/119
        case 1009
            set icon  # Overcast/122
        case 1030
            set icon  # Mist/143
        case 1063
            set icon  # Patchy rain possible/176
        case 1066
            set icon  # Patchy snow possible/179
        case 1069
            set icon  # Patchy sleet possible/182
        case 1072
            set icon  # Patchy freezing drizzle possible/185
        case 1087
            set icon  # Thundery outbreaks possible/200
        case 1114
            set icon  # Blowing snow/227
        case 1117
            set icon  # Blizzard/230
        case 1135
            set icon  # Fog/248
        case 1147
            set icon  # Freezing fog/260
        case 1150
            set icon  # Patchy light drizzle/263
        case 1153
            set icon  # Light drizzle/266
        case 1168
            set icon  # Freezing drizzle/281
        case 1171
            set icon  # Heavy freezing drizzle/284
        case 1180
            set icon  # Patchy light rain/293
        case 1183
            set icon  # Light rain/296
        case 1186
            set icon  # Moderate rain at times/299
        case 1189
            set icon  # Moderate rain/302
        case 1192
            set icon  # Heavy rain at times/305
        case 1195
            set icon  # Heavy rain/308
        case 1198
            set icon  # Light freezing rain/311
        case 1201
            set icon  # Moderate or heavy freezing rain/314
        case 1204
            set icon  # Light sleet/317
        case 1207
            set icon  # Moderate or heavy sleet/320
        case 1210
            set icon  # Patchy light snow/323
        case 1213
            set icon  # Light snow/326
        case 1216
            set icon  # Patchy moderate snow/329
        case 1219
            set icon  # Moderate snow/332
        case 1222
            set icon  # Patchy heavy snow/335
        case 1225
            set icon  # Heavy snow/338
        case 1237
            set icon  # Ice pellets/350
        case 1240
            set icon  # Light rain shower/353
        case 1243
            set icon  # Moderate or heavy rain shower/356
        case 1246
            set icon  # Torrential rain shower/359
        case 1249
            set icon  # Light sleet showers/362
        case 1252
            set icon  # Moderate or heavy sleet showers/365
        case 1255
            set icon  # Light snow showers/368
        case 1258
            set icon  # Moderate or heavy snow showers/371
        case 1261
            set icon  # Light showers of ice pellets/374
        case 1264
            set icon  # Moderate or heavy showers of ice pellets/377
        case 1273
            set icon  # Patchy light rain with thunder/386
        case 1276
            set icon  # Moderate or heavy rain with thunder/389
        case 1279
            set icon  # Patchy light snow with thunder/392
        case 1282
            set icon  # Moderate or heavy snow with thunder/395
    end
end


sketchybar \
    --set $NAME icon="$icon" label="$temp°F" \
    --set weather.location label="Location: $city" \
    --set weather.condition label="Condition: $condition" \
    --set weather.feels_like label="Feels Like: $feelslike°F" \
    --set weather.precipitation label="Precipitation: $precipitation in" \
    --set weather.humidity label="Humidity: $humidity%" \
    --set weather.wind label="Wind: $wind_speed $wind_direction"
