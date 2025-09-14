{ lib, config, pkgs}:
{

  boot.supportedFilesystems = [ "zfs" "ntfs" ];
  boot.zfs.devNodes = "/dev/disk/by-label/sippet-os";
  boot.zfs.extraPools = [ ];
  boot.initrd.postDeviceCommands = lib.mkAfter ''
    zfs rollback -r sippet-os/ephemeral/slash@blank
  '';

  fileSystems."/" =
    { device = "sippet-os/ephemeral/slash";
      fsType = "zfs";
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/26A8-0C7E";
      fsType = "vfat";
    };

  fileSystems."/nix" =
    { device = "sippet-os/ephemeral/nix";
      fsType = "zfs";
    };

  fileSystems."/home" =
    { device = "sippet-os/ephemeral/home";
      fsType = "zfs";
    };

  fileSystems."/persist" =
    { device = "sippet-os/eternal/persist";
      fsType = "zfs";
    };

  zramSwap = {
    enable = true;
    swapDevices = 1;
  };

}
