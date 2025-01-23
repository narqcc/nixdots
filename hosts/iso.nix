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
    openssh.authorizedKeys.keyFiles = [ "/persist/keystore/homes/nixos/id_nixos" ];
    hashedPassword = lib.strings.fileContents /persist/keystore/homes/nixos/pass_nixos;
    shell = pkgs.zsh;
    packages = with pkgs; [ ];
  };
  users.extraUsers.root.password = "nixos";

}
