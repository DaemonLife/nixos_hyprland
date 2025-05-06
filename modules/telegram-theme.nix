{ config, lib, pkgs, ... }: with config.lib.stylix.colors; let

  # Default background: base00
  # Alternate background: base01
  # Selection background: base02
  # Default text: base05
  # Alternate text: base04
  # Warning: base0A
  # Urgent: base09
  # Error: base08

  telegram_style = ''
    # --- Window ---
    windowBg: #${base00};
    windowFg: #${base05};
    # selected bg in menu
    windowBgOver: #${base00};
    # selected fg in menu
    windowFgOver: #${base05};
    # RBM emoji arrow and some animations bg
    windowBgRipple: #${base0B};

    # activate buttons bg
    activeButtonBg: #${base01};
    activeButtonBgOver: #${base02};
    activeButtonBgRipple: #${base0B};

    # activate buttons fg
    activeButtonFg: #${base05};
    activeButtonFgOver: #${base06};
    activeButtonSecondaryFg: #${base05};
    activeButtonSecondaryFgOver: #${base06};

    # --- Scroll --- 
    # bar bg in CHAT LIST when hover 
    scrollBgOver: #${base00};
    # bar fg in CHAT when hover
    historyScrollBarBg: #${base05};

    # --- text ---
    windowSubTextFg: #${base05};
    windowSubTextFgOver: #${base0B};
    windowBoldFg: #${base05};
    windowBoldFgOver: #${base0B};
    windowActiveTextFg: #${base05};

    # --- Player ---
    # fg status line for bg active player 
    windowBgActive: #${base0D};

    # --- Effects ---
    windowShadowFg: #00000000;
    windowShadowFgFallback: #00000000;
    shadowFg: #00000000;
    slideFadeOutBg: #00000000;
    slideFadeOutShadowFg: #00000000;
    imageBg: #000000ff;
    imageBgTransparent: #000000ff;

    # --- Other ---

    # ???
    windowFgActive: #${base00};

    activeLineFg: #${base05};
    activeLineFgError: #${base08};
    lightButtonBg: #${base01};
    lightButtonBgOver: #${base01};
    lightButtonBgRipple: #${base02};
    lightButtonFg: activeButtonFg;
    lightButtonFgOver: lightButtonFg;
    attentionButtonFg: #${base08};
    attentionButtonFgOver: #${base08};
    attentionButtonBgOver: #${base08}1d;
    attentionButtonBgRipple: #${base08};
    outlineButtonBg: #${base00};
    outlineButtonBgOver: lightButtonBgOver;
    outlineButtonOutlineFg: windowBgActive;
    outlineButtonBgRipple: lightButtonBgRipple;
    menuBg: #${base00};
    menuBgOver: windowBgOver;
    menuBgRipple: windowBgRipple;
    menuIconFg: #${base05};
    menuIconFgOver: #${base03};
    menuSubmenuArrowFg: #${base03};
    menuFgDisabled: #${base03};
    menuSeparatorFg: #${base05};
    scrollBarBg: #${base01};
    scrollBarBgOver: #${base01};
    scrollBg: #${base01};
    smallCloseIconFg: #${base05};
    smallCloseIconFgOver: #${base03};
    radialFg: #${base05};
    radialBg: #${base00};
    placeholderFg: windowSubTextFg;
    placeholderFgActive: #${base03};
    inputBorderFg: #${base03};
    filterInputBorderFg: #${base02};
    filterInputInactiveBg: #${base02};
    checkboxFg: #${base05};
    sliderBgInactive: #${base01};
    sliderBgActive: #${base05};
    tooltipBg: #${base07};
    tooltipFg: #${base0D};
    tooltipBorderFg: #${base05};
    titleShadow: #00000000;
    titleBg: #${base00};
    titleBgActive: #${base01};
    titleButtonBg: titleBg;
    titleButtonFg: #${base03};
    titleButtonBgOver: #${base00};
    titleButtonFgOver: #${base05};
    titleButtonBgActive: titleButtonBg;
    titleButtonFgActive: titleButtonFg;
    titleButtonBgActiveOver: titleButtonBgOver;
    titleButtonFgActiveOver: #${base05};
    titleButtonCloseBg: titleButtonBg;
    titleButtonCloseFg: titleButtonFg;
    titleButtonCloseBgOver: #${base08};
    titleButtonCloseFgOver: #${base05};
    titleButtonCloseBgActive: titleButtonCloseBg;
    titleButtonCloseFgActive: windowBoldFg;
    titleButtonCloseBgActiveOver: #${base08};
    titleButtonCloseFgActiveOver: titleButtonCloseFgOver;
    titleFgActive: windowBoldFg;
    titleFg: windowSubTextFg;
    trayCounterBg: #${base01};
    trayCounterBgMute: #${base04};
    trayCounterFg: #${base05};
    trayCounterBgMacInvert: #${base05};
    trayCounterFgMacInvert: #${base00};
    layerBg: #0000007f;
    cancelIconFg: menuIconFg;
    cancelIconFgOver: menuIconFgOver;
    boxBg: #${base00};
    boxTextFg: #${base05};
    boxTextFgGood: #${base0B};
    boxTextFgError: #${base08};
    boxTitleFg: #${base05};
    boxSearchBg: #${base01};
    boxTitleAdditionalFg: #${base03};
    boxTitleCloseFg: cancelIconFg;
    boxTitleCloseFgOver: cancelIconFgOver;
    membersAboutLimitFg: windowSubTextFgOver;
    contactsBg: #${base00};
    contactsBgOver: windowBgOver;
    contactsNameFg: boxTextFg;
    contactsStatusFg: windowSubTextFg;
    contactsStatusFgOver: windowSubTextFgOver;
    contactsStatusFgOnline: #${base05};
    photoCropFadeBg: #${base01}7f;
    photoCropPointFg: #${base03}7f;
    introBg: #${base00};
    introTitleFg: #${base05};
    introDescriptionFg: windowSubTextFg;
    introErrorFg: #${base04};
    introCoverTopBg: #${base00};
    introCoverBottomBg: #${base00};
    introCoverIconsFg: #${base00};
    introCoverPlaneTrace: #${base04};
    introCoverPlaneInner: #${base03};
    introCoverPlaneOuter: #${base04};
    introCoverPlaneTop: #${base03};
    dialogsMenuIconFg: menuIconFg;
    dialogsMenuIconFgOver: menuIconFgOver;
    dialogsBg: #${base00};
    dialogsNameFg: #${base05};
    dialogsChatIconFg: dialogsNameFg;
    dialogsDateFg: #${base05};
    dialogsTextFg: #${base04};
    dialogsTextFgService: windowActiveTextFg;
    dialogsDraftFg: #${base0A};
    dialogsVerifiedIconBg: #${base05};
    dialogsVerifiedIconFg: #${base01};
    dialogsSendingIconFg: #${base05};
    dialogsSentIconFg: #${base05};
    dialogsUnreadBg: #${base05};
    dialogsUnreadBgMuted: #${base04};
    dialogsUnreadFg: #${base01};
    dialogsBgOver: #${base01};
    dialogsNameFgOver: #${base06};
    dialogsChatIconFgOver: #${base06};
    dialogsDateFgOver: #${base06};
    dialogsTextFgOver: windowSubTextFgOver;
    dialogsTextFgServiceOver: dialogsTextFgService;
    dialogsDraftFgOver: dialogsDraftFg;
    dialogsVerifiedIconBgOver: dialogsVerifiedIconBg;
    dialogsVerifiedIconFgOver: dialogsVerifiedIconFg;
    dialogsSendingIconFgOver: dialogsSendingIconFg;
    dialogsSentIconFgOver: dialogsSentIconFg;
    dialogsUnreadBgOver: dialogsUnreadBg;
    dialogsUnreadBgMutedOver: dialogsUnreadBgMuted;
    dialogsUnreadFgOver: dialogsUnreadFg;
    dialogsBgActive: #${base01};
    dialogsNameFgActive: #${base06};
    dialogsChatIconFgActive: #${base06};
    dialogsDateFgActive: #${base05};
    dialogsTextFgActive: #${base05};
    dialogsTextFgServiceActive: #${base05};
    dialogsDraftFgActive: windowSubTextFg;
    dialogsVerifiedIconBgActive: #${base05};
    dialogsVerifiedIconFgActive: dialogsVerifiedIconFg;
    dialogsSendingIconFgActive: dialogsSendingIconFg;
    dialogsSentIconFgActive: #${base05};
    dialogsUnreadBgActive: #${base05};
    dialogsUnreadBgMutedActive: dialogsUnreadBgMuted;
    dialogsUnreadFgActive: dialogsUnreadFg;
    dialogsForwardBg: dialogsBgActive;
    dialogsForwardFg: dialogsNameFgActive;
    searchedBarBg: #${base00};
    searchedBarFg: #${base05};
    topBarBg: #${base00};
    emojiPanBg: #${base00};
    emojiPanCategories: #${base00};
    emojiPanHeaderFg: #${base05};
    emojiPanHeaderBg: #${base03};
    stickerPanDeleteBg: #${base01};
    stickerPanDeleteFg: #${base05};
    stickerPreviewBg: #${base00}80;
    historyTextInFg: #${base05};
    historyTextInFgSelected: #${base00};
    historyTextOutFg: #${base05};
    historyCaptionInFg: historyTextInFg;
    historyCaptionOutFg: historyTextOutFg;
    historyFileNameInFg: historyTextInFg;
    historyFileNameOutFg: historyTextOutFg;
    historyOutIconFg: dialogsSentIconFg;
    historyOutIconFgSelected: #${base00};
    historyIconFgInverted: #${base05};
    historySendingOutIconFg: #${base04};
    historySendingInIconFg: #${base04};
    historySendingInvertedIconFg: #${base05};
    historyUnreadBarBg: #${base00};
    historyUnreadBarBorder: shadowFg;
    historyUnreadBarFg: #${base05};
    historyForwardChooseBg: #${base03}80;
    historyForwardChooseFg: #${base05};
    historyPeer1NameFg: #${base08};
    historyPeer1UserpicBg: #${base08};
    historyPeer2NameFg: #${base0B};
    historyPeer2UserpicBg: #${base0B};
    historyPeer3NameFg: #${base0A};
    historyPeer3UserpicBg: #${base0A};
    historyPeer4NameFg: #${base0C};
    historyPeer4UserpicBg: #${base0C};
    historyPeer5NameFg: #${base09};
    historyPeer5UserpicBg: #${base09};
    historyPeer6NameFg: #${base0E};
    historyPeer6UserpicBg: #${base0E};
    historyPeer7NameFg: #${base0D};
    historyPeer7UserpicBg: #${base0D};
    historyPeer8NameFg: #${base0F};
    historyPeer8UserpicBg: #${base0F};
    historyPeerUserpicFg: #${base01};
    historyScrollBarBgOver: #${base05};
    historyScrollBg: #${base01};
    historyScrollBgOver: #${base05};
    msgInBg: #${base01};
    msgInBgSelected: #${base0D};
    msgOutBg: #${base01};
    msgOutBgSelected: #${base0D}ff;
    msgSelectOverlay: #${base0D}ff;
    msgStickerOverlay: #${base0D}ff;
    msgInServiceFg: #${base05};
    msgInServiceFgSelected: #${base05};
    msgOutServiceFg: #${base0D};
    msgOutServiceFgSelected: activeLineFg;
    msgInShadow: #00000000;
    msgInShadowSelected: #00000000;
    msgOutShadow: #00000000;
    msgOutShadowSelected: #00000000;
    msgInDateFg: #${base05};
    msgInDateFgSelected: #${base00};
    msgOutDateFg: #${base05};
    msgOutDateFgSelected: #${base00};
    msgServiceFg: #${base05};
    msgServiceBg: #${base01};
    msgServiceBgSelected: #${base02};
    msgInReplyBarColor: #${base05};
    msgInReplyBarSelColor: #${base05};
    msgOutReplyBarColor: #${base05};
    msgOutReplyBarSelColor: #${base05};
    msgImgReplyBarColor: #${base05};
    msgInMonoFg: #${base05};
    msgOutMonoFg: #${base05};
    msgDateImgFg: #${base05};
    msgDateImgBg: #${base01};
    msgDateImgBgOver: #${base01};
    msgDateImgBgSelected: #${base00};
    msgFileThumbLinkInFg: lightButtonFg;
    msgFileThumbLinkInFgSelected: lightButtonFgOver;
    msgFileThumbLinkOutFg: windowActiveTextFg;
    msgFileThumbLinkOutFgSelected: windowActiveTextFg;
    msgFileInBg: #${base00};
    msgFileInBgOver: windowSubTextFgOver;
    msgFileInBgSelected: windowBoldFg;
    msgFileOutBg: windowBoldFg;
    msgFileOutBgOver: windowSubTextFgOver;
    msgFileOutBgSelected: windowBoldFg;
    msgFile1Bg: #${base01};
    msgFile1BgDark: #${base05};
    msgFile1BgOver: #${base04};
    msgFile1BgSelected: #${base04};
    msgFile2Bg: #${base01};
    msgFile2BgDark: #${base05};
    msgFile2BgOver: #${base04};
    msgFile2BgSelected: #${base04};
    msgFile3Bg: #${base01};
    msgFile3BgDark: #${base05};
    msgFile3BgOver: #${base04};
    msgFile3BgSelected: #${base04};
    msgFile4Bg: #${base01};
    msgFile4BgDark: #${base05};
    msgFile4BgOver: #${base04};
    msgFile4BgSelected: #${base04};
    historyFileInIconFg: #${base01};
    historyFileInIconFgSelected: #${base0D};
    historyFileInRadialFg: historyFileInIconFg;
    historyFileInRadialFgSelected: historyFileInIconFgSelected;
    historyFileOutIconFg: msgOutBg;
    historyFileOutIconFgSelected: #${base0D};
    historyFileOutRadialFg: historyFileOutIconFg;
    historyFileOutRadialFgSelected: historyFileOutIconFgSelected;
    historyFileThumbIconFg: msgInBg;
    historyFileThumbIconFgSelected: #${base0D};
    historyFileThumbRadialFg: historyFileThumbIconFg;
    historyFileThumbRadialFgSelected: historyFileThumbIconFgSelected;
    msgWaveformInActive: #${base0D};
    msgWaveformInActiveSelected: #${base05};
    msgWaveformInInactive: #${base03};
    msgWaveformInInactiveSelected: #${base02};
    msgWaveformOutActive: #${base05};
    msgWaveformOutActiveSelected: #${base02};
    msgWaveformOutInactive: #${base01};
    msgWaveformOutInactiveSelected: msgInBgSelected;
    msgBotKbOverBgAdd: msgServiceBg;
    msgBotKbIconFg: msgServiceFg;
    msgBotKbRippleBg: menuBgRipple;
    mediaInFg: msgInDateFg;
    mediaInFgSelected: msgInDateFgSelected;
    mediaOutFg: msgOutDateFg;
    mediaOutFgSelected: msgOutDateFgSelected;
    youtubePlayIconBg: #00000080;
    youtubePlayIconFg: #${base05};
    videoPlayIconBg: #00000080;
    videoPlayIconFg: #${base05};
    toastBg: #${base00};
    toastFg: #${base05};
    reportSpamBg: #${base00};
    reportSpamFg: #${base05};
    historyToDownBg: #00000000;
    historyToDownBgOver: #00000080;
    historyToDownBgRipple: windowBgRipple;
    historyToDownFg: #${base05};
    historyToDownFgOver: #${base05};
    historyToDownShadow: #00000000;
    historyComposeAreaBg: #${base00};
    historyComposeAreaFg: historyTextInFg;
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
    historyComposeButtonBg: historyComposeAreaBg;
    historyComposeButtonBgOver: windowBgOver;
    historyComposeButtonBgRipple: windowBgRipple;
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
    mainMenuBg: #${base00};
    mainMenuCoverBg: #${base00};
    mainMenuCoverFg: #${base05};
    mediaPlayerBg: #${base00};
    mediaPlayerActiveFg: #${base05};
    mediaPlayerInactiveFg: #${base03};
    mediaPlayerDisabledFg: #${base03};
    mediaviewFileBg: #000000;
    mediaviewFileNameFg: #${base05};
    mediaviewFileSizeFg: windowSubTextFg;
    mediaviewFileRedCornerFg: #${base08};
    mediaviewFileYellowCornerFg: #${base0A};
    mediaviewFileGreenCornerFg: #${base0B};
    mediaviewFileBlueCornerFg: #${base0D};
    mediaviewFileExtFg: activeButtonFg;
    mediaviewMenuBg: #${base00};
    mediaviewMenuBgOver: menuBgOver;
    mediaviewMenuBgRipple: menuBgRipple;
    mediaviewMenuFg: windowBoldFg;
    mediaviewBg: #000000;
    mediaviewVideoBg: imageBg;
    mediaviewControlBg: #${base07}80;
    mediaviewControlFg: #${base05};
    mediaviewCaptionBg: #00000080;
    mediaviewCaptionFg: #${base05};
    mediaviewTextLinkFg: #${base0D};
    mediaviewSaveMsgBg: toastBg;
    mediaviewSaveMsgFg: toastFg;
    mediaviewPlaybackActive: #${base05};
    mediaviewPlaybackInactive: #${base02};
    mediaviewPlaybackActiveOver: #${base05};
    mediaviewPlaybackInactiveOver: windowSubTextFgOver;
    mediaviewPlaybackProgressFg: #${base03};
    mediaviewPlaybackIconFg: mediaviewPlaybackActive;
    mediaviewPlaybackIconFgOver: mediaviewPlaybackActiveOver;
    mediaviewTransparentBg: #000000ff;
    mediaviewTransparentFg: #${base05};
    notificationBg: #${base00};

    emojiIconFg: #${base05};
    historyLinkOutFg: #${base08};
    historyLinkInFg: #${base08};
    sideBarBg: #${base00};
    sideBarBgActive: #${base01};
    sideBarTextFgActive: #${base0D};
    sideBarIconFgActive: #${base0D};
    sideBarBadgeBg: #${base0D};
    sideBarTextFg: #${base03};
    sideBarBadgeBgMuted: #${base03};
    sideBarBgRipple: #${base08};
    sideBarIconFg: #${base03};
    mainMenuCloudBg: #${base03};
    filterInputActiveBg: #${base0D};
    overviewCheckBorder: #${base08};
    sideBarBadgeFg: #${base00};
    dialogsOnlineBadgeFgActive: #${base08};
    walletTitleButtonCloseFgActiveOver: #${base08};
  '';

in
{

  home.activation.telegram_style = lib.hm.dag.entryAfter [ "writeBoundary" ] ''

    cd $HOME/.config && echo "${telegram_style}" > tmp_colors.tdesktop-theme;

    sed '/^#/d' tmp_colors.tdesktop-theme > colors.tdesktop-theme;

    ${pkgs.imagemagick}/bin/magick -size 2960x2960 xc:#${base00} background.jpg;

    ${pkgs.zip}/bin/zip telegram-base16.zip background.jpg colors.tdesktop-theme;

    mv telegram-base16.zip telegram-base16.tdesktop-theme

    rm -rf colors.tdesktop-theme tmp_colors.tdesktop-theme background.jpg;

  '';
}
