{
  description = "lazyload's dotfiles written in native formats";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = inputs@{ nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem
      (system:
        let pkgs = nixpkgs.legacyPackages.${system};
        in {
          formatter = pkgs.nixpkgs-fmt;
          devShells.default =
            pkgs.mkShell {
              buildInputs = with pkgs; [
                nixpkgs-fmt
                stylua
              ];
            };
        });
}
