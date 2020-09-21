<h1> Learning </h1>

<h2>Basics</h2>

rspec --init = initialises Rspec, creates rspec & gem files

<h2>IRB Notes</h2>

- Require the file, ensure to use the path e.g './lib/file_name'
- Set a variable to a new DockingStation e.g ds = DockingStation.new
- You can ask irb to run certain tests for example, we want the system to release a bike so the chain of commands is as follows;
  - ds = DockingStation.new
    => #<DockingStation:0x00007fb04a99a910>
  - bike = ds.release_bike (set new bike variable and have it respond to the release_bike method from the DockingStation class)
  - You can then ask questions from that new variable, in this case 'is the bike working' e.g - bike.working? Response: "Undefinied method working? for Nill Class" so there is no Bike class which responds to the keyword working.

<h2>User Stories</h2>

As a person,
So that I can use a bike,
I'd like a docking station to release a bike.

As a person,
So that I can use a good bike,
I'd like to see if a bike is working.

As a member of the public
So I can return bikes I've hired
I want to dock my bike at the docking station

As a member of the public
So I can decide whether to use the docking station
I want to see a bike that has been docked

As a member of the public,
So that I am not confused and charged unnecessarily,
I'd like docking stations not to release bikes when there are none available.

<h2>Objects & Messages Table</h2>

| <   | Objects         | Messages      |
| :-- | :-------------- | ------------- |
|     | docking_station | release_bike  |
|     | bike            | working_bike? |
|     | docking_station | dock_bike     |
|     | bike            | bike_docked?  |

<h2>Object & Message Communication Diagram</h2>

docking_station <------- release_bike -----> a bike
working_bike? ------> yes/no?

<h2>Instance Variables</h2>

When you get the the User Story "I want to dock my bike at the docking station" Your feature tests in irb will now require both a new instance of the docking station and a new instance of the bike.

require './lib/docking_station'
-> true
require './lib/bike'
-> true
bike = Bike.new
-> #<Bike:0x00007fa075908388>
ds = DockingStation.new
-> #<DockingStation:0x00007fa0758e8d08>

Now that you have required both files and created new instances of both, you can do a check with your DockingStation class with a . method to call the dock method and give it a bike argument.

