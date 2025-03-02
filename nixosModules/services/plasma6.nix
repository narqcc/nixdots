{ lib, config, pkgs, ... }:
{
  services.xserver.enable = true;
  services.xserver.desktopManager.plasma6.enable = true;
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    plasma-browser-integration
    elisa
    khelpcenter
  ];
  services.xserver.displayManager.defaultSession = "plasma";
  services.xserver.displayManager.sddm.wayland.enable = true;
  environment.etc."xdg/user-dirs.defaults".text = ''
    DESKTOP=Desktop
    DOWNLOAD=Downloads
    TEMPLATES=Desktop/Resources/Templates
    PUBLICSHARE=Public
    DOCUMENTS=Desktop/Resources/Documents
    MUSIC=Desktop/Resources/Music
    PICTURES=Desktop/Resources/Pictures
    VIDEOS=Desktop/Resources/Video
  '';
}
