// Startup & Homepage
user_pref("browser.startup.page", 1);  // Open homepage on startup
user_pref("browser.startup.homepage", "file:///home/bugaddr/Documents/Git/daily_digest/index.html");  // Local HTML as homepage

// New Tab & UI Elements
user_pref("browser.newtabpage.enabled", true);  // Enable new tab page
user_pref("browser.newtabpage.activity-stream.feeds.section.topstories", false);  // Disable Pocket recommendations
user_pref("browser.newtabpage.activity-stream.feeds.topsites", false);  // Disable Top Sites section
user_pref("browser.toolbars.bookmarks.visibility", "never");  // Show bookmarks toolbar only on new tab
user_pref("browser.preferences.moreFromMozilla", false);  // Hide "More from Mozilla" section
user_pref("extensions.pocket.enabled", false);  // Disable Pocket integration

// Mouse & Tab Behavior
user_pref("browser.ctrlTab.sortByRecentlyUsed", true);  // Cycle tabs by recent usage (Ctrl+Tab)
user_pref("general.autoScroll", true);  // Enable auto-scrolling with middle click
user_pref("middlemouse.paste", false);  // Disable middle-click paste (Linux behavior)

// Accounts & Profiles
user_pref("identity.fxaccounts.toolbar.pxiToolbarEnabled", false);  // Disable Firefox Account PXI toolbar
user_pref("browser.profiles.enabled", true); // Enable profile manager

// Downloads
user_pref("browser.download.folderList", 2);  // Use specified download directory
user_pref("browser.download.dir", "/home/bugaddr/Downloads/Firefox");  // Set custom download folder

// Security & Privacy
user_pref("signon.rememberSignons", false);  // Disable password saving

// Networking (DNS-over-HTTPS)
user_pref("network.trr.mode", 3);  // TRR only (DoH without fallback)
user_pref("network.trr.uri", "https://cloudflare-dns.com/dns-query");  // Set DoH URI (Cloudflare Family)

// Graphics & Hardware Acceleration https://github.com/elFarto/nvidia-vaapi-driver?tab=readme-ov-file#firefox
user_pref("media.hardware-video-decoding.force-enabled", true);  // Enable VA-API hardware video decoding
user_pref("gfx.x11-egl.force-enabled", true);  // Force EGL on X11
user_pref("widget.dmabuf.force-enabled", true);  // Enable DMA-BUF for better rendering
