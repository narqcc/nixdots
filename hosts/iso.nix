{ pkgs, lib, config, ... }:
{
  imports = [
    ../nixosModules/nixos.nix
  ];

  services = {
    qemuGuest.enable = true;
    openssh.settings.PermitRootLogin = lib.mkForce "yes";
  };

  networking.hostName = "nixos";
  users.users.nixos = {
    isNormalUser = true;
    uid = 1117;
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.zsh;
    password = "nixos";
    packages = with pkgs; [ ];
  };
  users.extraUsers.root.password = "nixos";

}
