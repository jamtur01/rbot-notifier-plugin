require 'rubygems'
require 'xmpp4r-simple'

class NotifierPlugin < Plugin

        Config.register Config::StringValue.new('notifier.nick',
                :default => nil, :requires_restart => false,
                :desc => "The nick and corresponding Jabber ID, separated by a colon, " +
                         "for example jamesturnbull:jamtur01@gmail.com" )
        Config.register Config::StringValue.new('notifier.jabber_user',
                :default => nil, :requires_restart => false,
                :desc => "The Jabber user" )
        Config.register Config::StringValue.new('notifier.jabber_password',
                :default => nil, :requires_restart => false,
                :desc => "The Jabber password" )

	def help(plugin, topic = "")
		case topic
			when '':
				"notifier: Notifies users when their nick is used."
		end
	end

	def listen(m)
                nick, target = @bot.config['notifier.nick'].split(':')
                debug "We're monitoring #{nick} and notifying #{target}"

                return unless m.message =~ /#{nick}/

                notify(m, target)
        end

	private
        def notify(m, target)

          # Uncomment the below for the world's most verbose Jabber logging
          # Jabber::debug = true

          user = @bot.config['notifier.jabber_user']
          password = @bot.config['notifier.jabber_password']

          debug "The Jabber user is #{user} and the password is #{password}"

          im = Jabber::Simple.new(user, password)
          im.add(target)

          debug "We're going to tell #{target} the message: #{m.message}"

          im.deliver(target, m.message)

        end
end

plugin = NotifierPlugin.new
