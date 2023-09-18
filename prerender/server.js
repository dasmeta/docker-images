const prerender = require("prerender");
const cache = require("prerender-memory-cache");


const server = prerender({
    chromeLocation: "/usr/bin/chromium-browser",
    forwardHeaders: true,
    chromeFlags: [
        "--headless",
        "--disable-gpu",
        "--remote-debugging-port=9222",
        "--no-sandbox",
        "--hide-scrollbars",
        "--disable-dev-shm-usage",
    ]
});

server.use(prerender.blacklist());
server.use(prerender.httpHeaders());
server.use(prerender.removeScriptTags());

if (process.env.CACHE_ENABLED === "true") {
    server.use(cache);
}

server.start();