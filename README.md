# Guess The Flag

This app is part of the 100 Days of Swift course by Paul Hudson.

You can follow the tutorial for this app here:
https://www.hackingwithswift.com/books/ios-swiftui/guess-the-flag-introduction

## Demo

<img src="app.gif" style="width: 400px;" />

## Some changes that I found interesting and fun to make:

- Instead of an alert that requires an extra tap and isn't very game-like, I made an overlay that darkens the background and shows the result for 1 second, then automatically disappears and continues the game, making it more dynamic.
- I used glyphs from SF Symbols in the overlay message.
- I created a very simple logo to improve the overall look of the app.
- I created a capsule with the user's score, showing the number of correct answers versus attempts.
- In the source code, I separated the views into different variables to make the code more readable and modular (even though everything is still in the same source code for simplicity's sake).
- I learned to use a form of timeout in Swift, similar to `setTimeout` in JavaScript.

## Future improvements:

- Include all the flags of the world.
- Add animations to make the game more dynamic.

## Conclusion

This app was quite interesting to expand my knowledge in SwiftUI, considering that my previous experience in college was using Storyboards.
