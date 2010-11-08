Notifier Plugin for Rbot
========================

Copyright @2010 James Turnbull <james@lovedthanlost.net>

Licensed: GPLv3

Requires
--------

Requires the following:

* xmpp4r-simple

Install
-------

1.  Copy into the Rbot plugins directory
2.  Add it to list of loaded Rbot plugins
3.  Restart Rbot

Usage
-----

Sends notifications when your nick is used in a channel.  It requires you have a Jabber user and password.

Specify a matching pair of nick and Jabber ID to notify in the notifier.nick configuration setting, for example:

    notifier.nick: "jamesturnbull:jamtur01@gmail.com"
