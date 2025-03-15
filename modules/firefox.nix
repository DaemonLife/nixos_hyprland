{ pkgs, config, ... }: {

  programs.librewolf = with config.lib.stylix.colors; {
    enable = true;
    # package = pkgs.wrapFirefox pkgs.firefox-unwrapped {
    #   extraPolicies = {
    #     CaptivePortal = false;
    #     DisableFirefoxStudies = true;
    #     DisablePocket = true;
    #     DisableTelemetry = true;
    #     DisableFirefoxAccounts = false;
    #     NoDefaultBookmarks = true;
    #     OfferToSaveLogins = true;
    #     OfferToSaveLoginsDefault = true;
    #     PasswordManagerEnabled = true;
    #     FirefoxHome = {
    #       Search = true;
    #       Pocket = false;
    #       Snippets = false;
    #       TopSites = false;
    #       Highlights = false;
    #     };
    #     UserMessaging = {
    #       ExtensionRecommendations = false;
    #       SkipOnboarding = true;
    #     };

    #     # Set preferences shared by all profiles.
    #     Preferences = {
    #       "browser.contentblocking.category" = { Value = "strict"; };
    #       "browser.gesture.swipe.left" = "";
    #       "browser.gesture.swipe.right" = "";
    #       "extensions.pocket.enabled" = "lock-false";
    #       "extensions.screenshots.disabled" = "lock-true";
    #     };

    #   };
    # };

    profiles.user = { settings = { "general.smoothScroll" = true; }; };

    profiles.user.extraConfig = ''
          user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);
          user_pref("layers.acceleration.force-enabled
      ", true);
          user_pref("gfx.webrender.all", true);
          user_pref("gfx.webrender.enabled", true);
          user_pref("layout.css.backdrop-filter.enabled", true);
          user_pref("svg.context-properties.content.enabled", true);
          user_pref("browser.compactmode.show", true);
          user_pref("browser.tabs.firefox-view", false);
          user_pref("svg.context-properties.content.enabled", true);
    '';

    profiles.user.userChrome = ''
      :root {
        --sfwindow: #${base00};
        --sfsecondary: #${base01};
        --toolbarbutton-border-radius: 4px !important;
      }

      /* Tabs */
      .tabbrowser-tab[selected="true"] .tab-background {
        background: #${base02} none !important;
      }

      .tab-content {
      }
      .tab-content[selected=""] {
      }
      .tab-close-button {
      }

      .tabbrowser-tab:not([selected="true"]) {
      	color: #${base05} !important; /*for unselected tabs*/
      }

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
        background-color: var(--sfsecondary) !important;
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

      /* hover card e/* 
      REMOVED ELEMENTS
      */

      #page-action-buttons {
        display: true;
      }

      /* Tabs elements  */
      .tab-close-button {
      /* make it transparent */
        opacity: 0;
        border-radius: 4px !important;
      }

      #tabs-newtab-button, #new-tab-button {
          background-color: #${base00} !important;
          border-radius: 4px !important;
      }

      #tabs-newtab-button:hover, #new-tab-button:hover {
        background-color: #${base0B} !important; /* Цвет фона при наведении */
        color: #${base01} !important; /* Цвет текста при наведении */
        opacity: 100 !important;
      }

      /* make tab close button instantly show up  */
      .tabbrowser-tab:not([pinned]):hover .tab-close-button {
        opacity: 100 !important;
      }
      .tabbrowser-tab .tab-close-button {
        border-radius: 5px !important;
      }

      /* remove website icons in tabs  */
      .tabbrowser-tab .tab-icon-image {
        /* display: none !important; */
      }

      .tab-icon-overlay {
        display:none !important;
      }

      #nav-bar:not([tabs-hidden='true']) {
        box-shadow: none;
      }
      #nav-bar {
      }

      #tabbrowser-tabs[haspinnedtabs]:not([positionpinnedtabs])
        > #tabbrowser-arrowscrollbox
        > .tabbrowser-tab[first-visible-unpinned-tab] {
      }

      :root {
        --toolbarbutton-border-radius: 0px !important;
        --toolbar-field-focus-border-color: transparent !important;
      }

      .tabbrowser-tab:is([visuallyselected='true'], [multiselected])
        > .tab-stack
        > .tab-background {
        box-shadow: none !important;
      }

      .tabbrowser-tab[last-visible-tab='true'] {
      }

      #tabs-newtab-button {
      }

      #tabbrowser-tabs:not([overflow="true"]) ~ #alltabs-button {
        display: none !important;
      }

      .titlebar-spacer {
        display: none;
      }

      /* #context_bookmarkTab, */

      /* Disable elements  */
      #image.autoplay-media-icon,
      #context_moveTabOptions,
      #context_sendTabToDevice,
      #context_reopenInContainer,
      #context_selectAllTabs,
      #context_closeTabOptions {
        display: none !important;
      }

      /* Url Bar  */

      #identity-box {
      }

      .identity-box-button {
      } 

      #urlbar-input::selection{
        background-color: #${base0D} !important;
      }

      #blocked-permissions-container {
        display: none !important;
      }

      .notification-anchor-icon {
        display: none !important;
      }

      .blocked-permission-icon {
        display: none !important;
      }

      .urlbarView-row[selected] .urlbarView-row-inner,
      .urlbarView-row:hover .urlbarView-row-inner { 
       background-color: #${base0D} !important; 
      }

      #urlbar[breakout][breakout-extend][open] > #urlbar-input-container {
        border-radius: var(--toolbarbutton-border-radius) var(--toolbarbutton-border-radius) 0 0 !important;
        background-color: #${base01} !important;
      }

      /* Urlbar View customizations */
      #urlbar-background, .urlbarView-results[wrap] > .urlbarView-row, .search-one-offs {
      	background-color: #${base00} !important; 
      	border: none !important;
      }
      	
      .urlbarView-row:hover > .urlbarView-row-inner {
      	background-color: #${base00} !important;
      }

      #urlbar-input-container {
        background-color: #${base01} !important;
      }

      #urlbar-container {
        border: none !important;
      }

      #urlbar[focused='true'] > #urlbar-background {
        box-shadow: none !important;
      }

      /* Star button */
      #star-button-box {
      }
      #star-button[starred] {
      	fill: #${base0D} !important;
      }
      #star-button[starred][animate] + #star-button-animatable-box > #star-button-animatable-image {
      	stroke: #${base0D} !important;
      	fill: #${base0D} !important;
      }

      #navigator-toolbox {
        border: none !important;
      }

      /* removes the firefox suggest text from urlbarview */
      .urlbarView-row[label="Firefox Suggest"]::before{ display: none !important; }
      .urlbarView-row[label="Firefox Suggest"]{ margin-top: 0 !important; }

      /* Removes search engine support */
      #urlbar .search-one-offs {
        display: none !important;
      }

      /* Removes the switch tab buttons in urlbarview */
      .urlbarView-row:is([type="switchtab"],
        [type="remotetab"]) > .urlbarView-row-inner > .urlbarView-no-wrap > .urlbarView-action  {
          display:none !important;
      }

      /* Bookmarks bar  */
      .bookmark-item .toolbarbutton-icon {
        display: none;
      }

      toolbarbutton.bookmark-item:not(.subviewbutton) {
      }

      /* #urlbar-zoom-button,
      #star-button-box,
      #tabs-newtab-button, */

      /* Toolbar  */
      #tracking-protection-icon-container,
      #pageActionButton,
      #pageActionSeparator,
      #wrapper-firefox-view-button,
      #fxa-toolbar-menu-button,
      #translations-button,
      #reader-mode-button,
      #customizableui-special-spring1,
      #customizableui-special-spring2,
      .tab-secondary-label {
        display: none !important;
      }

      /*** firefox view - remove separator and whitespace ***/
      #tabbrowser-tabs {
      }

      .urlbarView-url {
        color: #${base0E} !important;
      }

    '';

    profiles.user.userContent = ''
       @-moz-document url("about:home"),url(about:preferences),url("about:blank"),url("about:newtab"),url("about:privatebrowsing"){
        body{background-color:#${base00}!important;--newtab-search-icon: transparent !important;}
        a,a:visited,a:hover{color: red !important}
      	#newtab-search-text {
      	background-color: #${base02} !important;
      	font-size: 18px !important;
      	color: #${base07} !important;
      	box-shadow: none !important;
      	text-align: center !important;
      	border:none !important;
      	font-weight: bold !important;
      		}

      .search-wrapper input {
          --newtab-textbox-focus-boxshadow: none !important;
        }
        
      .search-wrapper .search-handoff-button,
      .search-wrapper input {
      }

      .icon.icon-settings {
          display: none !important;
      }

      :root {
      	
          --in-content-border-active: #${base00} !important;
          --in-content-border-active-shadow: none !important;
          --in-content-page-background: #${base00} !important;
          --in-content-page-color: #${base03} !important;
          scrollbar-color: #${base04} #${base05} !important;
          scrollbar-width: thin;
      }

    '';
  };
}
