{ self, inputs, ... }: {
    flake.nixosModules.morePackages = { pkgs, lib, ... }: {
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
            pipes

            # Multimedia Management
            asunder # CD ripper
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
            pokemmo-installer
            (retroarch.withCores (cores: with cores; [
                snes9x
                mgba
                desmume
            ]))
                
            

            kdePackages.kcalc 

            libaacs # Library to access AACS protected Blu-Ray disks 
            libbluray # library to access Blu-Ray disks for playback

            pika-backup
            
            usbutils
            zoxide
        ];        
    };
}
