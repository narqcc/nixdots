{ lib, pkgs, ... }:
{
  modules = [
    "${nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-graphical-gnome.nix"
    "${nixpkgs}/nixos/modules/installer/cd-dvd/channel.nix"
    inputs.self.nixosModules.common
  ];

  nixpkgs = {
     hostPlatform = lib.mkDefault "x86_64-linux";
  };

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    supportedFilesystems = lib.mkForce ["zfs" "btrfs" "reiserfs" "vfat" "f2fs" "xfs" "ntfs" "cifs"];
  };

  services = {
    qemuGuest.enable = true;
    openssh.settings.PermitRootLogin = lib.mkForce "yes";
  };

  users.extraUsers.root.password = "nixos";
}
