#!/bin/bash

temp_file=$(mktemp)

cat "/home/yasmin/.config/starship-preset.toml" >"$temp_file"

cat "/home/yasmin/.cache/noctalia/starship-palette.toml" >>"$temp_file"

mv "$temp_file" "/home/yasmin/.config/starship.toml"
