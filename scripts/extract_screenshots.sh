#!/bin/bash

OUTPUT_DIR="extracted-screenshots"
TEMP_DIR=$(mktemp -d)
HASH_TRACKER="$TEMP_DIR/seen_hashes.txt"

echo "Creating output directory: $OUTPUT_DIR"
mkdir -p "$OUTPUT_DIR"
touch "$HASH_TRACKER"

COMMITS=$(git rev-list --reverse HEAD)

echo "Scanning $(echo "$COMMITS" | wc -l | tr -d ' ') commits..."

for commit in $COMMITS; do
    short_hash=$(git rev-parse --short "$commit")
    commit_date=$(git show -s --format=%ci "$commit" | cut -d' ' -f1)
    png_files=$(git ls-tree -r --name-only "$commit" | grep -E '\.png$')

    if [ -n "$png_files" ]; then
        while IFS= read -r file; do
            git show "$commit:$file" > "$TEMP_DIR/temp.png" 2>/dev/null

            if [ -f "$TEMP_DIR/temp.png" ]; then
                file_hash=$(shasum -a 256 "$TEMP_DIR/temp.png" | cut -d' ' -f1)

                if ! grep -q "^$file_hash$" "$HASH_TRACKER"; then
                    base_name=$(basename "$file" .png)
                    output_name="${commit_date}_${short_hash}_${base_name}.png"

                    cp "$TEMP_DIR/temp.png" "$OUTPUT_DIR/$output_name"
                    echo "$file_hash" >> "$HASH_TRACKER"

                    echo "Extracted: $output_name (from commit $short_hash)"
                fi

                rm "$TEMP_DIR/temp.png"
            fi
        done <<< "$png_files"
    fi
done

rm -rf "$TEMP_DIR"

echo ""
echo "Done! Extracted $(ls -1 "$OUTPUT_DIR" | wc -l | tr -d ' ') unique screenshots to $OUTPUT_DIR/"
echo "Files are named with format: YYYY-MM-DD_commithash_originalname.png"
