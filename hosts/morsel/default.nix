{
  imports = [
    ../../nixosModules/nixos.nix
    ../../nixosModules/nixpkgs.nix
    ../../nixosModules/services/efi-boot.nix
    ../../nixosModules/services/openssh.nix
    ../../nixosModules/services/plasma6.nix
    ./fs.nix
    ./hw.nix
    ./net.nix
  ];
}
