{ pkgs, config, ... }: {

  programs.firefox = {
    enable = true;
    package = pkgs.wrapFirefox pkgs.firefox-unwrapped {
      extraPolicies = {
        CaptivePortal = false;
        DisableFirefoxStudies = true;
        DisablePocket = true;
        DisableTelemetry = true;
        DisableFirefoxAccounts = false;
        NoDefaultBookmarks = true;
        OfferToSaveLogins = true;
        OfferToSaveLoginsDefault = true;
        PasswordManagerEnabled = true;
        FirefoxHome = {
          Search = true;
          Pocket = false;
          Snippets = false;
          TopSites = false;
          Highlights = false;
        };
        UserMessaging = {
          ExtensionRecommendations = false;
          SkipOnboarding = true;
        };

        # Set preferences shared by all profiles.
        Preferences = {
          "browser.contentblocking.category" = { Value = "strict"; };
          "extensions.pocket.enabled" = "lock-false";
          "extensions.screenshots.disabled" = "lock-true";
        };

      };
    };

    profiles.user = { settings = { "general.smoothScroll" = true; }; };
    profiles.user.extraConfig = ''
      user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);
      user_pref("layers.acceleration.force-enabled", true);
      user_pref("gfx.webrender.all", true);
      user_pref("gfx.webrender.enabled", true);
      user_pref("layout.css.backdrop-filter.enabled", true);
      user_pref("svg.context-properties.content.enabled", true);
      use$r_pref("browser.compactmode.show", true);
      user_pref("browser.tabs.firefox-view", false);
      user_pref("svg.context-properties.content.enabled", true);
    '';

    profiles.user.userChrome = ''
      /* 
      ┌─┐┬┌┬┐┌─┐┬  ┌─┐
      └─┐││││├─┘│  ├┤ 
      └─┘┴┴ ┴┴  ┴─┘└─┘
      ┌─┐┌─┐─┐ ┬      
      ├┤ │ │┌┴┬┘      
      └  └─┘┴ └─

      by Miguel Avila

      */

      /*
       
      ┌─┐┌─┐┌┐┌┌─┐┬┌─┐┬ ┬┬─┐┌─┐┌┬┐┬┌─┐┌┐┌
      │  │ ││││├┤ ││ ┬│ │├┬┘├─┤ │ ││ ││││
      └─┘└─┘┘└┘└  ┴└─┘└─┘┴└─┴ ┴ ┴ ┴└─┘┘└┘

      */

      :root {
      /* there's a window color and a tabs / urlbar color.
        --sfwindow: #19171a;
        --sfsecondary: #201e21;
      */
      }

      /* Urlbar View */

      /*─────────────────────────────*/
      /* Comment this section if you */
      /* want to show the URL Bar    */
      /*─────────────────────────────*/

      .urlbarView {
        display: none !important;
      }

      /*─────────────────────────────*/

      /* 
      ┌─┐┌─┐┬  ┌─┐┬─┐┌─┐
      │  │ ││  │ │├┬┘└─┐
      └─┘└─┘┴─┘└─┘┴└─└─┘ 
      */

      /* Tabs `s  */
      #tabbrowser-tabs:not([movingtab])
        > #tabbrowser-arrowscrollbox
        > .tabbrowser-tab
        > .tab-stack
        > .tab-background[multiselected='true'],
      #tabbrowser-tabs:not([movingtab])
        > #tabbrowser-arrowscrollbox
        > .tabbrowser-tab
        > .tab-stack
        > .tab-background[selected='true'] {
        background-image: none !important;
        background-color: var(--toolbar-bgcolor) !important;
      }

      /* Inactive tabs color */
      #navigator-toolbox {
        background-color: var(--sfwindow) !important;
      }

      /* Window colors  */
      :root {
        --toolbar-bgcolor: var(--sfsecondary) !important;
        --tabs-border-color: var(--sfsecondary) !important;
        --lwt-sidebar-background-color: var(--sfwindow) !important;
        --lwt-toolbar-field-focus: var(--sfsecondary) !important;
      }

      /* Sidebar color  */
      #sidebar-box,
      .sidebar-placesTree {
        background-color: var(--sfwindow) !important;
      }

      /* 

      ┌┬┐┌─┐┬  ┌─┐┌┬┐┌─┐            
       ││├┤ │  ├┤  │ ├┤             
      ─┴┘└─┘┴─┘└─┘ ┴ └─┘            
      ┌─┐┌─┐┌┬┐┌─┐┌─┐┌┐┌┌─┐┌┐┌┌┬┐┌─┐
      │  │ ││││├─┘│ ││││├┤ │││ │ └─┐
      └─┘└─┘┴ ┴┴  └─┘┘└┘└─┘┘└┘ ┴ └─┘

      */

      #page-action-buttons {
        display: none;
      }
       

      /* Tabs elements  */
      .tab-close-button {
        /* make it transparent */
        opacity: 0;
        transition: 0.5s;
        border-radius: 50%;
      }

      .tab-close-button:hover {
        /* make it transparent */
        opacity: 100;
        transition: 0.5s;
      }


      .tabbrowser-tab:not([pinned]) .tab-icon-image {
        opacity: 0 !important;
        transition: 0.5s !important;
        width: 0px !important;
      }

      .tabbrowser-tab:not([pinned]):hover .tab-icon-image {
        opacity: 100 !important;
        transition: 0.5s !important;
        display: inline-block !important;
      }

      .tabbrowser-tab:not([pinned]):hover .tab-icon-image {
        width: 16px !important;
      }

      #nav-bar:not([tabs-hidden='true']) {
        box-shadow: none;
      }

      #tabbrowser-tabs[haspinnedtabs]:not([positionpinnedtabs])
        > #tabbrowser-arrowscrollbox
        > .tabbrowser-tab[first-visible-unpinned-tab] {
        margin-inline-start: 0 !important;
      }

      :root {
        --toolbarbutton-border-radius: 0 !important;
        --tab-border-radius: 0 !important;
        --tab-block-margin: 0 !important;
      }

      .tab-background {
        border-right: 0px solid rgba(0, 0, 0, 0) !important;
        margin-left: -4px !important;
      }

      .tabbrowser-tab:is([visuallyselected='true'], [multiselected])
        > .tab-stack
        > .tab-background {
        box-shadow: none !important;
      }

      .tabbrowser-tab[last-visible-tab='true'] {
        padding-inline-end: 0 !important;
      }

      #tabs-newtab-button {
        padding-left: 0 !important;
      }

      /* Url Bar  */
      #urlbar-input-container {
        background-color: var(--sfsecondary) !important;
        border: 1px solid rgba(0, 0, 0, 0) !important;
      }

      #urlbar-container {
        margin-left: 0 !important;
      }

      #urlbar[focused='true'] > #urlbar-background {
        box-shadow: none !important;
      }

      #navigator-toolbox {
        border: none !important;
      }

      /* Bookmarks bar  */
      .bookmark-item .toolbarbutton-icon {
        display: none;
      }
      toolbarbutton.bookmark-item:not(.subviewbutton) {
        min-width: 1.6em;
      }

      /* Toolbar  */
      #tracking-protection-icon-container,
      #urlbar-zoom-button,
      #star-button-box,
      #pageActionButton,
      #pageActionSeparator,
      #tabs-newtab-button,
      #back-button,
      #PanelUI-button,
      #forward-button,
      .tab-secondary-label {
        display: none !important;
      }

      .urlbarView-url {
        color: #dedede !important;
      }

      /* Disable elements  */
      #context-navigation,
      #context-savepage,
      #context-pocket,
      #context-sendpagetodevice,
      #context-selectall,
      #context-viewsource,
      #context-inspect-a11y,
      #context-sendlinktodevice,
      #context-openlinkinusercontext-menu,
      #context-bookmarklink,
      #context-savelink,
      #context-savelinktopocket,
      #context-sendlinktodevice,
      #context-searchselect,
      #context-sendimage,
      #context-print-selection {
        display: none !important;
      }

      #context_bookmarkTab,
      #context_moveTabOptions,
      #context_sendTabToDevice,
      #context_reopenInContainer,
      #context_selectAllTabs,
      #context_closeTabOptions {
        display: none !important;
      }

      /*
      ┬┌─┐┌─┐┌┐┌┌─┐
      ││  │ ││││└─┐
      ┴└─┘└─┘┘└┘└─┘
      Icons from Feather Icons
      https://feathericons.com/

      .titlebar-min {
      }
      .titlebar-max {
      }
      .titlebar-restore {
      }
      .titlebar-close {
      }
      .titlebar-close:hover {
      }
      #reload-button {
      }
      #identity-box[pageproxystate="valid"].verifiedDomain #identity-icon, #identity-box[pageproxystate="valid"].mixedActiveBlocked #identity-icon {
      }
      #tabs-newtab-button, #TabsToolbar #new-tab-button {
      }
      #alltabs-button {
      }
      #permissions-granted-icon {
      }
    '';

    profiles.user.userContent = ''
      /* 
      ┌─┐┬┌┬┐┌─┐┬  ┌─┐
      └─┐││││├─┘│  ├┤ 
      └─┘┴┴ ┴┴  ┴─┘└─┘
      ┌─┐┌─┐─┐ ┬      
      ├┤ │ │┌┴┬┘      
      └  └─┘┴ └─

      by Miguel Avila

      */

      :root {
        scrollbar-width: none !important;
      }

      @-moz-document url(about:privatebrowsing) {
        :root {
          scrollbar-width: none !important;
        }
      }
    '';
  };
}
