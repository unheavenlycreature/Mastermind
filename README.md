# Mastermind

[Mastermind](https://en.wikipedia.org/wiki/Mastermind_(board_game)) is a two player, code-breaking board game. Players take on one of two roles; the **codemaker** or the **codebreaker**.

The codemaker chooses an ordering of four colored _code pegs_, hidden from the codebreaker. The six possible colors are represented as follows:

> R, G, B, Y, O, V

The codebreaker proceeds to guess the ordering, placing four code pegs on the board. After each guess, the codemaker responds by placing up to four _key pegs_ on the board. The key pegs come in two variants:

- **W** : Indicates a peg with the correct color but incorrect position.
- **B** : Indicates a peg with the correct color and correct position
  
Play continues for twelve turns. The game ends when the codebreaker guesses the correct code, or if all twelve turns pass without the codebreaker guessing correctly.