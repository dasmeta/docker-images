# Why
Basic php-fpm image that can be used along nginx.

Has composer and opcache configured by default with minimum values that is suitable for small application for dev envs.

## Notes
Consider adjusting opcache.memory_consumption to be 20-30% of total memory assigned to the container.
