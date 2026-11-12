{
  description = "Sutha's Homeland";

  inputs = {
    nixpkgs = {
      type = "tarball";
      url = "https://channels.nixos.org/nixos-26.05/nixexprs.tar.zst";
    };

    home-manager = {
      type = "github";
      owner = "nix-community";
      repo = "home-manager";
      ref = "release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    self.lfs = true;
    self.submodules = true;

    # additionals
    nixgl = {
      url = "github:nix-community/nixGL";
      inputs.nixpkgs.follows = "nixpkgs";
      };
  };

  outputs = { self, nixpkgs, home-manager, nixgl }: {
    packages.x86_64-linux = {
      default = home-manager.packages.x86_64-linux.default;
    };

    homeConfigurations = {
      "alpha@debian" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
	extraSpecialArgs = { inherit nixgl; };
	modules = [ ./home.nix ./linux.nix];
      };
    };
  };
}
