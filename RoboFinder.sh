#!/bin/bash

RoboFinder() {
    if [ -z "$1" ]; then
        echo "Usage: RoboFinder <domain>"
        return 1
    fi

    local target=$1
    local output_file="${target}_robots_paths.txt"

    echo "Fetching robots.txt indexes from the Wayback Machine for $target..."

    # Fetch indexes of robots.txt with status code 200
    cdx_url="https://web.archive.org/cdx/search/cdx?url=https://$target/robots.txt&output=json&filter=statuscode:200&fl=timestamp,original&collapse=digest"
    indexes=$(curl -s "$cdx_url" | jq -r '.[] | @tsv' | tail -n +2)

    if [ -z "$indexes" ]; then
        echo "No robots.txt files found for $target."
        return 1
    fi

    # Extract and fetch robots.txt content
    echo "Extracting paths from robots.txt files..."
    echo "" > "$output_file"

    while IFS=$'\t' read -r timestamp original_url; do
        wayback_url="https://web.archive.org/web/${timestamp}if_/https://$target/robots.txt"
        curl -s "$wayback_url" | grep -Eo '^Disallow: [^ ]+' | awk '{print $2}' >> "$output_file"
    done <<< "$indexes"

    # Remove duplicates and sort
    sort -u "$output_file" -o "$output_file"

    echo "Unique paths extracted and saved to $output_file"
}

RoboFinder "$1"

