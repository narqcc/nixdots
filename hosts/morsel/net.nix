{
  imports = [
    ../../nixosModules/services/network/boot-no-wait.nix
  ];

  networking = {
    hostName = "morsel";
    hostId = "ee115be0";
    networkmanager.enable = true;
  };

  hostKeys = [{
    path = "/etc/ssh/ssh_host_rsa_key";
    type = "ed25519";
  }];
}
