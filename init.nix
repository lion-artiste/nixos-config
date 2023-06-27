# File used to init the flakes 
{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      /etc/nixos/hardware-configuration.nix
    ];

  # omit the previous configuration.......

  # enable Flakes and the new command line tool
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  environment.systemPackages = with pkgs; [
    # Flakes uses git to pull dependencies from data sources, so git must be installed first
    git
    vim
    wget
    curl
    gnumake
  ];
}