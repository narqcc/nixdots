{ config, options, pkgs, lib, inputs, hostname, ... }:
let
  inherit (inputs) self;
  inherit (builtins) mapAttrs;
in
{
  imports = [];

  nix = {
    registry = mapAttrs (_: v: { flake = v; }) inputs;
    nixPath =
      lib.mapAttrsToList (k: v: "${k}=${v.to.path}") config.nix.registry;
    settings = {
      experimental-features = "nix-command flakes ca-derivations";
      allowed-users = [ "@wheel" ];
      auto-optimise-store = true;
    };
  };

  nixpkgs.config.allowUnfree = true;

  time.timeZone = "America/New_York";
  i18n.defaultLocale = "en_US.UTF-8";

  ### empty default packages
  environment.defaultPackages = lib.mkForce [];
  environment.systemPackages = with pkgs; [
    # Terminal Tools
    tmux
    screen
    mc
    doas-sudo-shim
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

  ### replace sudo with doas
  security.sudo.enable = false;
  security.doas.enable = true;

  ### nh - nixos-* cli wrapper
  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
  };

  ### Documentation
  documentation.enable = true;
  documentation.nixos.enable = false;
  documentation.man.enable = true;
  documentation.info.enable = false;
  documentation.doc.enable = false;

  ### User
  users = {
    mutableUsers = false;
    users.narqcc = {
      isNormalUser = true;
      description = "";
      extraGroups = [ "wheel" "networkmanager" ];
      uid = 1337;
      hashedPasswordFile = "/persist/keystore/users/narqcc/passhash";
    };
  };
}
