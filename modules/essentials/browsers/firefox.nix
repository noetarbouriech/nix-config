{ config, lib, pkgs, ... }:

let
  # Mostly from privacytools.io
  privacy-settings = {
    "privacy.firstparty.isolate" = true;
    "privacy.donottrackheader.enabled" = true;
    "privacy.trakingprotection.enabled" = true;
    "privacy.trakingprotection.fingerprinting.enabled" = true;
    "privacy.trakingprotection.cryptomining.enabled" = true;
    "dom.event.clipboardevents.enabled" = false;
    "network.cookie.cookieBehaviour" = 1;
    "network.http.referer.XOriginPolicy" = 2;
    "beacon.enabled" = false;
    "browser.safebrowsing.downloads.remote.enabled" = false;
    "privacy.annotate_channels.strict_list.enabled" = true;
  };

  personal-settings = {
    "browser.newtabpage.activity-stream.section.highlights.includePocket" = false;
    "browser.startup.homepage" = "https://duckduckgo.com/";
    "browser.search.region" = "FR";
    "browser.urlbar.placeholderName" = "DuckDuckGo";
    "browser.uidensity" = 1;
    "layout.css.devPixelsPerPx" = "1.1";
  };

in
{
  programs.firefox = {
    enable = true;
    profiles.noe.settings = lib.mkMerge [ privacy-settings personal-settings ];

    extensions = with pkgs.nur.repos.rycee.firefox-addons; [
        # utilities
        vim-vixen
        stylus
        reddit-enhancement-suite
        old-reddit-redirect 
        bitwarden

        # privacy related
        https-everywhere
        ublock-origin
        localcdn
        i-dont-care-about-cookies
        clearurls
        cookie-autodelete
    ];
  };
}
