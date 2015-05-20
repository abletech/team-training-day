# Javascript Racer 1 Front End

Let's create a JavaScript-only racer game.  For now it will be a
single html page with no back-end at all.  Later we'll add the ability to save
high scores and the like by adding a back-end to the application.

The game will be played out on a fixed track and the outcome of the game won't be pure chance - you're gonna need mad skill.  Each player
will advance their "car" by smashing some key (skill).  For example, player 1 might be
the "q" key and player 2 might be the "p" key.

The goal here is to learn more about JavaScript, jQuery, the DOM, and
asynchronous event handling.

Before you start, you should read about [jQuery][] if you're not already familiar.  In particular, you should
understand event handling and callback functions.

## Part One Releases

### Release 0: The Setup

There is no skeleton for this challenge.  You will have to write the HTML, CSS and JavaScript (not Coffeescript) files yourself (and link them all together).  Let's just start with building a simple two-player board.  This will be
rendered via HTML.  There are a few ways you could do it, e.g., a table that
looks like:

```html
<table class="racer_table">
  <tr id="player1_strip">
    <td></td>
    <td class="active"></td>
    <td></td>
    <td></td>
    ... etc ...
  </tr>
  <tr id="player2_strip">
    <td></td>
    <td></td>
    <td></td>
    <td class="active"></td>
    ... etc ...
  </tr>
</table>
```

Then, using CSS, you can provide styles like:

```css
.racer_table td {
  background-color: white;
  height: 20px;
  width: 20px;
}

.racer_table td.active {
  background-color: black;
}
```

Updating a player's position could be achieved by adding the `active` class to
the appropriate `td`.  There are many other ways to achieve a sensible board
output; this is just one suggestion.

Make sure you're able to "manually" produce all the board layouts you might
care about before you jump into the JavaScript.  Whatever way you choose, it
should be easy for jQuery/JavaScript to manipulate, so keep that in mind.

If at any stage you get really really stuck during part one of this challenge
have a peak at this [possible solution](potential_part_one_solution). By no means is it
perfect but it may give you the prompt you need.

### Release 1: Add JavaScript

We need some way for JavaScript to update the board state.  Create simple
JavaScript functions that can update a particular player's position.  You give
the functions a player position as input and they update the underlying HTML to
reflect the new position.

It could look something like:

```javascript
update_player_position('player1', 10);
```

Store this JavaScript in a separate file and use the JavaScript console to
debug it and pass in values manually.

### Release 2: Binding to Key Presses

Now we'll make the game interactive!  Bind to the [keyup][] event to detect
when a player has "pressed" a key.  We don't bind to the [keydown][] or
[keypress][] events because those events fire when the keyboard repeats the
key, whereas the keyup event doesn't.

It'd be a boring game if you could just hold the key and go.  You want to bind
to the `document`, like so:

```javascript
$(document).ready(function() {
  $(document).on('keyup', function(event) {
    // Detect which key was pressed and call the appropriate function
    // Google "jquery keyup what key was pressed" if you don't know how
  });
});
```

### Release 3: Starting and Winning States

The last bit is to have starting and winning states, so we can restart the game
and declare a winner when the game is over.  Add these features (starting,
playing, winning, and restarting) and submit your solution as a pull request
with at least three files: an HTML file, a CSS file, and a JavaScript file.
You can have more files, but all CSS and JavaScript should be linked externally
from the HTML file.

## Part Two Extension Releases
### Release 4: JavaScript Racer 2 Back End

We'll now add a back-end to our JavaScript racer game using a simple MVC
application.  The game still runs in a single browser instance, i.e., two players don't play each other across different browsers, but rather on a single browser.

* Map the flow of data through a web application
* Implement CRUD in an MVC application
* Build a pure JavaScript application
* Change the DOM based on events
* Use AJAX actions to change views based on asynchronous data

The flow goes like this:

1. Two people get on a computer and visit the application
2. The application prompts each player to enter their name
3. The players fill out the form and this creates a new game
4. The new game starts, and each player smashes their respective key until one
   of them wins
5. After one of them wins, the winning player and amount of time it took to win is sent to the server and the game is recorded as being "done"
6. The players can choose to start another game using their same initials, or
   restart using different initials
7. After a game is finished the players are given a unique URL at which they
   can view the results of that particular game

## Releases

### Release 4.0: Models

Now model the application in your backend.
You should have two core models: `Player` and `Game`.  A player can be in many
games and a game can have multiple players.  For now it's "just two," which can
be hard-coded into the game creation form.

- Add validations. Things like uniqueness among players, two players per game etc.
- Test it!


### Release 4.1: Routes

Remember, you need routes which correspond to:

1. Starting / creating a new game
2. Playing a new game
3. Viewing the results of an old game

### Release 4.2: Views and Flow

Submit a working application which uses the JavaScript application, where
appropriate to run the game


## Resources

* [jQuery][]
* [Documentation for: keyup][keyup]
* [Documentation for: keydown][keydown]
* [Documentation for: keypress][keypress]

[jQuery]: http://learn.jquery.com/about-jquery/
[keyup]: http://api.jquery.com/keyup/
[keydown]: http://api.jquery.com/keydown/
[keypress]: http://api.jquery.com/keypress/


