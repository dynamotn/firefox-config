// === GENENRAL ===
// Startup
/* Set START page
 * 0=blank, 1=home, 2=last visited page, 3=resume previous session
 * [SETTING] General->Startup->Restore previous session */
user_pref("browser.startup.page", 3);
/* Warn when quitting browser
 * [SETTING] General->Startup->Warn you when quitting the browser */
user_pref("browser.sessionstore.warnOnQuit", true);

// Language and Appearance
/* Set font for languages
 * [SETTING] General->Language and Appearance->Fonts and Colors */
user_pref("font.default.x-western", "sans-serif"); // Change Latin to Sans-serif
/* Set preferred language for displaying web pages
 * [SETTING] General->Language and Appearance->Language->Choose your preferred language for displaying pages */
user_pref("intl.accept_languages", "en-US, vi");

// Files and Applications
/* Ask where to save before download
 * [SETTING] General->Files and Applications->Downloads */
user_pref("browser.download.useDownloadDir", false);
/* Play DRM content
 * [SETTING] General->Files and Applications->Digital Rights Management (DRM) Content */
user_pref("media.eme.enabled", true);

// Performance
/* Use recommended performance settings
 * [SETTING] General->Performance->Use recommended performance settings */
user_pref("browser.preferences.defaultPerformanceSettings.enabled", true);

// Browsing
/* Use autoscrolling
 * [SETTING] General->Browsing->Use autoscrolling */
user_pref("general.autoScroll", true);
/* Use smooth scrolling
 * [SETTING] General->Browsing->Use smooth scrolling */
user_pref("general.smoothScroll", true);

// Network Settings
/* Enable DNS over HTTPS
 * 0=Native DNS from network, 1=Reserved, 2=Use DoH before native, 3=Only DoH
 * [SETTING] General->Network Settings->Enable DNS over HTTPS*/
user_pref("network.trr.mode", 2);

// === HOME ===
// Set HOME+NEWWINDOW page
user_pref("browser.startup.homepage", "about:home");

// === SEARCH ===
// Set search region
user_pref("browser.search.region", "VN");
/* Enable search in location bar */
user_pref("keyword.enabled", true);

// === PRIVACY & SECURITY ===
// Password
/* Disable saving passwords */
user_pref("signon.rememberSignons", false);

// History
/* Set what items to clear on shutdown
 * [SETTING] Privacy & Security->History->Custom Settings->Clear history when Firefox closes->Settings */
user_pref("privacy.clearOnShutdown.cache", true);
user_pref("privacy.clearOnShutdown.cookies", false);
user_pref("privacy.clearOnShutdown.downloads", true); // Download History
user_pref("privacy.clearOnShutdown.formdata", true); // Form & Search History
user_pref("privacy.clearOnShutdown.history", false); // Browsing & Download History
user_pref("privacy.clearOnShutdown.offlineApps", true); // Offline Website Data
user_pref("privacy.clearOnShutdown.sessions", false); // Active Logins
user_pref("privacy.clearOnShutdown.siteSettings", false); // Site Preferences
/* Enable browsing and download history
 * [SETTING] Privacy & Security->History->Custom Settings->Remember browsing and download history */
user_pref("places.history.enabled", true);

// Other
/* Disable RFP letterboxing */
user_pref("privacy.resistFingerprinting.letterboxing", false);

// === THEME ===
/* Enable customChrome.css */
user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);
/* Enable GPU acceleration */
user_pref("layers.acceleration.force-enabled", true);
/* Enable WebRender to render page faster */
user_pref("gfx.webrender.all", true);
user_pref("gfx.webrender.enabled", true);
/* Enable transparent */
user_pref("layout.css.backdrop-filter.enabled", true);
/* Allow SVG CSS */
user_pref("svg.context-properties.content.enabled", true);
