{ ... }:
{
  
  boot = {
    # Disable systemd-boot
    loader.systemd-boot.enable = false;

    # Enable GRUB (change theme to custom theme)
    loader.grub = {
      enable = true;
      efiSupport = true;
      useOSProber = true;
      splashImage = "/home/crispi/.grubthemes/fallout-grub-theme/background.png";
      device = "nodev";
      theme = "/home/crispi/.grubthemes/fallout-grub-theme/";
      gfxmodeEfi = "1920x1080";
      gfxpayloadEfi = "keep";
      configurationLimit = 10;
          };


    loader.efi.canTouchEfiVariables = true;
    loader.timeout = 10;

    plymouth = {
      enable = true;
    };

    consoleLogLevel = 3;
    initrd.verbose = false;
    kernelParams = [
      "quiet"
      "splash"
    ];
  };
  catppuccin.plymouth.enable = true;
  catppuccin.plymouth.flavor = "mocha";
  # Catppuccin for SDDM (login screen)
  catppuccin.sddm = {
    enable = true;
    background = "/etc/.background";
    flavor = "mocha";
    loginBackground = true;
    font = "JetBrainsMonoNL Nerd Font Propo";
  };
}
