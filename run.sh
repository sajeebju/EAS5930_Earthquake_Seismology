#!/bin/bash

# Navigate to the ML directory
cd ML

echo "NAME,DEPMAX,DEPMIN,DISTANCE"  > depmin.csv

if ls *.wa 1> /dev/null 2>&1; then
    echo "Processing .wa files..."

    for file in *.wa; do
        echo "Processing file: $file"
        output=$(gsac << EOF
        rh $file
        lh dist depmin depmax
        q
EOF
        )
        
        depmax=$(echo "$output" | awk '/DEPMAX/ {print $NF}')
        depmin=$(echo "$output" | awk '/DEPMIN/ {print $NF}')
        dist=$(echo "$output" | awk '/DIST/ {print $NF}')

        if [ -n "$depmax" ] && [ -n "$depmin" ] && [ -n "$dist" ]; then
            echo "${file},${depmax},${depmin},${dist}" >> depmin.csv
            echo "Data written to CSV for $file: $depmax, $depmin, $dist"
        else
            echo "Data not found for $file"
        fi
    done
else
    echo "No .wa files found in the directory."
fi

echo "CSV file creation complete."

