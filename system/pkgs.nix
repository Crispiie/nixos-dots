{ pkgs, ... }:
{
   # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable Fish shell System Wide
  programs.fish.enable = true;

  # Steam
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  };

  # Enables DRM content for qutebrowser
  nixpkgs.overlays = [
    (final: prev: {
      qutebrowser = prev.qutebrowser.override { enableWideVine = true; };
    })
  ];

  environment = {
    systemPackages = with pkgs; [
      neovim # CLI Text Editor
      nautilus
      fastfetch # System Info
      feh # Image Viewer
      efibootmgr # Bootloader Manager
      dunst # Notifications
      wl-clipboard # Wayland Clipboard
      xclip # X11 Clipboard
      grim # Screenshots
      slurp # Screenshots
      kitty # Terminal
      rofi # Application Launcher
      yazi # CLI File Manager
      fzf # CLI Fuzzy Finder
      fd # CLI File Finder
      swww # Wallpapers
      unzip # Unzip
      wget # Download from CLI
      curl # Download from CLI
      gcc # C and C++ Compiler
      lua # Lua Compiler
      clang # C Compiler
      clang-tools # C Compiler
      git # It's Git
      p7zip # 7z file
      gnome-software # GUI for Flatpak
      appimage-run # Allows App Images to Run
      nodejs
      wireguard-tools
      pavucontrol # Audio GUI
      iwgtk # Networking GUI
      playerctl # media
      nodePackages.bash-language-server
      dict # 🆕 Add this line
      (pkgs.btop.override {
        cudaSupport = true;
      })
      (python3.withPackages (ps: with ps; [
        pip 
        setuptools 
        wheel
      ])) # Python/pip3
    ];

    etc."dict.conf".text = ''
      server dict.org
    '';
  };
}
