{ self, inputs, ... }: {
	flake.nixosModules.desktopConfiguration = { pkgs, lib, ... }: {
        
        environment.sessionVariables.FLAKE_PROFILE = "desktop";

        services.syncthing = {
            enable = true;
            user = "rxsl";
            group = "users";
            dataDir = "/home/rxsl/Sync";
            configDir = "/home/rxsl/.config/syncthing";
            openDefaultPorts = true;
            devices = {
                "UGREEN" = { id = "O5FHK5M-UYNMX76-E42K7YL-6GRBN63-QCW4H5E-MGCQ4Q4-NOU3SM3-C2RVPQD"; };
            };

            folders = {
                "2rf7r-vtqv6" = {
                    label = "Obsidian";
                    path = "/home/rxsl/Documents/Obsidian/";
                    devices = [ "UGREEN" ];
                };
                "62y9y-emh5o" = {
                    label = "Music";
                    path = "/home/rxsl/Music/";
                    devices = [ "UGREEN" ];
                };
                "bfpex-9qy55" = {
                    label = "Camera";
                    path = "/home/rxsl/Pictures/Phone/";
                    devices = [ "UGREEN" ];
                };
                "fkexm-gl2he" = {
                    label = "Desktop Files";
                    path = "/home/rxsl/Documents/Sync/";
                    devices = [ "UGREEN" ];
                };
                "pvq6x-bqxeh" = {
                    label = "Books";
                    path = "/home/rxsl/Books/";
                    devices = [ "UGREEN" ];
                }; 
            };
        };

    };
}
