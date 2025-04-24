{ pkgs, lib, config, ... }:
{
  imports = [
    ../../nixosModules/nixos.nix
    ../../nixosModules/nixpkgs-default.nix
    ../../nixosModules/services/efi-boot.nix
    ../../nixosModules/services/openssh.nix
    ../../nixosModules/services/plasma6.nix
    ./fs.nix
    ./hw.nix
    ./net.nix
    ../../users/narqcc
    ../../users/nannyjo
  ];

  time.timeZone = "America/New_York";
  i18n.defaultLocale = "en_US.UTF-8";
}
