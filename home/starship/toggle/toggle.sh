#! /usr/bin/env bash
LOCALE="$HOME/nix/home/common/modules/starship/"
if [ ! -e "$LOCALE" ]; then
    echo "Error: nixos config not found. Aborting"
    exit 1
fi

files=($(ls "$LOCALE"/configs/))
names=()
index=1

for file in "${files[@]}"; do
    # Remove the last dot and extension using sed
    name=$(echo "$file" | sed 's/\.[^.]*$//')
    names+=("$name")
    echo "$index: $name"
    (( index+=1 )) 
done

read -p "Choose a configuration": selection
choice=${names[($selection - 1)]}
echo "you chose config number $selection: $choice"
if [ -e "$LOCALE/starship.toml" ]; then
    echo 'starship file already exists. deleting now'
    sleep 1
    rm "$LOCALE"/starship.toml
else
    echo 'no starship file present'
fi

echo "moving ${files[($selection - 1)]}"
sleep 1
cp "$LOCALE"/configs/"${files[($selection - 1)]}" "$LOCALE"/starship.toml 
echo 'Restarting...'
sleep 1
home-manager switch --flake ~/nix > /dev/null 2>&1
clear

