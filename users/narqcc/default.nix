{
  users.users.narqcc = {
    isNormalUser = true;
    uid = 1337;
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.zsh;
    initialPassword = "nixos";
    packages = with pkgs; [ zsh-completions nix-zsh-completions ];
  };
}
