dice-as-a-service.rb
=================

Example for Developing Networked Software with Ruby
---------------------------------------------------

This repository demonstrates one way to build networked software in Ruby.

Expected Functionality
----------------------

Roll a number of dice with a number of sides.
Allow a user to set dice or sides interactively or with arguments.
Includes runtime documentation.
Provides the dice-rolling as a network-accessible service.

Requirements
------------

A working installation of Ruby, version 2.0 or higher.

Basic knowledge of Ruby is assumed, but not required. The example is deliberately simple, and each iteration should introduce a single new concept.

Operating System Notes
----------------------

As this relies on [ffi-rzmq](https://github.com/chuckremes/ffi-rzmq), you will need to have the zeromq libraries available.

For OSX, [Homebrew](http://brew.sh/) is probably the easiest way to handle this:

```brew install zeromq```

For Ubuntu, [Chris Lea's PPA](https://launchpad.net/~chris-lea/+archive/ubuntu/zeromq) is a good choice:

```
sudo add-apt-repository ppa:chris-lea/zeromq
sudo aptitude update
sudo aptitude install libzmq3-dev
```

For Windows, you should really consult the [ØMQ documentation](http://zeromq.org/docs:windows-installations).
