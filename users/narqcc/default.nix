{
  users.users.narqcc = {
    isNormalUser = true;
    uid = 1337;
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.zsh;
    openssh.authorizedKeys.keyFiles = [ "/keystore/homes/narqcc/id_narqcc.pub" ];
    hashedPassword = lib.strings.fileContents /keystore/homes/narqcc/pass_narqcc;
    packages = with pkgs; [ zsh-completions nix-zsh-completions ];
  };
}
