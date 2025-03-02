{
  services.openssh = {
    enable = true;
    settings = {
      # Harden
      PasswordAuthentication = false;
      PermitRootLogin = "no";
      GatewayPorts = "clientspecified";
    };
    # Automatically remove stale sockets
    extraConfig = ''
      StreamLocalBindUnlink yes
    '';
  };
  # Passwordless sudo when SSH'ing with keys
  security.pam.sshAgentAuth.enable = true;
}
