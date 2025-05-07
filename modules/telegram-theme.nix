{ config, lib, pkgs, ... }: with config.lib.stylix.colors; let

  telegram_style = ''

    # Is it possible use // for comments?

    # --- Main UI ---
    windowBg: #${base00};
    windowFg: #${base05};
    # selected bg in menu
    windowBgOver: #${base00};
    # selected fg in menu
    windowFgOver: #${base05};
    # RBM emoji arrow and some animations bg
    windowBgRipple: #${base0B};

    # Some boxes in ui
    boxBg: #${base00};
    boxTextFg: #${base05};
    boxTextFgGood: #${base0B};
    boxTextFgError: #${base08};
    boxTitleFg: #${base05};
    boxSearchBg: #${base01};
    boxTitleAdditionalFg: #${base03};
    boxTitleCloseFg: cancelIconFg;
    boxTitleCloseFgOver: cancelIconFgOver;
    
    # up /\ and down \/ arrow for chat and chat list
    historyToDownBg: #00000000;
    historyToDownBgOver: #00000080;
    historyToDownBgRipple: windowBgRipple;
    historyToDownFg: #${base05};
    historyToDownFgOver: #${base05};
    historyToDownShadow: #00000000;

    # bottom button in chat or channel (mute/unmute/join)
    historyComposeButtonBg: historyComposeAreaBg;
    historyComposeButtonBgOver: windowBgOver;
    historyComposeButtonBgRipple: windowBgRipple;

    # activate buttons
    activeButtonBg: #${base01};
    activeButtonBgOver: #${base02};
    activeButtonBgRipple: #${base0B};
    activeButtonFg: #${base05};
    activeButtonFgOver: #${base06};
    activeButtonSecondaryFg: #${base05};
    activeButtonSecondaryFgOver: #${base06};

    # backб cancel, close buttons
    cancelIconFg: menuIconFg;
    cancelIconFgOver: menuIconFgOver;
    walletTitleButtonCloseFgActiveOver: #${base08};

    # --- Notificaton ---
    notificationBg: #${base00};

    # --- Program window title (nevermind for me) ---
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

    # --- RBM menu ---
    menuSeparatorFg: #${base02};

    # global popup menu animation
    menuBg: #${base00};
    menuBgOver: windowBgOver;
    menuBgRipple: windowBgRipple;
    menuIconFg: #${base05};
    menuIconFgOver: #${base04};

    # --- Main settings menu ---
    mainMenuBg: #${base00};
    mainMenuCoverBg: #${base00};
    mainMenuCoverFg: #${base05};

    # checkbox and radio buttons
    checkboxFg: #${base05};

    # slider (notifications and sounds)
    sliderBgInactive: #${base01};
    sliderBgActive: #${base05};

    # --- Scroll in CHAT --- 
    historyScrollBarBg: #${base05};
    historyScrollBarBgOver: #${base05};
    historyScrollBg: #${base01};
    historyScrollBgOver: #${base05};

    # --- Scroll in CHAT LIST --- 
    # bar itself
    scrollBarBg: #${base01};
    scrollBarBgOver: #${base01};
    # only bg
    scrollBg: #${base01};
    scrollBgOver: #${base00};

    # --- Text ---
    windowSubTextFg: #${base05};
    windowSubTextFgOver: #${base0B};
    windowBoldFg: #${base05};
    windowBoldFgOver: #${base0B};
    windowActiveTextFg: #${base05};

    # --- Media player ---
    # fg status line for bg active player 
    windowBgActive: #${base0D};

    # --- Top compact media player ---
    mediaPlayerBg: #${base00};
    mediaPlayerActiveFg: #${base05};
    mediaPlayerInactiveFg: #${base03};
    mediaPlayerDisabledFg: #${base03};

    # --- Media in full screen ---
    # loading icon
    radialFg: #${base05};
    radialBg: #${base00};

    # menu text fg
    mediaviewMenuFg: windowBoldFg;

    # statick bg of speed line
    mediaviewMenuBgOver: menuBgOver;

    # bg for media
    mediaviewBg: #000000;
    mediaviewVideoBg: imageBg;

    # fg for media
    mediaviewControlFg: #${base05};

    # caption for photo
    mediaviewCaptionBg: #00000080;
    mediaviewCaptionFg: #${base05};
    mediaviewTextLinkFg: #${base0D};

    # when clicked save button
    mediaviewSaveMsgBg: toastBg;
    mediaviewSaveMsgFg: toastFg;

    # video player
    mediaviewPlaybackActive: #${base05};
    mediaviewPlaybackInactive: #${base02};
    mediaviewPlaybackActiveOver: #${base05};
    mediaviewPlaybackInactiveOver: windowSubTextFgOver;
    mediaviewPlaybackProgressFg: #${base03};
    mediaviewPlaybackIconFg: mediaviewPlaybackActive;
    mediaviewPlaybackIconFgOver: mediaviewPlaybackActiveOver;

    # transparent layer (for png)
    mediaviewTransparentBg: #000000ff;
    mediaviewTransparentFg: #${base05};

    # --- Effects ---
    titleShadow: #00000000;
    windowShadowFg: #00000000;
    windowShadowFgFallback: #00000000;
    shadowFg: #00000000;
    slideFadeOutBg: #00000000;
    slideFadeOutShadowFg: #00000000;
    imageBg: #000000ff;
    imageBgTransparent: #000000ff;
    # Side bar shade
    layerBg: #00000000;

    # input messages in chat
    msgInShadow: #00000000;
    msgInShadowSelected: #00000000;

    # output messages in chat
    msgOutShadow: #00000000;
    msgOutShadowSelected: #00000000;
    
    # --- Cancel operation button ---
    lightButtonBg: #${base01};
    lightButtonBgOver: #${base01};
    lightButtonBgRipple: #${base02};
    lightButtonFg: activeButtonFg;
    lightButtonFgOver: lightButtonFg;
    
    # --- Attention (log out button) ---
    attentionButtonFg: #${base05};
    attentionButtonFgOver: #${base08};
    attentionButtonBgOver: #${base05};
    attentionButtonBgRipple: #${base08};

    # --- ??? ---
    windowFgActive: #${base00};
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

    # --- Close button in notifications? ---
    smallCloseIconFg: #${base05};
    smallCloseIconFgOver: #${base03};
    
    # --- Message input box ---
    # text and cursor
    placeholderFg: windowSubTextFg;
    placeholderFgActive: #${base03};
    # area
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

    # --- Menu when hover message's clock ---
    tooltipBg: #${base07};
    tooltipFg: #${base0D};
    tooltipBorderFg: #${base05};

    # --- System tray icon (Nevermind for me) ---
    trayCounterBg: #${base01};
    trayCounterBgMute: #${base04};
    trayCounterFg: #${base05};
    trayCounterBgMacInvert: #${base05};
    trayCounterFgMacInvert: #${base00};

    # --- Contacts menu ---
    contactsBg: #${base00};
    contactsBgOver: windowBgOver;
    contactsNameFg: boxTextFg;
    contactsStatusFg: windowSubTextFg;
    contactsStatusFgOver: windowSubTextFgOver;
    contactsStatusFgOnline: #${base05};

    # --- Photo editor ---
    photoCropFadeBg: #${base01}7f;
    photoCropPointFg: #${base03}7f;

    # --- Login menu? ---
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

    # --- SMS/PUSH input box? ---
    inputBorderFg: #${base03};
    filterInputBorderFg: #${base02};
    filterInputInactiveBg: #${base02};

    # --- List of chats, channels and bots ---
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

    # --- Search ---
    # bottom bar
    searchedBarBg: #${base00};
    searchedBarFg: #${base05};

    # --- Emoji, stickers, GIFs panel ---
    emojiPanBg: #${base00};
    emojiPanCategories: #${base00};
    emojiPanHeaderFg: #${base05};
    # emoji category fg
    emojiIconFg: #${base05};

    # it does not works...
    emojiPanHeaderBg: #${base03};

    # delete icon for sticker
    stickerPanDeleteBg: #${base01};
    stickerPanDeleteFg: #${base05};

    # full screen bg
    stickerPreviewBg: #${base00}80;

    # --- In chat ---
    # chat top bar
    topBarBg: #${base00};
    
    # idk ok?
    reportSpamBg: #${base00};
    reportSpamFg: #${base05};

    # Media in msg wheh msg selected
    msgSelectOverlay: #${base0D}ff;
    msgStickerOverlay: #${base0D}ff;

    # sound icon in msg media
    historyFileThumbIconFg: msgInBg;
    historyFileThumbIconFgSelected: #${base0D};

    # media download animation in msg
    historyFileThumbRadialFg: historyFileThumbIconFg;
    historyFileThumbRadialFgSelected: historyFileThumbIconFgSelected;

    # servis msg is msg of chat itself
    msgServiceFg: #${base05};
    msgServiceBg: #${base01};
    msgServiceBgSelected: #${base02};

    # date on image in msg
    msgDateImgFg: #${base05};
    msgDateImgBg: #${base01};
    msgDateImgBgOver: #${base01};
    msgDateImgBgSelected: #${base00};

    # bot buttons
    msgBotKbOverBgAdd: msgServiceBg;
    msgBotKbIconFg: msgServiceFg;
    msgBotKbRippleBg: menuBgRipple;

    # --- Input message in chat ---
    historyTextInFg: #${base05};
    historyTextInFgSelected: #${base00};
    historyCaptionInFg: historyTextInFg;
    historyFileNameInFg: historyTextInFg;
    historySendingInIconFg: #${base04};
    msgInBg: #${base01};
    msgInBgSelected: #${base0D};
    msgInServiceFg: #${base05};
    msgInServiceFgSelected: #${base05};
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
    msgWaveformInInactive: #${base03};
    msgWaveformInInactiveSelected: #${base02};
    mediaInFg: msgInDateFg;
    mediaInFgSelected: msgInDateFgSelected;
    historyLinkInFg: #${base08};

    # --- Output message in chat (from me) ---
    historyTextOutFg: #${base05};
    historyCaptionOutFg: historyTextOutFg;
    historyFileNameOutFg: historyTextOutFg;
    historyOutIconFg: dialogsSentIconFg;
    historyOutIconFgSelected: #${base00};
    historySendingOutIconFg: #${base04};
    msgOutBg: #${base01};
    msgOutBgSelected: #${base0D}ff;
    msgOutDateFg: #${base05};
    msgOutDateFgSelected: #${base00};
    msgOutServiceFg: #${base0D};
    msgOutServiceFgSelected: activeLineFg;
    msgOutMonoFg: #${base05};
    msgOutReplyBarColor: #${base05};
    msgOutReplyBarSelColor: #${base05};
    historyFileOutIconFg: msgOutBg;
    historyFileOutIconFgSelected: #${base0D};
    historyFileOutRadialFg: historyFileOutIconFg;
    historyFileOutRadialFgSelected: historyFileOutIconFgSelected;
    msgFileThumbLinkOutFg: windowActiveTextFg;
    msgFileThumbLinkOutFgSelected: windowActiveTextFg;
    msgFileOutBg: windowBoldFg;
    msgFileOutBgOver: windowSubTextFgOver;
    msgFileOutBgSelected: windowBoldFg;
    msgWaveformOutActive: #${base05};
    msgWaveformOutActiveSelected: #${base02};
    msgWaveformOutInactive: #${base01};
    msgWaveformOutInactiveSelected: msgInBgSelected;
    mediaOutFg: msgOutDateFg;
    mediaOutFgSelected: msgOutDateFgSelected;
    historyLinkOutFg: #${base08};
    
    # --- User withoin avatar ---
    # default initials color
    historyPeerUserpicFg: #${base01};

    # red user avatar
    historyPeer1NameFg: #${base08};
    historyPeer1UserpicBg: #${base08};
    
    # green user avatar
    historyPeer2NameFg: #${base0B};
    historyPeer2UserpicBg: #${base0B};

    # yellow user avatar
    historyPeer3NameFg: #${base0A};
    historyPeer3UserpicBg: #${base0A};

    # blue user avatar
    historyPeer4NameFg: #${base0C};
    historyPeer4UserpicBg: #${base0C};

    # purple user avatar
    historyPeer5NameFg: #${base09};
    historyPeer5UserpicBg: #${base09};

    # pink user avatar
    historyPeer6NameFg: #${base0E};
    historyPeer6UserpicBg: #${base0E};

    # sea user avatar
    historyPeer7NameFg: #${base0D};
    historyPeer7UserpicBg: #${base0D};

    # orange user avatar
    historyPeer8NameFg: #${base0F};
    historyPeer8UserpicBg: #${base0F};

    # --- Files/links ---
    # blue file or link
    msgFile1Bg: #${base01};
    msgFile1BgDark: #${base05};
    msgFile1BgOver: #${base04};
    msgFile1BgSelected: #${base04};

    # green file or link
    msgFile2Bg: #${base01};
    msgFile2BgDark: #${base05};
    msgFile2BgOver: #${base04};
    msgFile2BgSelected: #${base04};

    # red file or link
    msgFile3Bg: #${base01};
    msgFile3BgDark: #${base05};
    msgFile3BgOver: #${base04};
    msgFile3BgSelected: #${base04};

    # yellow file or link
    msgFile4Bg: #${base01};
    msgFile4BgDark: #${base05};
    msgFile4BgOver: #${base04};
    msgFile4BgSelected: #${base04};

    # youtube
    youtubePlayIconBg: #00000080;
    youtubePlayIconFg: #${base05};

    # other video links
    videoPlayIconBg: #00000080;
    videoPlayIconFg: #${base05};

    # link for t.me ?
    toastBg: #${base00};
    toastFg: #${base05};

    # --- Side bar ---
    sideBarBg: #${base00};
    sideBarBgActive: #${base01};
    sideBarIconFg: #${base03};
    sideBarIconFgActive: #${base0D};

    sideBarBadgeBg: #${base0D};
    # non active or muted badge
    sideBarBadgeBgMuted: #${base03};

    # text in badge
    sideBarBadgeFg: #${base00};

    # both work like active lol
    sideBarTextFgActive: #${base0D};
    sideBarTextFg: #${base03};

    # bg animation when icon clicked
    sideBarBgRipple: #${base08};

    # filter? it's search box in chat list. fuck you telegram
    filterInputActiveBg: #${base0D};    
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
