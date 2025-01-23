{ pkgs, lib, ... }:
{
  imports = [
    ../nixosModules/nixos.nix
  ];

  services = {
    qemuGuest.enable = true;
    openssh.settings.PermitRootLogin = lib.mkForce "yes";
  };

  networking.hostName = "nixos";
  home = {
    username = lib.mkDefault "nixos";
    homeDirectory = lib.mkDefault "/home/${config.home.username}";
  };

  users.extraUsers.root.password = "nixos";

}
