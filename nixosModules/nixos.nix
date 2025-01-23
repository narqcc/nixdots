{
  system.stateVersion = "24.11";
  nix = {
    settings = {
      experimental-features = ["nix-command" "flakes"];
      auto-optimise-store = true;
    };
    extraOptions = "experimental-features = nix-command flakes";
  };
}
