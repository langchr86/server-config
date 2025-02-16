Homepage Dashboard
========


Access tokens
-------------

Some services need to have an access token that can be used to receive status information to show on the dashboard.
The following services need to generate an access token which then needs to be included in the `homepage.env`.

* Jellyfin

The environment file is created initially and is not overwritten by later ansible executions.
After the file was completed we need to restart the container:

~~~~~~
systemctl restart homepage
~~~~~~


Documentation
-------------

This part was inspired by: [Techno Tim](https://technotim.live/posts/homepage-dashboard/)

Main documentation can be found here: [gethomepage.dev](https://gethomepage.dev/)
