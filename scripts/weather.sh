#!/bin/bash

CITY="$1"

# Fetch weather data in JSON format
JSON_DATA=$(curl -s "wttr.in/${CITY}?format=j1")

if [ $? -eq 0 ]; then
        printf "%s\n" "$JSON_DATA" > .tmp_widgetw.txt
    else
    echo -n "(Offline) "
        JSON_DATA=$(cat .tmp_widgetw.txt)
fi

# --- Define ASCII art for different weather conditions ---
get_weather_art() {
  local desc_lower=$(echo "$1" | tr '[:upper:]' '[:lower:]')
  case "$desc_lower" in
    *"sunny" | *"clear"*)
        art="
  \   /
   .-.
― (   ) ―
   \`-’
  /   \
"
      ;;
    *"light rain sho"* | *"patchy rain ne"*)
        art="
_\`/\"\".-.
 ,\_(   ).
  /(___(__)
    ‘ ‘ ‘ ‘
   ‘ ‘ ‘ ‘
"
      ;;
    *"partly cloudy"*)
        art="
  \  /
_ /\"\".-.
  \_(   ).
  /(___(__)
"
      ;;
    *"cloudy"* | *"overcast"*)
        art="
    .--.
 .-(    ).
(___.__)__)
"
      ;;
    *"light drizzle"* | *"light rain"*)
        art="
  .-.
 (   ).
(___(__)
 ‘ ‘ ‘ ‘
‘ ‘ ‘ ‘
"
      ;;
    *"fog" | *"mist"*)
        art="
_ - _ - _ -
   _ - _ - _
  _ - _ - _ -
"
      ;;
    *"patchy light r"* | *"thundery outbr"*)
        art="
_\`/\"\".-.
 ,\_(   ).
  /(___(__)
   ⚡️‘‘⚡️‘‘
   ‘ ‘ ‘ ‘
"
      ;;
    *)
      # Default art for unknown conditions
      echo -e "      "
      echo -e "   .-.   "
      echo -e "  (.?)  "
      echo -e " (__.)  "
      echo -e "   •   "
      ;;
  esac
  echo -en "$art"
}

# --- Display current conditions with local ASCII art ---

CURRENT_TEMP=$(echo "${JSON_DATA}" | jq -r '.current_condition[0].temp_C')
CURRENT_DESC=$(echo "${JSON_DATA}" | jq -r '.current_condition[0].weatherDesc[0].value')
CURRENT_FEELS_LIKE=$(echo "${JSON_DATA}" | jq -r '.current_condition[0].FeelsLikeC')
CURRENT_WIND=$(echo "${JSON_DATA}" | jq -r '.current_condition[0].windspeedKmph')
CURRENT_HUMIDITY=$(echo "${JSON_DATA}" | jq -r '.current_condition[0].humidity')
CURRENT_CLOUD_COVER=$(echo "${JSON_DATA}" | jq -r '.current_condition[0].cloudcover')
CURRENT_PRECIP=$(echo "${JSON_DATA}" | jq -r '.current_condition[0].precipMM')
ASTRO_SUNRISE=$(echo "${JSON_DATA}" | jq -r '.weather[0].astronomy[0].sunrise')
ASTRO_SUNSET=$(echo "${JSON_DATA}" | jq -r '.weather[0].astronomy[0].sunset')
ASTRO_MOONRISE=$(echo "${JSON_DATA}" | jq -r '.weather[0].astronomy[0].moonrise')
ASTRO_MOONSET=$(echo "${JSON_DATA}" | jq -r '.weather[0].astronomy[0].moonset')
ASTRO_MOONILLUMINATION=$(echo "${JSON_DATA}" | jq -r '.weather[0].astronomy[0].moon_illumination')

echo -n "${CURRENT_DESC} in ${CITY}"

# Display the custom ASCII art
get_weather_art "${CURRENT_DESC}"

echo "Temperature: ${CURRENT_TEMP}°C (feels ${CURRENT_FEELS_LIKE}°C)"
echo "Wind: ${CURRENT_WIND} km/h"
echo "Humidity: ${CURRENT_HUMIDITY}%"
echo "Precip: ${CURRENT_PRECIP} mm"
echo "Cloud cover: ${CURRENT_CLOUD_COVER}%"
echo "Sun: ${ASTRO_SUNRISE} - ${ASTRO_SUNSET}"
echo "Moon: ${ASTRO_MOONRISE} - ${ASTRO_MOONSET} (bright ${ASTRO_MOONILLUMINATION}%)"

# --- Hourly Forecast Table ---
echo
echo "Hs | t°C | Wi | Pre | Cov | Description"
echo "———————————————————————————————————————"

echo "${JSON_DATA}" | jq -r '(.weather[0].hourly + .weather[1].hourly)[0:9] | .[] | "\(.time) \(.tempC) \(.windspeedKmph) \(.precipMM) \(.cloudcover) \"\(.weatherDesc[0].value)\""' | while read -r time temp wind precip cloudcover desc; do
    formatted_time=$(printf "%02d:%02d" $((time/100)) 0)
    formatted_time="${formatted_time/:00/}"
    desc=$(echo "$desc" | sed 's/"//g')
    max_length=24  # Максимальная длина без многоточия
    if [ ${#desc} -gt $max_length ]; then
        desc="${desc:0:max_length-1}…"  # Обрезаем и добавляем многоточие
    else
        desc="${desc}"  # Если длина меньше, оставляем как есть
    fi
        printf "%-2s | %-3s | %-2s | %-3s | %-3s | %s\n" "$formatted_time" "$temp" "$wind" "$precip" "$cloudcover" "$desc"
done

echo
echo Notes —————————————————————————————————
cat $HOME/Notes/todo.md
