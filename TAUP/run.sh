#!/bin/bash
output_pcp="PcP_data.csv"
output_pkp="PKP_data.csv"
output_pkikp="PKIKP_data.csv"

echo "Distance,RayParameter,TravelTime" > "$output_pcp"
echo "Distance,RayParameter,TravelTime" > "$output_pkp"
echo "Distance,RayParameter,TravelTime" > "$output_pkikp"

for distance in $(seq 0 0.1 180); do
    # Get travel times and ray parameters for each phase and append to the output file
    taup_time -mod ak135 -h 0 -deg $distance -ph PcP | \
    awk -v d=$distance '/PcP/ {print d "," $5 "," $4}' >> "$output_pcp"

    taup_time -mod ak135 -h 0 -deg $distance -ph PKP | \
    awk -v d=$distance '/PKP/ {print d "," $5 "," $4}' >> "$output_pkp"

    taup_time -mod ak135 -h 0 -deg $distance -ph PKIKP | \
    awk -v d=$distance '/PKIKP/ {print d "," $5 "," $4}' >> "$output_pkikp"
done

echo "Data collection complete."