ds.dock(bike)
-> (undefined method `dock' for #<DockingStation:0x00007fa0758e8d08>)

So you can repeat your previous respond_to test, but this time you must let the test know that it will respond with 1 argument. Now your feature test will work, but the dock doesn't really do much useful at the moment. DO NOT BE TEMPTED TO DO MORE ON THIS. DO THE MINIMUM AND THEN MOVE ON. See ds_spec.rb line 13-15, see ds.rb lines 9&10.

As a member of the public
So I can decide whether to use the docking station
I want to see a bike that has been docked

This User Story is a little trickier, it asks us to remember when bikes are docked (Remember = Memory & Memory = State) whilst also reporting on docked bikes ('behaviour').

Both of these requirements center around a single resource 'docking a bike' Being able to both store something and then also read it will use instance variables or attributes.

So now run a new feature test.

require './lib/docking_station'
-> true
require './lib/bike'
-> true
bike = Bike.new
-> #<Bike:0x00007fa075908388>
ds = DockingStation.new
-> #<DockingStation:0x00007fa0758e8d08>
ds.dock(bike)
-> Nil
docking_station.bike
-> No Method Error: Undefined Method "Bike"

Note that we are essentially adding a Bike method on the DockingStation instance to return a docked Bike instance. Note the following process to ensure why we do this. See DS_spec 16-19 to see the test and the empty bike method which passed the test.

Now if you run your feature test again you will get a new error message with both a docked bike and a ds with a bike both returning nil.

2.6.0 :001 > require './lib/bike'
=> true
2.6.0 :002 > require './lib/docking_station'
=> true
2.6.0 :003 > bike = Bike.new
=> #<Bike:0x00007fc3590c07f0>
2.6.0 :004 > ds = DockingStation.new
=> #<DockingStation:0x00007fc35593aad8>
2.6.0 :005 > ds.dock(bike)
=> nil
2.6.0 :006 > ds.bike
=> nil

Okay so first of all you can now change your dock bike test, remove the (respond with 1 argument line) and replace it with expect(subject.dock(bike)) to equal a bike. Then just add a bike to the method to get the rspec tests passing. See ds_spec lines 13-18. Which now passes both the unit and feature tests.

Lines 24 - 28 in ds_spec. We have now written a new test which follows the process of docking a bike, but expects the subject.bike to eq bike.

This means our unit test now resembles our feature test, i.e it expects a bike but it returned nil.

Now we use instance variables in both the dock and bike methods which will create a memory of both docked bikes and returning a docked bike.

All tests are now passing meaning we have covered the red and green part of the process now time for a small refactor.

Defining a bike method which returns a bike is actually unnecessary. You can simply remove the bike method and it's contents and replace it with an attr_reader. See line 5.

<h2>Raising Exceptions</h2>

As a member of the public,
So that I am not confused and charged unnecessarily,
I'd like docking stations not to release bikes when there are none available.

<h3>Process</h3>

Complete a feature test which returns an error when there are no bikes. The initial feature test (below) will return an unlimited number of bikes from the release_bike method.

Part of this will require you to make an assumption; are bikes already docked or is a DS empty? We'll assume empty for now.

So update your relase bike test to create a new bike instance, dock the bike and then expect the release bike method to equal a bike. Remove the Bike.new and replace with an instance variable.

Now you can write your test with the expectation of a failure and write your fail with unless @bike.

<h3>R.E Feature Test</h3>

2.6.0 :001 > require './lib/bike'
=> true
2.6.0 :002 > require './lib/docking_station'
=> true
2.6.0 :003 > bike = Bike.new
=> #<Bike:0x00007fccad83ff78>
2.6.0 :004 > ds =DockingStation.new
=> #<DockingStation:0x00007fccaa87f400>
2.6.0 :005 > ds.dock(bike)
=> #<Bike:0x00007fccad83ff78>
2.6.0 :006 > ds.bike
=> #<Bike:0x00007fccad83ff78>
2.6.0 :007 > ds.release_bike
=> #<Bike:0x00007fccaa245f80>
2.6.0 :008 > ds.release_bike
=> #<Bike:0x00007fccaa239cf8>
2.6.0 :009 > ds.release_bike
=> #<Bike:0x00007fccaa266ed8>
2.6.0 :010 > ds.release_bike
=> #<Bike:0x00007fccaa277710>
2.6.0 :011 > ds.release_bike
=> #<Bike:0x00007fccaa274448>

<h2>Limiting Capacity</h2>

As a maintainer of the system,
So that I can control the distribution of bikes,
I'd like docking stations not to accept more bikes than their capacity.

Feature Test:

2.6.0 :001 > require './lib/bike'
=> true
2.6.0 :002 > require './lib/docking_station'
=> true
2.6.0 :003 > bike = Bike.new
=> #<Bike:0x00007f819c8c1228>
2.6.0 :004 > ds = DockingStation.new
=> #<DockingStation:0x00007f819c899d68>
2.6.0 :005 > ds.release_bike
RuntimeError (No bikes available)
2.6.0 :007 > ds.dock(bike)
=> #<Bike:0x00007f819c8c1228>
2.6.0 :008 > ds.release_bike
=> #<Bike:0x00007f819c8c1228>
2.6.0 :009 > ds.dock(bike)
=> #<Bike:0x00007f819c8c1228>
2.6.0 :010 > ds.dock(bike)
=> #<Bike:0x00007f819c8c1228>
2.6.0 :011 > ds.dock(bike)
=> #<Bike:0x00007f819c8c1228>

So the docking station starts as empty, we receive an error when releasing a bike without docking. So we add a bike which can now be released, but we can continually dock bikes into a single station.

We need to write a new unit test which still uses a new instance of a bike, but returns an error when a docking station is already full.

Ensure the Unit Test follows the process of docking a bike first and then expect the error.

<h2>Limiting Capacity</h2>

As a system maintainer,
So that I can plan the distribution of bikes,
I want a docking station to have a default capacity of 20 bikes.

Things to consider:

- Wrap a collection in a class
- Set an initial attribute value using initialize

Things you will need to do:

- Feature test, using 20.times {docking_station.dock Bike.new}
- Rename @bike to a name which represents multiple bikes (@bikes?)
- Use rspec to identify where changes to your code for the Bike instance will need to be changed
- Update existing tests to represent this change
- Use an initialize function to set the initial value of this attribute to a simple collection object (an empty array).
- Make your tests pass by updating the release_bike and dock methods to work with this new array
- Update your release_bike and dock guard conditions to account for a capacity of 20 bikes

Expected Feature Test:

2.6.0 :001 > require './lib/docking_station'
=> true
2.6.0 :002 > ds = DockingStation.new
=> #<DockingStation:0x00007fb8ed938e80>
2.6.0 :003 > 20.times {ds.dock Bike.new}

Solutions:

Don't get carried away with this kind of requirement. There is no need to start change all your variables and methods to accommodate the word "bikes" as opposed to "bike"

Once you go above a single item (1 bike) you're now talking about a collection and a collection needs a place to be stored (an array or a hash).

Given the task revolves around putting a capacity of 20 bikes, then the issue still works around the guard condition and error tests.

Simply update the "raise error" test and put a guard condition of 20.times wrapped in {} in the step before your expect on raises an error when full test.

Now you simple add an initialize method which calls @bike and assigns it to an empty array. Update release_bike to fail IF bikes.empty? Then update @bikes to @bikes.pop

On the dock fail if the @bikes.count >= 20. Then @bikes << bike.

NOTE: You can't use push (opposite to pop) on your dock method, probably because you've assigned an argument of bike but have not declared a bike. So you use the << operator along with your variable. << effectively says push, i.e add a bike to the array but it specifically works with the bike argument to ensure that tests pass.

<h2>Refactoring</h2>

Time for a refactor. Note - Single Responsibility Principle and Removing Magic Numbers to call constants.

Created 2 new private methods full? and empty? (Methods with a question mark should return True or False values). This separated the responsibilities between different methods.

Also added a DEFAULT_CAPACITY constant which is assigned the value of 20. Then removed all magic numbers within the code and called DEFAULT_CAPACITY instead.

Note the use of :: which is a namepsace operator. Definition - The :: is a unary operator that allows: constants, instance methods and class methods defined within a class or module, to be accessed from anywhere outside the class or module.
