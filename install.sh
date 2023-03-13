#!/bin/bash

if ! [ -x "$(command -v nix)" ]; then
  echo 'Error: nix is not installed. See https://github.com/DeterminateSystems/nix-installer' >&2
  exit 1
fi

mkdir -p ~/.config/nix

cat <<EOF > ~/.config/nix/nix.conf
experimental-features = nix-command flakes
auto-optimise-store = true
keep-derivations = true
keep-outputs = true
EOF

echo 'On first run, you may need to use "nix run . switch -- --flake .#{USER}"'
echo 'Next: home-manager switch --flake .#{USER}'
