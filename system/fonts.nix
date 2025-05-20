{ pkgs, ... }:
{
  # Fonts
  fonts.packages = with pkgs.nerd-fonts; [
    jetbrains-mono
    monofur
  ];

  fonts.fontconfig.enable = true;
}
