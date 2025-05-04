{ config, ... }: {

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

    profiles.user.userChrome = ''

      :root {
        --tab-selected-shadow: 0 0 0 0 !important;
        --toolbar-bgcolor: #${base01} !important;
        --tabs-border-color: #${base02} !important;
        --lwt-sidebar-background-color: #${base00} !important;
        --lwt-toolbar-field-focus: #${base01} !important;

        /*
        --button-size-icon: 11px !important;
        */

      }

      /*
      #sidebar-box {
         min-width: 12px !important;
        --button-size-icon: 12px !important;
      }

      #sidebar {
        border-right: 0px solid #ccc;
        overflow: hidden;
        width: 50px !important;
        min-width: 50px !important;
        width: 100% !important;
      }      
      */

        /* -- ALL TABS -- */
      .tabbrowser-tab {
        height: 40px !important;
      }
      .tabbrowser-tab .tab-background { 
        color: #${base05} !important; 
        border-radius: 0px !important;
        border: 0px !important;
        margin: 0px !important;
        padding: 0px !important;
        padding-block: 0px !important;
      }
      .tab-content {
        padding-inline: 12px !important;
      }
      .tab-close-button {
        opacity: 0;
      }
      .tabbrowser-tab .tab-close-button {
        border-radius: 5px !important;
      }
      /* make tab close button instantly show up  */
      .tabbrowser-tab:not([pinned]):hover .tab-close-button {
        opacity: 100 !important;
      }
      /* remove website icons in tabs  */
      .tabbrowser-tab .tab-icon-image {
        /* display: none !important; */
      }

      /* -- ONLY SELECTED TAB -- */
      .tabbrowser-tab[selected="true"] .tab-background {
        background: #${base02} none !important;
      }

      /* -- NEW TAB BUTTON -- */
      #tabbrowser-arrowscrollbox[orient="vertical"] > #tabbrowser-arrowscrollbox-periphery > #tabs-newtab-button, #vertical-tabs-newtab-button {
        border-radius: 0px !important;
        padding: 0px 0px 0px 12px !important;
        margin: 0px !important;
      }
      #tabs-newtab-button:hover, #new-tab-button:hover {
        background-color: #${base0B} !important; /* Цвет фона при наведении */
        color: #${base01} !important; /* Цвет текста при наведении */
        opacity: 100 !important;
      }

      .tab-icon-overlay {
        display:none !important;
      }

      #nav-bar:not([tabs-hidden='true']) {
        box-shadow: none;
      }
      #nav-bar {
        box-shadow: none;
      }

      /* Remove box shadow on address bar */
      #urlbar-background,
      #searchbar {
        box-shadow: none !important;
      }
      #tabbrowser-tabs[haspinnedtabs]:not([positionpinnedtabs])
        > #tabbrowser-arrowscrollbox
        > .tabbrowser-tab[first-visible-unpinned-tab] {
      }

      :root {
        --toolbar-field-focus-border-color: transparent !important;
      }

      .tabbrowser-tab:is([visuallyselected='true'], [multiselected])
        > .tab-stack
        > .tab-background {
        box-shadow: none !important;
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

      #urlbar-input::selection{
        background-color: #${base0D} !important;
      }

      #blocked-permissions-container {
        display: none !important;
      }
      .blocked-permission-icon {
        display: none !important;
      }

      .notification-anchor-icon {
        display: none !important;
      }

      .urlbarView-row[selected] .urlbarView-row-inner,
      .urlbarView-row:hover .urlbarView-row-inner { 
         background-color: #${base0D} !important; 
      }

      #urlbar[breakout][breakout-extend][open] > #urlbar-input-container {
        border-radius: var(4px !important;) var(4px !important;) 0 0 !important;
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
