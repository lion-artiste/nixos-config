{ config, pkgs, ... }:

{
    # Nvidia drivers 
    services.xserver.videoDrivers = [ "nvidia" ];

    hardware = {
        nvidia = {
            package = config.boot.kernelPackages.nvidiaPackages.stable;
            modesetting.enable = true;
            open = true;
            nvidiaSettings = true;
        };

        opengl = {
            enable = true;
        };
    };
}