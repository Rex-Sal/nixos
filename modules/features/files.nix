{ self, inputs, ... }: {
    flake.nixosModules.files = { pkgs, lib, ... }: {
        services.gvfs.enable = true;
        services.udisks2.enable = true;
    };
}
