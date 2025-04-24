{ lib, pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;
  environment.defaultPackages = lib.mkForce [];
  environment.systemPackages = with pkgs; [
    # Terminal Tools
    tmux
    screen
    mc
    # File Tools
    file
    lsof
    which
    xz
    lz4
    zstd
    zip
    unzip
    wget
    curl
    rsync
    git
    ripgrep
    # Performance Monitors
    acpi
    htop
    iotop
    iftop
    btop
    procs
    # Crypto Tools
    age
    pinentry
    pinentry-curses
    cryptsetup
  ];
}
