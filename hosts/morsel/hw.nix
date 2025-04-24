{
  nixpkgs.hostPlatform = "x86_64-linux";

  boot.initrd.availableKernelModules = [ "xhci_pci" "nvme" "ahci" "usb_storage" "uas" "sd_mod" ];
  boot.blacklistedKernelModules = [ "rtw88_8822ce" "btusb" ];
  boot.kernelModules = [ "kvm-amd" "r8169" ];
  boot.kernelParams = [ "elevator=none" "radeon.si_support=0" "amdgpu.si_support=1" ];

  hardware.cpu.amd.updateMicrocode = true;

  imports = [
    ../../nixosModules/hardware/laptop/lidswitchignore.nix
  ];
}
