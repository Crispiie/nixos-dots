{
 description = "NixOS configuration with Home Manager";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    catppuccin.url = "github:catppuccin/nix";
    hyprland.url = "github:hyprwm/Hyprland";
  };
  outputs = { nixpkgs, home-manager, hyprland, catppuccin, ... }@inputs: {
    nixosConfigurations = {
      crispi-nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          inherit inputs;
        };
        modules = [
          ./system/configuration.nix
          ./system/hard-drive.nix
          catppuccin.nixosModules.default
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              backupFileExtension = "bak";

              users.crispi = {
                imports = [
                  ./home-manager/home.nix
                  catppuccin.homeModules.catppuccin
                ];
              };
              extraSpecialArgs = {
                inherit inputs;
                system = "x86_64-linux";
              };
            };
          }
        ];
      };
    };
  };
}
