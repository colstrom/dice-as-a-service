v0.0.1
======
  New
    - Rolls 1d6, prints the result, and exits.
  Limitations
    - While the method accepts parameters, there is no way to use them!

v0.1.0
======
  New
    - Interactive prompt for number of dice.
  Limitations
    - Still can't select how many sides the dice have.
  Notes
    - gets returns a string, but we need a number. to_i does this, and resolves:
      `undefined method `times' for "2\n":String (NoMethodError)`

v0.1.1
------
  New
    - Interactive prompt for sides per die.
  Limitations
    - Interactive prompts are inconvenient for invocation from scripts.

v0.1.2
------
  New
    - Added 'highline' gem to simplify user input, improves clarity.
  Limitations
    - Interactive prompts are inconvenient for invocation from scripts.

v0.2.0
======
  New
    - Non-interactive configuration with commandline arguments.
    - Falls back to interactive prompt if missing arguments.
  Limitations
    - Positional arguments are non-intuitive.
    - Cannot specify ONLY sides without dice.

v0.2.1
------
  New
    - Added '-h' option for runtime help.
  Limitations
    - Same as previous version.
    - Documentation is compensating for non-intuitive interface.

v0.2.2
------
  New
    - Added '-v' option to display version.
  Limitations
    - Same as previous version.

v0.2.3
------
  New
    - Added 'commander' gem to simplify arguments and generate documentation.
  Limitations
    - Same as previous version.

v0.2.4
------
  New
    - Named arguments with commander.
    - Improved runtime help.

v0.2.5
------
  New
    - Revised to not import commander into the global namespace.

v0.3.0
======
  New
    - Added an option to provide dice-rolling as a service.
  Limitatons
    - Nothing written to access the service!

v0.3.1
------
  New
    - Added client to access the service.
  Limitations
    - Server makes all the decisions! We'd need to run multiple services for 
      different dice/sides combinations.

v0.3.2
------
  New
    - Changed service mode from options to command, as logic diverged from roll.
    - Added primitive serialize/deserialize methods.
    - Pass request string into 'provides' lambda.
  Limitations
    - Client can only connect to local service.

v0.4.0
======
  New
    - Basic pub/sub support. Just publishing rolls for now!
  Limitations
    - Nothing consuming the published data.

v0.4.1
------
  New
    - Consuming published data with subscriber.
  Limitations
    - Everything is published on one channel, and subscribed to indiscriminately.

v0.4.2
------
  New
    - Client can now specify topic for request.
    - (De)serialization methods updated to account for additional parameter.
    - Server will publish with requested topic.
  Limitations
    - Can publish on different channels, but the observer sees all.

v0.4.3
------
  New
    - Added 'private' topic that will not broadcast (enforced server-side).

v0.5.0
======
  New
    - Added methods to Commander::Command::Options to convert to string, array, hash.
    - Serialization method does not need updating for every new option.
    - Deserialization updated to expect this data.
  Limitations
    - Eval allows remote code execution.

v0.5.1
------
  New
    - Replaced custom (de)serialization with JSON.
  Limitations
    - Published responses have no context.

v0.6.0
======
  New
    - Included request in response payload.

v0.6.1
------
  New
    - Added stats observer. Tracks statistics from roll history.
    - Added gem 'descriptive_statistics' to handle stats calculation.

v0.7.0
======
  New
    - Added service to stats observer, and port option to client.
    - Sending a request to port 5554 should call the stats service.
  Limitations
    - Since the loops are endless, and recv_string is blocking, server won't be 
    called until subscribe returns...

v0.7.1
------
  New
    - Threading to the rescue! Both the subscriber and server methods can run 
    concurrently. They share access to the global variable $history.
  Limitations
    - Stats only account for rolls observed over the life of the stats observer.

v0.8.0
======
  New
    - Persistence! Stats are recorded on-disk, and loaded at startup.

v0.9.0
======
  New
    - Added HTTP interface, connects to existing services.
