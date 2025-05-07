#! /bin/bash -

# Set the root directory for the mess
mkdir -p find_practice
cd find_practice

# Function to create random text
create_text_file() {
    cat <<EOF > "$1"
This is a sample text file named $(basename "$1").
You can search for this file using the find command.
Practice makes perfect!
EOF
}

# Create a 4-level deep directory structure with files
for i in {1..3}; do
    level1="dir$i"
    mkdir -p "$level1"
    create_text_file "$level1/file_${i}.txt"

    for j in {1..2}; do
        level2="$level1/sub$j"
        mkdir -p "$level2"
        create_text_file "$level2/file_${i}_${j}.txt"

        for k in {1..2}; do
            level3="$level2/nest$k"
            mkdir -p "$level3"
            create_text_file "$level3/deep_${i}_${j}_${k}.txt"

            for l in {1..2}; do
                level4="$level3/deeper$l"
                mkdir -p "$level4"
                create_text_file "$level4/final_${i}_${j}_${k}_${l}.txt"
            done
        done
    done
done

echo "Mess created under find_practice. Ready for find command practice!"

