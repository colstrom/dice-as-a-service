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
