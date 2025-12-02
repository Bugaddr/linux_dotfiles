/** NEW TAB & UI CLEANUP **/
user_pref("browser.aboutwelcome.enabled", false); // Disable welcome splash
user_pref("browser.newtabpage.activity-stream.feeds.section.topstories", false); // Disable Pocket stories
user_pref("browser.newtabpage.activity-stream.feeds.topsites", false); // Disable Top Sites
user_pref("browser.newtabpage.enabled", true); // Keep New Tab page enabled (for local files/blank)
user_pref("browser.preferences.moreFromMozilla", false); // Hide "More from Mozilla"
user_pref("browser.promo.focus.enabled", false); // Disable Focus promo
user_pref("browser.vpn_promo.enabled", false); // Disable VPN promo
user_pref("extensions.pocket.enabled", false); // Disable Pocket completely
user_pref("extensions.htmlaboutaddons.recommendations.enabled", false); // Remove recommendations in Add-ons manager
user_pref("browser.urlbar.suggest.topsites", false); // Clean up URL bar suggestions
user_pref("browser.toolbars.bookmarks.visibility", "never");

/** MOUSE & BEHAVIOR **/
user_pref("browser.ctrlTab.sortByRecentlyUsed", true); // Ctrl+Tab cycles by usage
user_pref("general.autoScroll", true); // Middle-click auto-scroll
user_pref("middlemouse.paste", false); // Disable middle-click paste (Standard Linux prevention)

/** DOWNLOADS **/
user_pref("browser.download.dir", "/home/bugaddr/Downloads/Firefox");
user_pref("browser.download.folderList", 2);

/** SECURITY & PRIVACY **/
user_pref("signon.rememberSignons", false); // Disable password manager

/** NETWORKING (DNS-over-HTTPS) **/
user_pref("network.trr.mode", 3);
user_pref("network.trr.uri", "https://family.cloudflare-dns.com/dns-query");

/** GRAPHICS & LINUX/NVIDIA ACCELERATION **/
user_pref("gfx.x11-egl.force-enabled", true); // Required for NVIDIA VA-API on X11
user_pref("media.ffmpeg.vaapi.enabled", true); // Explicitly enable VA-API FF<137
user_pref("media.hardware-video-decoding.force-enabled", true); // Force HW decoding FF<137
user_pref("widget.dmabuf.force-enabled", true); // Enable DMABuf
user_pref("gfx.webrender.all", true); // Force WebRender (Recommended for NVIDIA)
user_pred("gfx.webrender.layer-compositor", true); // Fix slow youtube

/** HISTORY & SANITIZATION **/
user_pref("privacy.clearHistory.browsingHistoryAndDownloads", true);
user_pref("privacy.clearOnShutdown_v2.browsingHistoryAndDownloads", true);
user_pref("privacy.clearOnShutdown_v2.downloads", true);
user_pref("privacy.clearSiteData.browsingHistoryAndDownloads", true);
