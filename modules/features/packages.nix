{ self, inputs, ... }: {
    flake.nixosModules.morePackages = { pkgs, lib, ... }: {
        environment.systemPackages = with pkgs; [ 
            #VM
            virt-manager
            qemu
            libvirt

            #Graphics
            gimp
            blockbench

            # Internet
            discord
            syncthing
            telegram-desktop

            # Misc
            cbonsai
            cmatrix
            cowsay
            figlet
            pipes

            # Multimedia Management
            asunder # CD ripper
            calibre
            filebot
            handbrake
            krita
            makemkv
            mkvtoolnix
            mpv
            vlc
            yt-dlp 

            
            libaacs # Library to access AACS protected Blu-Ray disks 
            libbluray # library to access Blu-Ray disks for playback
            
            usbutils
            zoxide
        ];        
    };
}
