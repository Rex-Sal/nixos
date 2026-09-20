{ self, inputs, ... }: {
    flake.nixosModules.syncthing = { lib, pkgs, ... }: {
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
        };
    };
}
