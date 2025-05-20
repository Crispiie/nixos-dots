{ pkgs, ... }:
{
  home.packages = with pkgs; [
    cava
    discord
    obsidian
    ani-cli
    mpv
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
    bat
  ];

  programs.firefox.enable = true;
  programs.home-manager.enable = true;

}
