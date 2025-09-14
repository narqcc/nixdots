{
  imports = [
    ../../nixosModules/nixos.nix
    ../../nixosModules/nixpkgs-default.nix
    ../../nixosModules/hardware/efi-boot.nix
    ./srv.nix
    ./net.nix
    ./fs.nix
    ./hw.nix
    ../../users/narqcc
  ];
}
