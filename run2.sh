#!/bin/bash
cd ML

echo "NAME,DEPMAX,DEPMIN,DISTANCE" > depmax.csv

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
        
        depmax=$(echo "$output" | grep 'DEPMAX' | tail -n 1 | awk '{print $2}')
        depmin=$(echo "$output" | grep 'DEPMIN' | tail -n 1 | awk '{print $2}')
        dist=$(echo "$output" | grep 'DIST' | tail -n 1 | awk '{print $2}')

        if [[ -n "$depmax" && -n "$depmin" && -n "$dist" ]]; then
            echo "${file},${depmax},${depmin},${dist}" >> depmax.csv
            echo "Data written to CSV for $file: $depmax, $depmin, $dist"
        else
            echo "Failed to extract data for $file"
        fi
    done
else
    echo "No .wa files found in the directory."
fi

echo "CSV file creation complete."

