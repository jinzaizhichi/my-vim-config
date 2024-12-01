#!/bin/bash

ctrl_c() {
    echo -e "\nScript interrupted. Exiting..."
    
    tput cnorm
    
    exit 1
}

trap ctrl_c INT

types=("feat" "fix" "docs" "style" "refactor" "perf" "test" "chore")

select_type() {
    local selected=0
    local key=""

    tput civis

    while true; do
        clear

        echo "Select commit type (use arrow keys and press Enter):"
       
        for i in "${!types[@]}"; do
            if [ $i -eq $selected ]; then
                echo "> ${types[$i]}"
            else
                echo "  ${types[$i]}"
            fi
        done
 
        read -s -n 1 key

        case $key in
            A)
                ((selected--))
                if [ $selected -lt 0 ]; then
                    selected=$((${#types[@]} - 1))
                fi
                ;;
            B)
                ((selected++))
                if [ $selected -ge ${#types[@]} ]; then
                    selected=0
                fi
                ;;
            '')
                tput cnorm
                echo
                return $selected
                ;;
        esac
    done
}

select_type

commit_type=${types[$?]}

read -p "Enter scope (optional, press enter to skip): " scope

scope_part=""

if [[ -n $scope ]]; then
    scope_part="($scope)"
fi

while true; do
    read -p "Enter description (max 50 chars): " description
   
    if [[ -z $description ]]; then
        echo "Error: Description cannot be empty."
    elif [[ ${#description} -gt 50 ]]; then
        echo "Error: Description exceeds 50 characters. Please try again."
    else
        break
    fi
done

detailed_descriptions=()
while true; do
    read -p "Enter detailed description (optional, press enter to finish): " detail

    if [[ -z $detail ]]; then
        break
    else
        detailed_descriptions+=("$detail")
    fi
done

commit_message="$commit_type$scope_part: $description"

if [ ${#detailed_descriptions[@]} -gt 0 ]; then
    commit_message+="\n\n"

    for detail in "${detailed_descriptions[@]}"; do
        commit_message+="- $detail\n"
    done
fi

echo -e "\nCommit Message:"
echo -e "\n"
echo -e "$commit_message"

read -p "Do you want to commit these changes? (y/N): " confirm

if [[ $confirm =~ ^[Yy]$ ]]; then
    git add .

    git commit -m "$(echo -e "$commit_message")"

    echo "Changes staged and committed successfully."
else
    echo "Commit cancelled."
fi
