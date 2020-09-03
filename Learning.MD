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
