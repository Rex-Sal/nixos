{ pkgs, lib, inputs, ... }: 
let
    xwayland-satellite-packages = pkgs.xwayland-satellite.overrideAttrs (old: rec {
        version = "0.8.1";

        src = pkgs.fetchFromGitHub {
          owner = "Supreeeme";
          repo = "xwayland-satellite";
          rev = "536bd32"; # full hash or "v0.8.1" is safer
          hash = "sha256-BUE41HjLIGPjq3U8VXPjf8asH8GaMI7FYdgrIHKFMXA=";
        };

        cargoDeps = pkgs.rustPlatform.fetchCargoVendor {
          inherit (old) pname;
          inherit version src;
          hash = "sha256-16L6gsvze+m7XCJlOA1lsPNELE3D364ef2FTdkh0rVY=";
        };
    });
in
{
    environment.systemPackages = with pkgs; [ 

        #VM
        virt-manager
        qemu
        libvirt
        #------------------------------------
        #Art and Graphics
        blender
        blockbench
        gimp
        krita
        #------------------------------------
        # Internet Services
        ivpn
        ivpn-ui
        ivpn-service
        vesktop
        syncthing
        telegram-desktop
        qbittorrent
        #------------------------------------
        # Multimedia Development/Management
        asunder # CD ripper
        audacity
        davinci-resolve
        calibre
        easyeffects
        filebot
        handbrake
        kdePackages.k3b
        loupe
        makemkv
        mkvtoolnix
        mpv
        picard
        vlc
        yt-dlp 
        #------------------------------------
        #Games
        prismlauncher
        godot
        gzdoom
        #pokemmo
        (retroarch.withCores (cores: with cores; [
            snes9x
            mgba
            desmume
        ]))
        #------------------------------------
        # Misc
        cbonsai
        cmatrix
        cowsay
        figlet
        hyfetch
        pipes

        xwayland-satellite-packages

        alacritty            
        inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
        kdePackages.kcalc 
        libaacs # Library to access AACS protected Blu-Ray disks 
        libbluray # library to access Blu-Ray disks for playback
        pika-backup 
        usbutils
        nautilus
        zoxide
    ];        
}
