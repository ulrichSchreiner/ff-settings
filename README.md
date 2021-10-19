# Firefox Settings

Have you ever change your firefox settings with `about:config` and forgot about it?
When changing your computer or if you work on different computers it is awesome
to remind the settings and do the changes in every instance.

So you have to create a `user.js` file and put it in your profile. But ... where
is your profile?

I created this service as a systemd user service. You can create a file
~~~
$HOME/.config/ff-settings/user.js
~~~
and the service will symlink this file into all firefox profiles.

## Installation

At the moment there is only a script, simply do a
~~~
$ sudo ./local-install.sh
$ systemctl --user enable ff-settings
~~~

Now create a file `$HOME/.config/ff-settings/user.js` like this:
~~~js
 user_pref("browser.startup.homepage", "https://www.google.com");
~~~

and now start the service:
~~~
$ systemctl --user restart ff-settings
~~~

As the service creates symlinks you can now edit the file without restart the service
(but you have to restart firefox as the browser reads the config only at startup).


## Advantages

I
 - only have to manage this single file and enable the service.
 - do not care about my exact profile name and directory
 - can use `ansible` to create host specific `user.js` files
 - have one place where i can manage my config customization

## Disadvantages

 - You have to restart firefox when a setting changes
 - The File is linked in **all** profiles, so if you have Firefox and Firefox
   Nightly and want different customizations this will not work


