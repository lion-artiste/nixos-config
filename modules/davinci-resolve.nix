{ config, pkgs, ... }:

{
  virtualisation = {
    podman = {
      enable = true;
      dockerCompat = true;
      enableNvidia = true;
    };
  };

  nixpkgs.config.permittedInsecurePackages = [
    "python-2.7.18.6"
  ]; # Current tweak for Davinci Resolve
}