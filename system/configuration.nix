{ config, pkgs, inputs, ... }:


# Configurations for System are in these files
{
  imports = [ 
    ./bluetooth.nix
    ./boot.nix
    ./catppuccin.nix
    #    ./flatpak.nix
    ./fonts.nix
    #    ./hard-drive.nix
    ./hardware-configuration.nix
    ./hyprland.nix
    ./keyring.nix
    ./network.nix
    #    ./nvidia.nix
    ./pkgs.nix
    #    ./river.nix
    ./sddm.nix
    ./ssh.nix
    ./user.nix
    #    ./wireguard.nix
  ];

  # Enable Flakes, nix CLI tool, and Cachix
  nix.settings = {
    substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
    experimental-features = [ "nix-command" "flakes" ];
  };

  # Set time zone
  time.timeZone = "America/Chicago";

  # Locale settings
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # X11 keymap
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # System state version (don’t touch this)
  system.stateVersion = "24.11";
}
