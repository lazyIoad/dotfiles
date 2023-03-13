{
  description = "Home Manager configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }: let
    withCfg = { arch, homeDirectory} : 
      home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${arch};
        modules = [ (import ./home.nix homeDirectory) ];
      };
  in {
    defaultPackage = {
      x86_64-darwin = home-manager.defaultPackage.x86_64-darwin;
      aarch64-darwin = home-manager.defaultPackage.aarch64-darwin;
    };

    homeConfigurations = {
      "areeb" = withCfg { arch = "x86_64-darwin"; homeDirectory = "/Users/areeb"; };
    };
  };
}
