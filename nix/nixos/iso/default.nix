{
  system = "x86_64-linux";
  modules = [
    ./configuration.nix
    {
      networking.hostId = "11111111";
      system.stateVersion = "24.11";
    }
  ];
}
