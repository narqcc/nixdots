pkgs: with pkgs; {
  packages = [ pkgs.cowsay pkgs.fortune pkgs.home-manager pkgs.nil ];
  shellHook = ''
           export FLAKE=$(pwd)
           echo
           echo
           echo "=========================="
           echo "dotfiles development shell"
           echo "=========================="
           cowsay "declare all the things!"
           echo "=========================="
           fortune
         '';
}
