{}:
{
  imports = [
    ../../nixosModules/nixos
    ../../nixosModules/nixpkgs-default
    ../../nixosModules/hardware/efi-boot
    ./srv.nix
    ./net.nix
    ./fs.nix
    ./hw.nix
    ../../users/narqcc
  ];
}
