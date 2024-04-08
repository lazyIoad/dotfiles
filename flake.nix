{
  description = "lazyload's dotfiles written in native formats";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = inputs@{ nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem
      (system:
        let
          pkgs = import nixpkgs {
            inherit system;
          };

          devShells = pkgs.mkShell {
            buildInputs = with pkgs; [
              nixpkgs-fmt
              nodePackages.prettier
              stylua
            ];
          };

          formatter = pkgs.nixpkgs-fmt;
        in
        {
          inherit formatter;
          devShells.default = devShells;
        });
}
