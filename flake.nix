{
    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    
        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        
        nixvim = {
            url = "github:nix-community/nixvim";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        noctalia = {
            url = "github:noctalia-dev/noctalia/cachix";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        
        swww.url = "github:LGFae/swww";
        
        wrapper-modules.url = "github:BirdeeHub/nix-wrapper-modules";
    };

    outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
        mkSystem = { hostname, system }:
            nixpkgs.lib.nixosSystem {
                inherit system;

                specialArgs = {
                    inherit inputs;
                };

                modules = [
                    # Common NixOS configuration
                    ./hosts/common/configuration.nix

                    # Host-specific configuration
                    ./hosts/${hostname}/configuration.nix


                    # Home Manager integration
                    home-manager.nixosModules.home-manager

                    {
                        home-manager = {
                            useGlobalPkgs = true;
                            useUserPackages = true;
                            extraSpecialArgs = { inherit inputs; };
                            users.rxsl = {
                                imports = [ 
                                    ./modules/home/default.nix
                                    inputs.noctalia.homeModules.default
                                ];
                            };
                        };
                    }
                ];
            };
    in
    {
        nixosConfigurations = {
            desktop = mkSystem {
                hostname = "desktop";
                system = "x86_64-linux";
            };

            framework = mkSystem {
                hostname = "framework";
                system = "x86_64-linux";
            };
        };
    };
}
