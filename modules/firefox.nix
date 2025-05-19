{ config, lib, ... }:
{

  stylix.targets.librewolf = {
    enable = true;
    profileNames = [
      "user"
    ];
    firefoxGnomeTheme.enable = true;
  };

  programs.librewolf = with config.lib.stylix.colors; {
    enable = true;
    settings = {
      "identity.fxaccounts.enabled" = true; # firefox sync
      "privacy.clearOnShutdown.history" = true;
      "privacy.clearOnShutdown.downloads" = true;
      "middlemouse.paste" = false;
      "general.autoScroll" = true;
      "general.smoothScroll" = true;
      "sidebar.revamp" = true;
      "sidebar.verticalTabs" = true;
      "sidebar.main.tools" = "history";
      "browser.gesture.swipe.left" = "";
      "browser.gesture.swipe.right" = "";
      "browser.tabs.firefox-view" = false;
      "browser.uidensity" = 1; # 1 is super compact mode
      "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
    };

    # profiles.user.extensions.force = true;
    profiles.user.userChrome = ''

      /* Disable elements  */
      #image.autoplay-media-icon,
      #context_moveTabOptions,
      #context_sendTabToDevice,
      #context_reopenInContainer,
      #context_selectAllTabs,
      #context_closeTabOptions,
      #tracking-protection-icon-container,
      #pageActionButton,
      #pageActionSeparator,
      #wrapper-firefox-view-button,
      #fxa-toolbar-menu-button,
      #translations-button,
      #reader-mode-button,
      .tab-secondary-label{
        display: none !important;
      }
      .bookmark-item .toolbarbutton-icon {
        display: none;
      }
    '';

    # NEW PAGE SETAP
    profiles.user.userContent = ''
         @-moz-document url("about:home"),url(about:preferences),url("about:blank"),url("about:newtab"),url("about:privatebrowsing"){
          body{background-color:#${base00}!important;--newtab-search-icon: transparent !important;}
      	}
    '';
  };
}
