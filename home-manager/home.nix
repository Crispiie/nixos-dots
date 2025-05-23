{ config, pkgs, inputs, system, catppuccin, ... }:
{
  imports = [
    ./hyprland.nix
    ./upkgs.nix
    ./programs.nix
    ./gtk.nix
    ./dconf.nix
    ./waybar.nix
    ./catppuccin.nix
    ./fish.nix
    ./git.nix
  ];
  home.username = "crispi";
  home.homeDirectory = pkgs.lib.mkForce "/home/crispi";
  home.stateVersion = "24.11";
  fonts.fontconfig.enable = true;
}
