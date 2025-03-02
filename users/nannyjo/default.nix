{
  users.users.nannyjo = {
    isNormalUser = true;
    uid = 1010;
    extraGroups = [ "networkmanager" ];
    shell = pkgs.zsh;
    initialPassword = "nixos";
    packages = with pkgs; [ zsh-completions nix-zsh-completions ];
  };
}
