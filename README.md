# Mastermind

[Mastermind](https://en.wikipedia.org/wiki/Mastermind_(board_game)) is a two player, code-breaking board game. Players take on one of two roles; the **codemaker** or the **codebreaker**.

The codemaker chooses an ordering of four colored *code pegs*, hidden from the codebreaker. The six possible colors are represented as follows:

> `A`, `B`, `C`, `D`, `E`, `F`

The codebreaker proceeds to guess the ordering, placing four code pegs on the board. 

After each guess, the codemaker responds by placing up to four _key pegs_ on the board. The key pegs come in two variants:

> `P` : Indicates one of the *code pegs* is ***both*** the correct color and in the correct position.
> 
>`C` : Indicates one of the *code pegs* is the correct color, but in the incorrect position.

  
Play continues for twelve turns. The game ends when the codebreaker guesses the correct code, or if all twelve turns pass without the codebreaker guessing correctly.

To initiate a game, simply run

> `ruby mastermind.rb`