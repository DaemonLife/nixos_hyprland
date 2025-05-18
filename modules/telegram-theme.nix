{ config, lib, pkgs, ... }: with config.lib.stylix.colors; let

  telegram_style = ''

    // --- Main UI ---
    windowBg: #${base00};
    windowFg: #${base05};
    windowBgOver: #${base01}; // hover bg in menu
    windowFgOver: #${base00}; // hover fg in menu
    menuBg: #${base00}; // global bg popup animation after click
    windowFgActive: #${base00}; // fg for some light buttons

    // some boxes in ui
    boxBg: #${base00};
    boxTextFg: #${base05};
    boxTextFgGood: #${base0B};
    boxTextFgError: #${base08};
    boxTitleFg: #${base05};
    boxSearchBg: #${base01};
    boxTitleAdditionalFg: #${base05};
    boxTitleCloseFg: #${base05};
    boxTitleCloseFgOver: #${base06};

    // up /\ and down \/ arrow for chat and chat list
    historyToDownBg: #00000000;
    historyToDownBgOver: #00000000;
    historyToDownBgRipple: #00000000;
    historyToDownFg: #${base04};
    historyToDownFgOver: #${base05};
    historyToDownShadow: #00000000;

    // bottom button in chat or channel (mute/unmute/join)
    historyComposeButtonBg: #${base01};
    historyComposeButtonBgOver: #${base02};
    historyComposeButtonBgRipple: #${base0D};

    // activate buttons
    activeButtonBg: #${base01};
    activeButtonBgOver: #${base02};
    activeButtonBgRipple: #${base0D};
    activeButtonFg: #${base05};
    activeButtonFgOver: #${base06};
    activeButtonSecondaryFg: #${base05};
    activeButtonSecondaryFgOver: #${base06};

    // back cancel, close buttons
    cancelIconFg: #${base05};
    cancelIconFgOver: #${base06};
    walletTitleButtonCloseFgActiveOver: #${base08};

    // --- RBM menu ---
    menuSeparatorFg: #${base01};
    windowBgRipple: #${base02}; // RBM emoji arrow and some animations bg
    menuBgRipple: #${base00};
    menuIconFg: #${base05};
    menuIconFgOver: #${base06};

    // --- Main settings menu ---
    mainMenuBg: #${base00};
    mainMenuCoverBg: #${base01};
    mainMenuCoverFg: #${base06};
    checkboxFg: #${base05}; // checkbox and radio buttons
    // slider (notifications and sounds)
    sliderBgInactive: #${base01};
    sliderBgActive: #${base05};

    windowSubTextFg: #${base05};
    windowSubTextFgOver: #${base06};
    windowBoldFg: #${base06};
    windowBoldFgOver: #${base07};
    windowActiveTextFg: #${base04}; // setap status, description (on, off, ...)

    // --- Notificaton ---
    notificationBg: #${base00};

    // --- Program window title ---
    titleBg: #${base00};
    titleFg: #${base05};
    titleFgActive: #${base06};
    titleBgActive: titleBg;

    titleButtonBg: titleBg;
    titleButtonFg: titleFg;
    titleButtonBgOver: #${base01};
    titleButtonFgOver: titleFgActive;
    titleButtonBgActive: titleBg;
    titleButtonFgActive: titleFgActive;
    titleButtonBgActiveOver: titleFgActive;
    titleButtonFgActiveOver: titleFgActive;
    titleButtonCloseBg: titleBg;
    titleButtonCloseFg: titleFg;
    titleButtonCloseBgOver: #${base08};
    titleButtonCloseFgOver: #${base07};
    titleButtonCloseBgActive: titleBg;
    titleButtonCloseFgActive: titleButtonCloseFgOver;
    titleButtonCloseBgActiveOver: titleButtonCloseBgOver;
    titleButtonCloseFgActiveOver: titleButtonCloseFgOver;

    // --- Scroll in CHAT --- 
    // bar itself
    historyScrollBarBg: #${base04};
    historyScrollBarBgOver: #${base05};
    // only bg
    historyScrollBg: #${base01};
    historyScrollBgOver: #${base02};

    // --- Scroll in CHAT LIST --- 
    // bar itself
    scrollBarBg: #${base04};
    scrollBarBgOver: #${base05};
    // only bg
    scrollBg: #${base01};
    scrollBgOver: #${base02};

    // --- Media player ---
    windowBgActive: #${base0E}; // fg status line active player in chat
    mediaviewPlaybackProgressFg: #${base03}; // player progress line in chat and FUCK DAMN time clock in full screen video

    // --- Top compact media player ---
    mediaPlayerBg: #${base00};
    mediaPlayerActiveFg: #${base05};
    mediaPlayerInactiveFg: #${base03};
    mediaPlayerDisabledFg: #${base03};

    // --- Media in full screen ---
    // loading icon
    radialFg: #${base0D};
    radialBg: #${base01};

    mediaviewMenuFg: #${base05}; // menu text fg
    mediaviewMenuBgOver: #${base03}; // statick bg of speed line
    mediaviewBg: #${base00};
    mediaviewVideoBg: #${base00};
    mediaviewControlFg: #${base05};

    // caption for photo
    mediaviewCaptionBg: #${base00}88;
    mediaviewCaptionFg: #${base05};
    mediaviewTextLinkFg: #${base0D};

    // when clicked save button
    mediaviewSaveMsgBg: #${base00};
    mediaviewSaveMsgFg: #${base05};

    // video player
    mediaviewPlaybackActive: #${base05}; // status line fs player
    mediaviewPlaybackInactive: #${base03}; // inactive status line fs player
    mediaviewPlaybackActiveOver: #${base05};
    mediaviewPlaybackInactiveOver: #${base03};
    mediaviewPlaybackIconFg: #${base05};
    mediaviewPlaybackIconFgOver: #${base05};

    // transparent layer (for png)
    mediaviewTransparentBg: #000000ff;
    mediaviewTransparentFg: #${base05};

    // --- Effects ---
    titleShadow: #00000000;
    windowShadowFg: #00000000;
    windowShadowFgFallback: #00000000;
    shadowFg: #00000000;
    slideFadeOutBg: #00000000;
    slideFadeOutShadowFg: #00000000;
    imageBg: #000000ff;
    imageBgTransparent: #000000ff;
    layerBg: #00000000; // Side bar shade

    // input messages in chat
    msgInShadow: #00000000;
    msgInShadowSelected: #00000000;

    // output messages in chat
    msgOutShadow: #00000000;
    msgOutShadowSelected: #00000000;

    // --- Cancel operation button ---
    lightButtonBg: #${base01};
    lightButtonBgOver: #${base02};
    lightButtonBgRipple: #${base01};
    lightButtonFg: #${base05};
    lightButtonFgOver: #${base06};

    // --- Attention (log out button) ---
    attentionButtonFg: #${base05};
    attentionButtonFgOver: #${base08};
    attentionButtonBgOver: #${base05};
    attentionButtonBgRipple: #${base08};

    // --- Close button in notifications? ---
    smallCloseIconFg: #${base05};
    smallCloseIconFgOver: #${base06};

    // --- Message input box ---
    placeholderFg: #${base05}; // Wrtie a message... text (and search input!)
    placeholderFgActive: #${base04}; // Wrtie a message... text active
    historyComposeAreaBg: #${base00};
    historyComposeAreaFg: #${base05};
    historyComposeAreaFgService: #${base05};
    historyComposeIconFg: #${base05};
    historyComposeIconFgOver: #${base05};
    historySendIconFg: #${base05};
    historySendIconFgOver: #${base05};
    historyPinnedBg: #${base00};
    historyReplyBg: historyComposeAreaBg;
    historyReplyIconFg: historyTextInFg;
    historyReplyCancelFg: #${base05};
    historyReplyCancelFgOver: #${base05};

    // --- Popup when hover message's clock ---
    tooltipBg: #${base00};
    tooltipFg: #${base05};
    tooltipBorderFg: #${base01};

    // --- System tray icon ---
    trayCounterBg: #${base03};
    trayCounterBgMute: #${base01};
    trayCounterFg: #${base05};
    trayCounterBgMacInvert: #${base05};
    trayCounterFgMacInvert: #${base00};

    // --- Contacts menu ---
    contactsBg: #${base00};
    contactsBgOver: windowBgOver;
    contactsNameFg: boxTextFg;
    contactsStatusFg: windowSubTextFg;
    contactsStatusFgOver: windowSubTextFgOver;
    contactsStatusFgOnline: #${base05};

    // --- Photo editor ---
    photoCropFadeBg: #${base00}7f;
    photoCropPointFg: #${base03}7f;

    // --- Login menu? ---
    introBg: #${base00};
    introTitleFg: #${base05};
    introDescriptionFg: windowSubTextFg;
    introErrorFg: #${base05};
    introCoverTopBg: #${base00};
    introCoverBottomBg: #${base00};
    introCoverIconsFg: #${base05};
    introCoverPlaneTrace: #${base04};
    introCoverPlaneInner: #${base03};
    introCoverPlaneOuter: #${base04};
    introCoverPlaneTop: #${base03};
    dialogsMenuIconFg: menuIconFg;
    dialogsMenuIconFgOver: menuIconFgOver;

    // --- SMS/PUSH input box? ---
    inputBorderFg: #${base05};

    // --- List of chats, channels and bots ---
    dialogsBg: #${base00};
    dialogsNameFg: #${base05};
    dialogsChatIconFg: dialogsNameFg;
    dialogsDateFg: dialogsNameFg;
    dialogsTextFg: dialogsNameFg;
    dialogsTextFgService: dialogsNameFg;
    dialogsDraftFg: dialogsNameFg;
    dialogsVerifiedIconBg: dialogsNameFg;
    dialogsVerifiedIconFg: dialogsBg;
    dialogsSendingIconFg: dialogsNameFg;
    dialogsSentIconFg: dialogsNameFg;

    dialogsUnreadBg: #${base0D};
    dialogsUnreadBgMuted: #${base04};
    dialogsUnreadFg: #${base00};

    dialogsTextFgOver: #${base06};
    dialogsBgOver: #${base01};
    dialogsTextFgServiceOver: dialogsTextFgOver;
    dialogsNameFgOver: dialogsTextFgOver;
    dialogsChatIconFgOver: dialogsTextFgOver;
    dialogsDateFgOver: dialogsTextFgOver;
    dialogsDraftFgOver: dialogsTextFgOver;
    dialogsVerifiedIconBgOver: dialogsVerifiedIconBg;
    dialogsVerifiedIconFgOver: dialogsVerifiedIconFg;
    dialogsSendingIconFgOver: dialogsSendingIconFg;
    dialogsSentIconFgOver: dialogsSentIconFg;
    dialogsUnreadBgOver: dialogsUnreadBg;
    dialogsUnreadBgMutedOver: dialogsUnreadBgMuted;
    dialogsUnreadFgOver: dialogsUnreadFg;

    dialogsBgActive: #${base02};
    dialogsNameFgActive: #${base06};
    dialogsChatIconFgActive: #${base06};
    dialogsDateFgActive: #${base06};
    dialogsTextFgActive: #${base06};
    dialogsTextFgServiceActive: #${base06};
    dialogsDraftFgActive: #${base06};
    dialogsVerifiedIconBgActive: #${base06};
    dialogsVerifiedIconFgActive: dialogsVerifiedIconFg;
    dialogsSendingIconFgActive: dialogsSendingIconFg;
    dialogsSentIconFgActive: #${base06};
    dialogsUnreadBgActive: #${base06};
    dialogsUnreadBgMutedActive: dialogsUnreadBgMuted;
    dialogsUnreadFgActive: dialogsUnreadFg;
    dialogsForwardBg: dialogsBgActive;
    dialogsForwardFg: dialogsNameFgActive;

    // --- Search ---
    filterInputActiveBg: #${base02}; // top search box in chat list
    filterInputInactiveBg: filterInputActiveBg;
    filterInputBorderFg: #${base02}; // ???
    searchedBarBg: #${base00}; // bottom bar
    searchedBarFg: #${base04};

    // --- Emoji, stickers, GIFs panel ---
    emojiPanBg: #${base01};
    emojiPanCategories: #${base01};
    emojiPanHeaderFg: #${base05};
    emojiPanHeaderBg: #${base01}; // it does not works...
    emojiIconFg: #${base05}; // emoji category fg
    stickerPreviewBg: #${base00}80; // full screen bg
    stickerPanDeleteBg: #${base01}; // delete icon for sticker
    stickerPanDeleteFg: #${base05};

    // --- In chat ---
    topBarBg: #${base00}; // chat top bar

    reportSpamBg: #${base00};
    reportSpamFg: #${base05};

    // Media in msg wheh msg selected
    msgSelectOverlay: #${base0D}50;
    msgStickerOverlay: #${base0D}50;

    // sound icon in msg media
    historyFileThumbIconFg: msgInBg;
    historyFileThumbIconFgSelected: #${base0D};

    // media download animation in msg
    historyFileThumbRadialFg: historyFileThumbIconFg;
    historyFileThumbRadialFgSelected: historyFileThumbIconFgSelected;

    // servis msg is msg of chat itself
    msgServiceFg: #${base05};
    msgServiceBg: #${base01};
    msgServiceBgSelected: #${base0D};

    // date on image in msg
    msgDateImgFg: #${base05};
    msgDateImgBg: #${base01};
    msgDateImgBgOver: #${base01};
    msgDateImgBgSelected: #${base01};

    // bot buttons
    msgBotKbOverBgAdd: msgServiceBg;
    msgBotKbIconFg: msgServiceFg;
    msgBotKbRippleBg: menuBgRipple;

    // --- Input message in chat ---
    historyTextInFg: #${base05};
    historyTextInFgSelected: #${base00};
    historyCaptionInFg: historyTextInFg;
    historyFileNameInFg: historyTextInFg;
    historySendingInIconFg: #${base04};
    msgInBg: #${base01};
    msgInBgSelected: #${base0D};
    msgInServiceFg: #${base05};
    msgInServiceFgSelected: #${base0D};
    msgInDateFg: #${base05};
    msgInDateFgSelected: #${base00};
    msgInMonoFg: #${base05};
    msgInReplyBarColor: #${base05};
    msgInReplyBarSelColor: #${base05};
    historyFileInIconFg: #${base01};
    historyFileInIconFgSelected: #${base0D};
    historyFileInRadialFg: historyFileInIconFg;
    historyFileInRadialFgSelected: historyFileInIconFgSelected;
    msgFileThumbLinkInFg: lightButtonFg;
    msgFileThumbLinkInFgSelected: lightButtonFgOver;
    msgFileInBg: #${base00};
    msgFileInBgOver: windowSubTextFgOver;
    msgFileInBgSelected: windowBoldFg;
    msgWaveformInActive: #${base0D};
    msgWaveformInActiveSelected: #${base05};
    msgWaveformInInactive: #${base02};
    msgWaveformInInactiveSelected: #${base03};
    mediaInFg: msgInDateFg;
    mediaInFgSelected: msgInDateFgSelected;
    historyLinkInFg: #${base0D};

    // --- Output message in chat (from me) ---
    historyTextOutFg: historyTextInFg;
    historyTextOutFgSelected: historyTextInFgSelected;
    historyCaptionOutFg: historyCaptionInFg;
    historyFileNameOutFg: historyFileNameInFg;
    historyOutIconFg: historyInIconFg;
    historyOutIconFgSelected: historyInIconFgSelected;
    historySendingOutIconFg: historySendingInIconFg;
    msgOutBg: msgInBg;
    msgOutBgSelected: msgInBgSelected;
    msgOutDateFg: msgInDateFg;
    msgOutDateFgSelected: msgInDateFgSelected;
    msgOutServiceFg: msgInServiceFg;
    msgOutServiceFgSelected: msgInServiceFgSelected;
    msgOutMonoFg: msgInMonoFg;
    msgOutReplyBarColor: msgInReplyBarColor;
    msgOutReplyBarSelColor: msgInReplyBarSelColor;
    historyFileOutIconFg: historyFileInIconFg;
    historyFileOutIconFgSelected: historyFileInIconFgSelected;
    historyFileOutRadialFg: historyFileInRadialFg;
    historyFileOutRadialFgSelected: historyFilenInRadialFgSelected;
    msgFileThumbLinkOutFg: msgFileThumbLinkInFg;
    msgFileThumbLinkOutFgSelected: msgFileThumbLinkInFgSelected;
    msgFileOutBg: msgFileInBg;
    msgFileOutBgOver: msgFileInBgOver;
    msgFileOutBgSelected: msgFileInBgSelected;
    msgWaveformOutActive: msgWaveformInActive;
    msgWaveformOutActiveSelected: msgWaveformInActiveSelected;
    msgWaveformOutInactive: msgWaveformInInactive;
    msgWaveformOutInactiveSelected: msgWaveformInInactiveSelected;
    mediaOutFg: mediaInFg;
    mediaOutFgSelected: mediaInFgSelected;
    historyLinkOutFg: historyLinkInFg;

    // --- User withoin avatar ---
    historyPeerUserpicFg: #${base01}; // default color
    historyPeer1NameFg: #${base08}; // red
    historyPeer1UserpicBg: #${base08};
    historyPeer2NameFg: #${base0B}; // green
    historyPeer2UserpicBg: #${base0B};
    historyPeer3NameFg: #${base0A}; // yellow
    historyPeer3UserpicBg: #${base0A};
    historyPeer4NameFg: #${base0C}; // blue
    historyPeer4UserpicBg: #${base0C};
    historyPeer5NameFg: #${base0E}; // purple
    historyPeer5UserpicBg: #${base0E};
    historyPeer6NameFg: #${base0F}; // pink
    historyPeer6UserpicBg: #${base0F};
    historyPeer7NameFg: #${base0D}; // sea
    historyPeer7UserpicBg: #${base0D};
    historyPeer8NameFg: #${base09}; // orange
    historyPeer8UserpicBg: #${base09};

    // --- Files/links ---
    msgFile1Bg: #${base01}; // blue
    msgFile1BgDark: #${base0D};
    msgFile1BgOver: #${base04};
    msgFile1BgSelected: #${base04};
    msgFile2Bg: #${base01}; // green
    msgFile2BgDark: #${base0B};
    msgFile2BgOver: #${base04};
    msgFile2BgSelected: #${base04};
    msgFile3Bg: #${base01}; // red
    msgFile3BgDark: #${base08};
    msgFile3BgOver: #${base04};
    msgFile3BgSelected: #${base04};
    msgFile4Bg: #${base01}; // yellow
    msgFile4BgDark: #${base0A};
    msgFile4BgOver: #${base04};
    msgFile4BgSelected: #${base04};

    youtubePlayIconBg: #${base00}80; // youtube
    youtubePlayIconFg: #${base08};
    videoPlayIconBg: #${base00}80; // other video services
    videoPlayIconFg: #${base0D};

    toastBg: #${base00}; // for link t.me ?
    toastFg: #${base05};

    // --- Side bar ---
    sideBarBg: #${base00};
    sideBarBgActive: #${base02};
    sideBarIconFg: #${base03};
    sideBarIconFgActive: #${base0D};
    sideBarBadgeBg: sideBarIconFgActive;
    sideBarBadgeBgMuted: sideBarIconFg; // non active or muted badge
    sideBarBadgeFg: sideBarBg; // text in badge
    sideBarBgRipple: #${base08}; // bg animation when icon clicked

    // both work like active lol
    sideBarTextFgActive: sideBarIconFgActive;
    sideBarTextFg: sideBarIconFg;

    // --- ??? ---
    activeLineFg: #${base05};
    activeLineFgError: #${base08};
    outlineButtonBg: #${base00};
    outlineButtonBgOver: lightButtonBgOver;
    outlineButtonOutlineFg: windowBgActive;
    outlineButtonBgRipple: lightButtonBgRipple;
    menuSubmenuArrowFg: #${base03};
    menuFgDisabled: #${base03};
    membersAboutLimitFg: windowSubTextFgOver;
    historyIconFgInverted: #${base05};
    historySendingInvertedIconFg: #${base05};
    historyUnreadBarBg: #${base00};
    historyUnreadBarBorder: shadowFg;
    historyUnreadBarFg: #${base05};
    historyForwardChooseBg: #${base03}80;
    historyForwardChooseFg: #${base05};
    msgImgReplyBarColor: #${base05};
    overviewCheckBg: #${base03}80;
    overviewCheckFg: #${base04};
    overviewCheckFgActive: #${base01};
    overviewPhotoSelectOverlay: #bdbdbd4a;
    profileStatusFgOver: #${base04};
    profileVerifiedCheckBg: #${base05};
    profileVerifiedCheckFg: #${base01};
    profileAdminStartFg: #${base05};
    notificationsBoxMonitorFg: #${base05};
    notificationsBoxScreenBg: windowSubTextFg;
    notificationSampleUserpicFg: #${base01};
    notificationSampleCloseFg: #${base05};
    notificationSampleTextFg: #${base05};
    notificationSampleNameFg: #${base04};
    mediaviewFileBg: #000000;
    mediaviewFileNameFg: #${base05};
    mediaviewFileSizeFg: windowSubTextFg;
    mediaviewFileRedCornerFg: #${base08};
    mediaviewFileYellowCornerFg: #${base0A};
    mediaviewFileGreenCornerFg: #${base0B};
    mediaviewFileBlueCornerFg: #${base0D};
    mediaviewFileExtFg: activeButtonFg;
    mediaviewMenuBg: #${base00};
    mediaviewMenuBgRipple: menuBgRipple;
    mediaviewControlBg: #${base07}80;
    mainMenuCloudBg: #${base03};
    overviewCheckBorder: #${base08};
    dialogsOnlineBadgeFgActive: #${base08};
    menuBgOver: #${base02};
  '';

in
{

  home.activation.telegram_style = lib.hm.dag.entryAfter [ "writeBoundary" ] ''

    cd $HOME/.config && echo "${telegram_style}" > tmp_colors.tdesktop-theme;
    sed '/^#/d' tmp_colors.tdesktop-theme > colors.tdesktop-theme;
    ${pkgs.imagemagick}/bin/magick -size 2960x2960 xc:#${base00} background.jpg;
    ${pkgs.zip}/bin/zip telegram-base16.zip background.jpg colors.tdesktop-theme;
    mv telegram-base16.zip telegram-base16.tdesktop-theme;
    rm -rf colors.tdesktop-theme tmp_colors.tdesktop-theme background.jpg;

  '';
}
