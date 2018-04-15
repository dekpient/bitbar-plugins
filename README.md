# BitBar Plugins

![Bamboo Bitbucket and GitHub Trending Menu Icons](screenshots/menu-bar-icons.png?raw=true "Menubar Icons")

From left to right:

* [Bamboo](#bamboo-build-status)
* [Bitbucket PRs](#bitbucket-server-pull-requests)
* [GitHub Trending](#github-trending)

## Bamboo Build Status

* Shows the status of a list of Bamboo builds along with its latest build time, latest build duration and test summary
* Can be enabled only on work machine

![Bamboo Plugin Main View](screenshots/bamboo-main.png?raw=true "Bamboo Main Menu")
![Bamboo Plugin Alt View](screenshots/bamboo-alt.png?raw=true "Bamboo Alt Menu")

## Bitbucket Server Pull Requests

* Shows a list of open pull requests on your personal Bitbucket Server Dashboard with color coding and icons
    * Yellow represents a PR that is reviewed and 'NEEDS WORK'
    * Green represents an approved PR
* Shows the relative time since last update for PRs you're reviewing
* Shows the warning icon (:warning:) if there's a conflict
* Shows the number of comments for PRs you're authoring
* Can be enabled only on work machine

![Bitbucket Pull Requests Plugin](screenshots/bitbucket-prs.png?raw=true "Bitbucket PRs")

## GitHub Trending

Shows a list of trending repositories for selected languages. Data retrieval for multiple languages is done in parallel.

![GitHub Trending Plugin Main View](screenshots/github-trending-main.png?raw=true "GitHub Trending")
![GitHub Trending Plugin Submenu View](screenshots/github-trending-submenu.png?raw=true "GitHub Trending Submenu")

## GitHub Notification

* Modified from [this plugin](https://raw.githubusercontent.com/matryer/bitbar-plugins/master/Dev/GitHub/notifications.30s.py) to work with Python 3
* Everything else is pretty much the same
