---
layout: post
title: Slowness in GitLab CI Pipelines
---

[GitLab CI](https://gitlab.com/gitlab-org/gitlab-ci-multi-runner) pipelines have radically improved my development process. I was very impressed with the ease of setup, and it has been humming along for some months without much issue.

Over time, I've noticed that pipelines were taking longer than they really should. Jobs which should have taken 30-40 seconds were running over 5 minutes. These weren't particularly complex pipelines either; simple `npm install` stages were sometimes over 8 minutes on their own!

Naturally, this is a big problem when pipelines are running nearly continuously for a development team, especially since I have only one GitLab CI multi-runner server handling build requests in a `shell` executor.

After a lot of Googling and research, I came up empty handed. However, a simple fix presented itself when I noticed that rebooting the GitLab CI multi-runner server allowed builds to run much faster. The build times increased slowly over a few days of the server running continuously, but would be fine again after a reboot.

Interestingly, the `/tmp` directory on the server is growing incredibly quickly, and without something to clear that directory out it grew to take up most of the free system space. While I haven't yet figured out exactly what is filling it up, I have implemented a temporary solution of simply rebooting the server nightly which has been working well.

For Ubuntu:  
`sudo crontab -e`
```
# MIN HOUR DAY MONTH DAYOFWEEK	COMMAND
# reboot the server every night
0 3 * * * /sbin/shutdown -r +5
# clear the cache for gitlab-runner on Sunday mornings
0 2 * * Sun rm -rf /home/gitlab-runner/cache
```

This cron job will reboot my GitLab CI multi-runner server every night at 3AM, giving a 5 minute warning to anyone logged into the server, just in case. This allows the runner server to clear out the `/tmp` directory on its own, while also killing any stray processes that may be running. This cron setup also removes the gitlab-runner cache once per week so it doesn't fill up either.

Most of the pipelines run through this CI system are relatively simple; no artifacts are shared and stages run sequentially, but I have not seen any side-effects so far. This also works fine because the CI multi-runner is set up on an entirely different machine than the [GitLab](https://gitlab.com/gitlab-org/gitlab-ce) on-premise installation, so rebooting it will not affect the rest of the projects' availability.

I am sharing this because it seems like a quick way to improve build speeds in my case, but I completely overlooked this in my investigation. If I can find the real root-cause of this problem there may be a better solution, but for a temporary, hands-off solution this appears to be doing the trick.

Best of luck!
