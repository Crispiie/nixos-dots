{ pkgs, ... }:
{
  home.packages = with pkgs; [
    cava
    tree
    kitty
    discord
    obsidian
    ani-cli
    mpv
    bat
    spotify-player
    nextcloud-client
    tmux
    lazygit
    parsec-bin
    prismlauncher
    bash-completion
    cool-retro-term
    qutebrowser
    zathura
  ];

  programs.home-manager.enable = true;

}
