pkgs: with pkgs; {
  packages = [ pkgs.cowsay pkgs.fortune pkgs.home-manager pkgs.nil ];
  shellHook = ''
           export FLAKE=$(pwd)
           export HISTFILE=$(pwd)/.bash_history
           echo "=========================="
           echo "dotfiles development shell"
           echo "=========================="
           cowsay "declare all the things!"
           echo "=========================="
           fortune
         '';
}
