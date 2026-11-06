{ pkgs, lib, inputs, ... }: {
    environment.systemPackages = with pkgs; [ 
        #VM
        virt-manager
        qemu
        libvirt

        #Graphics
        blender
        blockbench
        gimp
        krita

        # Internet
        ivpn
        ivpn-ui
        ivpn-service
        vesktop
        syncthing
        telegram-desktop
        qbittorrent

        # Misc
        cbonsai
        cmatrix
        cowsay
        figlet
        hyfetch
        pipes

        # Multimedia Management
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

        #Games
        prismlauncher
        godot
        gzdoom
        pokemmo
        (retroarch.withCores (cores: with cores; [
            snes9x
            mgba
            desmume
        ]))
            
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
