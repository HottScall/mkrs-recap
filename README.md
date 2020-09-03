<h1> Boris Bikes </h1>

A simple web application which models the boris bike business structure.

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
docking_station <------ bike ------> dock_bike
bike <------- docking_station -----> bike_docked?
