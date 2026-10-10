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
    {
      homeConfigurations = {
        x86-linux = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux;

          modules = [
            ./home.nix
            {
              targets.genericLinux.enable = true;

              targets.genericLinux.nixGL = {
                packages = nixgl.packages.x86_64-linux;
                defaultWrapper = "mesa";
              };
            }
          ];
        };

        aarch64-darwin = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.aarch64-darwin;

          modules = [
            ./home.nix
          ];
        };
      };

      formatter = {
        x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt;
        aarch64-darwin = nixpkgs.legacyPackages.aarch64-darwin.nixfmt;
      };
    };
}
