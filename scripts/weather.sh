#!/bin/bash

CITY="$1"
LANG="en"

# Fetch weather data in JSON format
JSON_DATA=$(curl -s "wttr.in/${CITY}?format=j1&lang=${LANG}")

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
_\`/"".-.    
 ,\_(   ).            
  /(___(__)    
    ‘ ‘ ‘ ‘  
   ‘ ‘ ‘ ‘  
        "
      ;;
    *"partly cloudy"*)
        art="
  \  /       
_ /"".-.   
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
_\`/"".-.   
 ,\_(   ). 
  /(___(__)
   ⚡‘‘⚡‘‘
   ‘ ‘ ‘ ‘ 
        "
      ;;
    *)
      # Default art for unknown conditions
      echo -e "   .-.   "
      echo -e "  (.?)  "
      echo -e " (__.)  "
      echo -e "   •   "
      ;;
  esac
  echo -e "$art"
}

# --- Display current conditions with local ASCII art ---
echo "--- Current conditions in ${CITY} ---"

CURRENT_TEMP=$(echo "${JSON_DATA}" | jq -r '.current_condition[0].temp_C')
CURRENT_DESC=$(echo "${JSON_DATA}" | jq -r '.current_condition[0].weatherDesc[0].value')
CURRENT_FEELS_LIKE=$(echo "${JSON_DATA}" | jq -r '.current_condition[0].FeelsLikeC')
CURRENT_WIND=$(echo "${JSON_DATA}" | jq -r '.current_condition[0].windspeedKmph')
CURRENT_HUMIDITY=$(echo "${JSON_DATA}" | jq -r '.current_condition[0].humidity')

# Display the custom ASCII art
get_weather_art "${CURRENT_DESC}"

echo "Weather: ${CURRENT_DESC}"
echo "Temperature: ${CURRENT_TEMP}°C (${CURRENT_FEELS_LIKE}°C)"
echo "Wind: ${CURRENT_WIND} km/h"
echo "Humidity: ${CURRENT_HUMIDITY}%"

# --- Hourly Forecast Table ---
echo -e "\n--- Hourly Forecast Table ---"
echo " Time  |  Temp (°C)  |  Wind (km/h)  |   Description"
echo "-------+-------------+---------------+-------------------------"

echo "${JSON_DATA}" | jq -r '(.weather[0].hourly + .weather[1].hourly)[0:8] | .[] | "\(.time) \(.tempC) \(.windspeedKmph) \"\(.weatherDesc[0].value)\""' | while read -r time temp wind desc; do
    formatted_time=$(printf "%02d:%02d" $((time/100)) 0)
    desc=$(echo "$desc" | sed 's/"//g')
    printf " %-5s | %-11s | %-13s | %s\n" "$formatted_time" "$temp" "$wind" "$desc"
done
