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
