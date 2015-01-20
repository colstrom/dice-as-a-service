dice-as-a-service.rb
=================

Example for Developing Networked Software with Ruby
---------------------------------------------------

This repository demonstrates one way to build networked software in Ruby.

Expected Functionality
----------------------

1. Roll a number of dice with a number of sides.
2. Allow a user to set dice or sides interactively or with arguments.
3. Includes runtime documentation.
4. Provides the dice-rolling as a network-accessible service.
5. Broadcasts the rolls to allow auditing.
6. Can specify an (optional) topic/channel for the rolls to broadcast on.
7. Rolls can be private.
8. Data is represented in an interoperable format.
9. Stats service that tracks historic rolls.
10. Persistent data storage.
11. HTTP Interface.

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
