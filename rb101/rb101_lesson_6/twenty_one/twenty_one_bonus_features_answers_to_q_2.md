Question 2.<br>
We use the play_again? three times: after the player busts, after the dealer busts, or after both participants stay and compare cards. Why is the last call to play_again? a little different from the previous two?

Answer:<br>
The first two play_again? calls are ternarys to allow the program to move to the next iteration of the loop if the user want to play again OR break out of the loop if not and proeed to goodbye.

The final play_again? is if both players remain unbusted and then a yes to play again simply moves automatically to the enext loop iteration.  Hence a break unless 'yes' is entered is sufficient rather than the ternary.  If any other answer is provided the program breaks out of the loop and the game ends.

