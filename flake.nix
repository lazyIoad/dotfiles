{
  description = "Home Manager configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }: 
  {
    defaultPackage = {
      x86_64-darwin = home-manager.defaultPackage.x86_64-darwin;
      aarch64-darwin = home-manager.defaultPackage.aarch64-darwin;
    };

    homeConfigurations = {
      "lazyload" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages."x86_64-darwin";
        modules = [ (import ./hosts/lazyload.nix  "/Users/areeb") ];
      };
    };
  };
}
