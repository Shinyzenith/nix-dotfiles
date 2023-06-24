{ config, pkgs, ... }:

{
  programs = {
    chromium = {
      enable = true;
      commandLineArgs = [
        "--enable-features=UseOzonePlatform"
        "--ozone-platform=wayland"
        "--ignore-gpu-blocklist"
        "--enable-gpu-rasterization"
        "--enable-zero-copy"
      ];
      extensions = [
        { id = "nngceckbapebfimnlniiiahkandclblb"; } # Bitwarden
        { id = "ponfpcnoihfmfllpaingbgckeeldkhle"; } # Enhancer for youtube
        { id = "dbepggeogbaibhgnhhndojpepiihcmeb"; } # Vimium
        { id = "gebbhagfogifgggkldgodflihgfeippi"; } # Return youtube dislike
        { id = "mnjggcdmjocbbbhaepdhchncahnbgone"; } # Sponsorblock
        { id = "cjpalhdlnbpafiamejdnhcphjbkeiagm"; } # Ublock Origin
        { id = "icpgjfneehieebagbmdbhnlpiopdcmna"; } # NewTab redirect
        { id = "eimadpbcbfnmbkopoojfekhnkhdbieeh"; } # Dark Reader
      ];
    };
  };
}
