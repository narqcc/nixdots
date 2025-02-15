{ pkgs, lib, ... }:
{
  imports = [
    ../nixosModules/nixos.nix
  ];

  services = {
    qemuGuest.enable = true;
    openssh.settings.PermitRootLogin = lib.mkForce "yes";
  };

  programs.zsh.enable = true;

  networking.hostName = "nixos";
  users.users.nixos = {
    isNormalUser = true;
    uid = 1117;
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.zsh;
    initialPassword = "nixos";
    packages = with pkgs; [ zsh-completions nix-zsh-completions ];
  };
  users.extraUsers.root.openssh.authorizedKeys.keys = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGLXoO7W7xOvMBZodJzigyTvak1dguwc91VpJfjoZAUj RECOVERY 02/08/2025";

}
