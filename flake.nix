{
  description = "Home Manager configuration of rajas";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    plasma-manager = {
      url = "github:pjones/plasma-manager";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };
    vscode-server.url = "github:nix-community/nixos-vscode-server";
  };

  outputs =
    { nixpkgs
    , home-manager
    , plasma-manager
    , vscode-server
    , ...
    }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      homeConfigurations."rajas" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [
          ./home.nix
          plasma-manager.homeManagerModules.plasma-manager
        ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
      };
      homeConfigurations."rajas@robo360" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [
          ./robo360.nix
          ./bash.nix
        ];
      };
    };
}
