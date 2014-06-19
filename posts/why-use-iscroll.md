# why do i use iscroll

After days of evaluation, I came to the conclusion that there is no framework or library out there that fits all my needs. So, the only choice left was to create a custom solution for each operating system. This is what I came up with:

iOS < 5: iScroll
iOS >= 5: Native scrolling via CSS properties overflow-y:auto and -webkit-overflow-scrolling:touch. Pull-to-refresh via https://github.com/dantipa/pull-to-refresh-js
Android: iScroll
WP8: Native scrolling via overflow-y:auto. Own implementation for pull-to-refresh (very tricky).
