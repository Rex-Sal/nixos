{ self, inputs, ... }: {

flake.nixosModules.brave = { pkgs, lib, ... }: {
        programs.chromium = {
            enable = true;
            
            defaultSearchProviderEnabled = true;
            defaultSearchProviderSearchURL = "https://kagi.com/search?q={searchTerms}";
            defaultSearchProviderSuggestURL = "https://kagi.com/api/v0/search/suggestions?q={searchTerms}";
            #homepageLocation = "";
            extensions = [
                "ddkjiahejlhfcafbddmgiahcphecmpfh" # Ublock Origin Lite
                "kbmfpngjjgdllneeigpgjifpgocmfgmb" # Reddit Enhancement Suite
                "dneaehbmnbhcippjikoajpoabadpodje" # Old Reddit Redirect
                "eimadpbcbfnmbkopoojfekhnkhdbieeh" # Dark Reader
                "khncfooichmfjbepaaaebmommgaepoid" # Unhook Youtube
                "mobpimjmmonkghndllikpdgpapkfckje" # Get Clean URL 
                "nffhjilgaekcabipkpjkfnkmdacnnink" # Animal Crossing Radio
                "nngceckbapebfimnlniiiahkandclblb" # Bitwarden Password Manager
            ];
        }; 

    };
}
