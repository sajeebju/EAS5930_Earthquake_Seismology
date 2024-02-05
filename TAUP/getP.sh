#!/bin/bash
output_file="p_time_ray.csv"

echo "Distance,RayParameter,TravelTime" > "$output_file"

for distance in $(seq 0 0.1 180); do
    result=$(taup_time -mod ak135 -h 0 -deg $distance -ph P | grep -m 1 'P ')
    ray_param=$(echo "$result" | awk '{print $5}')
    travel_time=$(echo "$result" | awk '{print $4}')
    echo "$distance,$ray_param,$travel_time" >> "$output_file"
done

echo "Data collection complete. Output stored in $output_file"

