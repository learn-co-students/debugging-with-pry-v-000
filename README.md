# Debugging with Pry

## Objectives

1. Understand what a REPL is
2. Install and get familiar with using Pry to debug your programs

## What is a REPL?

You've already been introduced to REPLs through using IRB. REPL stands for "Read, Evaluate, Print, Loop". It is an interactive programming environment that takes a user's input, evaluates it and returns the result to the user. 

Ruby installs with it's own REPL, known at IRB (which stands for Interactive Ruby), which you've been using. Every time you type `irb` into your termainal, you're entering a REPL.

Pry is another Ruby REPL with some added functionality. When you enter IRB, you are entering a brand new interactive environment. Any code you want to play with in IRB, you can to write in IRB or copy and paste into IRB. Pry, on the other hand, is like a REPL you can inject into your program. 

## What is Pry?

We've already establish that Pry is a Ruby REPL, like IRB, only way more flexible. Once you install the Pry library (via the Pry gem––we'll talk about installation in a bit), you can use the following line `binding.pry` anywhere in your code. 

That line will get interpereted at runtime (i.e., as your program is executed). When the interpreter hits that line, your program will actually *freeze* and your terminal will turn into a REPL that exists right in the middle of your program, wherever you added the `binding.pry` line. 

Let's take a look. In this repository, you'll se a file called `pry_is_awesome.rb`. 

## Instructions Part I
1. Install Pry on your computer by navigating to your home directory (`cd ~` in your terminal) and execute `gem install pry`. 

1. Fork and clone this repository. 

2. Look at the code in `lib/pry_is_awesome.rb`

You should see the following code: 

```ruby
require 'pry'

def prying_into_the_method
	puts "We're inside the method"
	puts "We're about to stop because of pry!"
	binding.pry
	this_variable_hasnt_been_interpreted_yet = "The program froze be it could read me!" 
	puts this_variable_hasnt_been_interpreted_yet
end

prying_into_the_method
```
Here we are requiring `pry`, *which you must do to use pry*, defining a method and then calling that method. 

* In the directory of this repo, in your terminal, run the file by typing `ruby lib/pry_is_awesome.rb`. Now, look at your terminal. You should see something like this: 

```ruby
  3: def prying_into_the_method
     4: 	inside_the_method = "We're inside the method"
     5: 	puts inside_the_method
     6: 	puts "We're about to stop because of pry!"
 =>  7: 	binding.pry
     8: 	this_variable_hasnt_been_interpreted_yet = "The program froze be it could read me!" 
     9: 	puts this_variable_hasnt_been_interpreted_yet
    10: end
[1] pry(main)> 
```

You have frozen your program *as it executes* and are now inside a REPL *inside your program*. You basically just stopped time! How cool is that?

* In the terminal, in your pry console, type the variable name `inside_the_method` and hit enter. You should see a return value of `"We're inside the method"`

You are actually able to explore and manipulate the data *inside* the method in which you've placed your binding. 

* Now, in the terminal, in your pry console, type the varialbe name `this_variable_hasnt_been_interpreted_yet`. You should see a return value of `nil`. That's because the binding you placed on line 7 actually froze the program on line 7 and the variable you just called hasn't been interpreted yet. Consequently, our REPL doesn't know about it. 
* Now, in the terminal, type `exit`, and you'll leave your pry console and the program will continue to execute. 

## Instructions Part II: Using Pry to Debug

You can imagine how helpful it will by to use pry to freeze programs and pry open methods to solve tests and debug your code. Let's walk through an example together. In this repository that you've forked and clone down onto your computer, you'll see a spec folder containing a file `pry_debugging_spec.rb`. This is a test for the file `lib/pry_debugging.rb`. 

In that file, we have a broken method. Run `rspec` or `learn` to see the failing test. 

Oh no! A broken program! Luckily, we have pry required at the top of our `spec/pry_debugging_spec.rb` file, and we know how to use it. Let's place a `binding.pry` right before the `end` keyword like this. 

```ruby
def plus_two(num)
	num + 2
	num 
	binding.pry
end
```

Now, run the test suite again and drop into your pry console. Your terminal should look like this: 

```ruby
From: /Users/sophiedebenedetto/Desktop/Dev/Ruby-Methods_and_Variables/pry-readme/lib/pry_debugging.rb @ line 4 Object#plus_two:

    1: def plus_two(num)
    2: 	num + 2
    3: 	num 
 => 4: 	binding.pry
    5: end

[1] pry(#<RSpec::ExampleGroups::PlusTwo>)>
```

The test is calling our `plus_two` method with an argument of 3 and expecting a return value of 5. We remember that the return value of a method in Ruby is generally the value of the last line of the method. Let's check our current return value of typing `num` into our pry console. You should see something like this: 

```ruby
[1] pry(#<RSpec::ExampleGroups::PlusTwo>)> num
=> 3
[2] pry(#<RSpec::ExampleGroups::PlusTwo>)> 
```

By checking the value of the variable on the last line of our method inside our pry console, we can see that `num` is set to `3` and therefore the method is returning `3`. 

How can we fix this method so that is behaves in the expected way? Play around with it inside your pry console and get the test to pass. Remember to type `exit` in your terminal and then remove your `binding.pry` when you think your test will pass. 

Once you have your test passing, make sure the `binding.pry` line has been removed and add, commit and push your changes. Then open a pull request. 

## Resources

* Watch [this video on pry](http://vimeo.com/26391171). Only watch the first three sections (install, features, as a debugger), we'll cover using Pry in Rails later when it will make more sense.

<iframe src="https://player.vimeo.com/video/26391171?title=0&byline=0&portrait=0" width="100%" height="750" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>

* [Pry documentation](http://pryrepl.org/)
