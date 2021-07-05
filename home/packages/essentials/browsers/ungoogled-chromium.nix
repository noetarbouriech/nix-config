{ pkgs, ... }:

{
  programs.chromium = {
    enable = true;
    package = pkgs.ungoogled-chromium; # use ungoogled-chromium instead of vanilla chromium

    extensions = [
      { id = "gcbommkclmclpchllfjekcdonpmejbdp"; } # HTTPS Everywhere
      { id = "cjpalhdlnbpafiamejdnhcphjbkeiagm"; } # uBlock Origin
      { id = "lckanjgmijmafbedllaakclkaicjfmnk"; } # ClearURLs
      { id = "ekhagklcjbdpajgpjgmbionohlpdbjgc"; } # Zotero
      { id = "bkdgflcldnnnapblkhphbgpggdiikppg"; } # DuckDuckGo
    ];

  };

}
