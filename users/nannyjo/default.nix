{
  users.users.nannyjo = {
    isNormalUser = true;
    uid = 1010;
    extraGroups = [ "networkmanager" ];
    shell = pkgs.zsh;
    openssh.authorizedKeys.keyFiles = [ "/keystore/homes/nannyjo/id_nannyjo.pub" ];
    hashedPassword = lib.strings.fileContents /keystore/homes/nannyjo/pass_nannyjo;
    packages = with pkgs; [ zsh-completions nix-zsh-completions ];
  };
}
