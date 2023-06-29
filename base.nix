{ config, pkgs, lib, ... }:

{
    imports =
        [ # Include the results of the hardware scan.
            ./hardware-configuration.nix
        ];

    # Bootloader.
    boot = {
        loader = {
            systemd-boot = {
                enable = true;
                configurationLimit = 5;
            };
            efi.canTouchEfiVariables = true;
        };

        #kernelPackages = pkgs.linuxPackages_latest;
        kernelParams = lib.mkDefault [ "quiet" "splash" ];
    };

    nix = {
        settings = {
            auto-optimise-store = true;
        };

        gc = {
            automatic = true;
            dates = "weekly";
            options = "--delete-older-than 1w";
        };
    };

    networking = {
        networkmanager.enable = true;
        hostName = lib.mkDefault "nixos";
    };

    nixpkgs.config.allowUnfree = lib.mkDefault true;

    # Set your time zone.
    time.timeZone = "Europe/Paris";

    # Select internationalisation properties.
    i18n = {
        defaultLocale = "fr_FR.UTF-8";
        extraLocaleSettings = {
            LC_ADDRESS = "fr_FR.UTF-8";
            LC_IDENTIFICATION = "fr_FR.UTF-8";
            LC_MEASUREMENT = "fr_FR.UTF-8";
            LC_MONETARY = "fr_FR.UTF-8";
            LC_NAME = "fr_FR.UTF-8";
            LC_NUMERIC = "fr_FR.UTF-8";
            LC_PAPER = "fr_FR.UTF-8";
            LC_TELEPHONE = "fr_FR.UTF-8";
            LC_TIME = "fr_FR.UTF-8";
        };
    };

    # Enable the X11 windowing system.
    services.xserver = {
        enable = lib.mkDefault true;
        layout = "fr";
        xkbVariant = "";
    };

    environment.sessionVariables = {
        NIXOS_OZONE_WL = "1";
    };

    # Configure console keymap
    console.keyMap = "fr";

    # Enable CUPS to print documents.
    services.printing.enable = true;

    # enable Flakes and the new command line tool
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    services.flatpak.enable = true;

    # Enable sound with pipewire.
    sound.enable = true;
    hardware.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
        jack.enable = true;
        wireplumber.enable = true;
    };

    # Global utility packages
    environment.systemPackages = with pkgs; [
        # Flakes uses git to pull dependencies from data sources, so git must be installed first
        git
        vim
        wget
        curl
        neofetch
        gnumake
    ];

    system.stateVersion = "23.05"; # Did you read the comment?
}
