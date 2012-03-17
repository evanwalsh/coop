# Coop! The Ruby gem! [![Build Status](https://secure.travis-ci.org/evanwalsh/coop.png?branch=master)](http://travis-ci.org/evanwalsh/coop) [![Dependency Status](https://gemnasium.com/evanwalsh/coop.png)](https://gemnasium.com/evanwalsh/coop)

Ok, so let's say that you're the kind of person that wants to interact with Co-op via its API.

You've come to the right place.

## Installation and setup

To install it, just run `gem install coop` from the command line or add `gem 'coop'` to your project's Gemfile.

Now, to use it in your code, do this, but substitute in your own Co-op login details:

    coop = Coop.new("user_email@example.com", "user_password123")

That's just the beginning, though.

## Usage

With your new Co-op API object, you can access all the API features you'd need.

First, you'll need a group object.

    group = coop.group(12345)

### Statuses

That'll give you access to a whole load of stuff. If you want statuses, use this:

    group.statuses

You'll get an object that'll let you use .recent and .where on that to get either the most recent 50 statuses or to get statuses by user or date.

    group.statuses.recent
    group.statuses.where({ user_id: 54321, date: Date.today })

You'll get an array of Coop::Status objects, with all the attributes you'd expect. Cool.

Finally, posting a status update is pretty simple.

    group.post! "This is a status update"

Also, you can use `.post_as_cobot!` instead to, well, post as Cobot. Just add another argument with your secret key, like so:

    group.post_as_cobot! "This is Cobot. Beep boop.", "MySuperSecretAPIKeyFromCoOp"

### Agendas

Also, you can mess with the group's agendas API. Try this:

    group.agenda

It returns a Coop::Agenda object, with `.global`, `.users`, `.user`, which will give you the group's agenda, all the user's individual agendas, and the authenticated user's agenda, respectively.

### Users

You can get info about a specific user or a group's users. It's pretty simple.

For a group's users, just try this:

    group.users.all

That'll get you the info dump of all the users. For a _specific_ user, you need their id. Then, you call:

    group.users.find(12345)

Where "12345" would be that user's id. That'll get you just info for that user.

### The rest of the API

In further versions of the gem, I'll be implementing the rest of the API. I want to keep it focused, for now. Also, the current Co-op API isn't working completely, so that's another roadblock that should be cleared up soon. I hope.