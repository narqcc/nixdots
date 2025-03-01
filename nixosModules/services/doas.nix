{ pkgs }:
{
   ### replace sudo with doas
  environment.systemPackages = [ pkgs.doas-sudo-shim ];
  security.sudo.enable = false;
  security.doas.enable = true;
}
