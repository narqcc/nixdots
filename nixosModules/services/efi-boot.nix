{
  ### BOOTLOADER
  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  # Quiet boot
  boot.consoleLogLevel = 0;
  boot.initrd.verbose = false;
  # Console
  console = {
    font = "sun12x22";
    earlySetup = true;
  };
}
