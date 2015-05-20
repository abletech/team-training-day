# And Bingo was his name-o

##Learning Competencies

* Effectively discuss alternative coding alternatives with your pair
* Refactor legacy code to improve comprehension

##Summary

By the end of the next challenge you'll have a beautifully refactored Automated Bingo player that you can run from the command line.

[Bingo](http://en.wikipedia.org/wiki/Bingo_%28U.S.%29) is a game of chance played with randomly drawn numbers which players match against numbers that have been pre-printed on 5×5 matrices. The matrices may be printed on paper or card stock, or electronically represented, and are referred to as cards. Many versions conclude the game when the first person achieves a specified pattern from the drawn numbers.

The winner is usually required to call out the word "Bingo!", which alerts the other players and caller of a possible win.

Thankfully, someone really loved Bingo, so they went ahead and made a script that plays it for you from the command line - no effort required. Unfortunately, in their hedonistic pursuit to play bingo their code may not quite be up to Abletech standard. It's your job it fix this.

##Releases

###Release 0 : Comprehension

####Comprehension: Read and talk through the code

Unlike your last challenges, this time you've got existing code to play with. Although you could essentially write the thing from scratch after a quick git blame and a scathing sigh, let's try and work with the bones of what our misguided colleague has created and not shame them too much. Just imagine that you'll be assigning the pull request to them after you're done - so be fair but kind.

Start by reading over and talking through [the code](bingo.rb). What is actually happening? Point out and note down any code smells. Think about what you learnt in the two prior challenges, and whether or not they are present in this script. After you've looked at the main code, have a look at the [driver code](driver_script.rb). It's important that this be comprehended too as you'll be refactoring this too.

Make sure you both have a thorough understanding of the current code before you move on.


###Release 1 :  Refactor this!

Ready, set, code! It's time to fix those code smells that you and your partner have identified. The overall aim should be to leave the code in a better and more comprehendable state that which you found it.

There are no rules here, just make it better. Some things you could look out for include:
- Naming conventions
- Be DRY
- Using the most appropriate object types
- Tidy structure

When refactoring keep in mind design principles that you'd use when working for a client.
An example of good design is [SOLID Design](http://blog.rubybestpractices.com/posts/gregory/055-issue-23-solid-design.html):
- Single responsibility principle: an object should have only a single responsibility.
- Open/closed principle: an object should be open for extension, but closed for modification.
- Liskov substitution principle: objects in a program should be replaceable with instances of their subtypes without altering the correctness of that program
- Interface segregation principle: many client specific interfaces are better than one general purpose interface.
- Dependency inversion principle: depend upon abstractions, do not depend upon concretions

###Release 2 :  Enhance this!

Maybe a little beyond the scope of refactoring, but fun none-the-less

One thing we'd love to see is a bit more of an interactive experience from the command line. At the moment we don't really know that bingo is being played, and what numbered and lettered balls are getting called at any given time.

Let's fix that.


###Release 3 : Share and compare

When you're done, find another pair that is also done and walk through your code with them. Then switch it up and let them walk you through theirs. Compare the different approaches you took and try and see the merit in each. If you've got the time, switch up your pairs and try and refactor it more with some of the shared learnings.


