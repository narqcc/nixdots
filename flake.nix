{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
    mkflake.url = "github:jonascarpay/mkflake";
    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, mkflake, disko, self }: mkflake.lib.mkflake {
    topLevel = {
      nixosConfigurations = {
        iso = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
          "${nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-graphical-gnome.nix"
          "${nixpkgs}/nixos/modules/installer/cd-dvd/channel.nix"
          ./hosts/iso.nix
          ];
        };
        sippet = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./sippet
          ];
        };
        morsel = nixpkgs.lib.nixosSystem {
          modules = [
            ./morsel
            disko.nixosModules.disko
          ];
        };
        dram = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./dram
          ];
        };
        crumb = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./crumb
          ];
        };
      };
    };
    perSystem = system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        devShells.default = pkgs.mkShell {
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
        };
      };
  };
}
