{ lib, config, pkgs, ...}:
{
  imports = [
    ../../nixosModules/services/network/boot-no-wait.nix
  ];

  networking = {
    hostName = "sippet";
    hostId = "3f871983";
    networkmanager.enable = false;
    networkmanager.unmanaged = [ "wlp3s0" ];
    firewall.allowedUDPPorts = [ ];
    firewall.allowedTCPPorts = [ 53 80 443 ]; # dns http/s
    firewall.checkReversePath = "loose";
    nat = {
      enable = true;
      internalInterfaces = [ "enp2s0" ];
      externalInterface = "";
    };
  };

  boot = {
    initrd = {
      network = {
        enable = true;
        ssh = {
          enable = true;
          hostKeys = [ /keystore/hosts/sippet/id_sippet_init ];
          authorizedKeys = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJmo4gVcs6I/wmpjURsZNVo63/nRfdp80rZv4wxg8Y2y" ];
          port = 2223;
        };
        udhcpc.extraArgs = [ "-t 10" ];
      };
      kernelModules = [ "amdgpu" "r8169" ];
    };
    kernel.sysctl = { "net.ipv4.ip_forward" = 1; };
  };  
}
