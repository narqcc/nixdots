{
  imports = [
    ../../nixosModules/services/network/boot-no-wait.nix
  ];

  networking = {
    hostName = "morsel";
    hostId = "ee115be0";
    networkmanager.enable = true;
  };
}
