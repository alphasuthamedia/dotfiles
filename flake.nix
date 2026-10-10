{
  description = "Dotfiles alpha";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=release-26.05";
    home-manager = {
      url = "github:nix-community/home-manager?ref=release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixgl = {
      url = "github:nix-community/nixGL";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      nixgl,
      ...
    }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      homeConfigurations.alpha = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./home.nix
          {
            targets.genericLinux.nixGL.packages = nixgl.packages;
            targets.genericLinux.nixGL.defaultWrapper = "mesa";
          }
        ];
      };
      formatter.${system} = pkgs.nixfmt;
    };
}
