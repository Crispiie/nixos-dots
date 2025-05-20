{ ... }:
{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      source ~/.config/fish/config.fish.bak
    '';
  };
}
