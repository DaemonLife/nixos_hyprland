{ pkgs, config, ... }: {

programs.firefox = with config.colorScheme.palette; {
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
        };
    };

    profiles.user = {
        settings = {
            "general.smoothScroll" = true;
        };
    };

    profiles.user.extraConfig = ''    
        user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);
        user_pref("layers.acceleration.force-enabled
", true);
        user_pref("gfx.webrender.all", true);
        user_pref("gfx.webrender.enabled", true);
        user_pref("layout.css.backdrop-filter.enabled", true);
        user_pref("svg.context-properties.content.enabled", true);
        use$r_pref("browser.compactmode.show", true);
        user_pref("browser.tabs.firefox-view", false);
        user_pref("svg.context-properties.content.enabled", true);
    '';

    profiles.user.userChrome = ''
:root {
  --sfwindow: #${base00};
  --sfsecondary: #${base02};
}

/* Tabs */
.tabbrowser-tab[selected="true"] .tab-background {
  background: #${base02} none !important;
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
  background-color: var(--sfwindow) !important;
}

/* Window colors  */
:root {
  --toolbar-bgcolor: var(--sfsecondary) !important;
  --tabs-border-color: var(--sfwindow) !important;
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
  border-radius: 5px !important;
}

.tabs-newtab-button {
    border-radius: 10px !important;
}

/* remove loading icon  */
.tab-throbber { 
  display: none !important;
}

/* make tab close button instantly show up  */
.tabbrowser-tab:not([pinned]):hover .tab-close-button {
  opacity: 100 !important;
}

/* remove loading burst  */
.tabbrowser-tab[image^="chrome:"] .tab-loading-burst {
  display: none;
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

#tabbrowser-tabs[haspinnedtabs]:not([positionpinnedtabs])
  > #tabbrowser-arrowscrollbox
  > .tabbrowser-tab[first-visible-unpinned-tab] {
  margin-inline-start: 0 !important;
}

:root {
  --toolbarbutton-border-radius: 5px !important;
  --toolbar-field-focus-border-color: transparent !important;
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
  border: 1px solid rgba(0, 0, 0, 0) !important;
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
  min-width: 1.6em;
}

/* #urlbar-zoom-button,
#star-button-box,
#tabs-newtab-button, */

/* Toolbar  */
#tracking-protection-icon-container,
#pageActionButton,
#pageActionSeparator,
#firefox-view-button,
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
  border-inline-start: 0 !important;
  padding-inline-start: 0 !important;
  margin-inline-start: 0 !important;
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
    padding-left: 20px !important;
   	padding-inline-start: 24px !important;
   	padding-inline-end: 13px !important;
  }
  
.search-wrapper .search-handoff-button,
.search-wrapper input {
   	padding-inline-start: 25px !important;
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
