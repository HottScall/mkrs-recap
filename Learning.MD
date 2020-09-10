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

This User Story is a little trickier, it asks us to be remember when bikes are docked (Remember = Memory & Memory = State) whilst also reporting on docked bikes ('behaviour').

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

Okay so first of all you can now change your dock bike test, remove the (respond with 1 argument line) and replace it with expect(subject.dock(bike)) to equal a bike. Then just add a bike to the method to get the rspec tests passing.
