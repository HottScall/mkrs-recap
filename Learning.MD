<h1> Learning </h1>

<h2>User Stories</h2>

As a person,
So that I can use a bike,
I'd like a docking station to release a bike.

As a person,
So that I can use a good bike,
I'd like to see if a bike is working.

<h2>Objects & Messages Table</h2>

| <               | Objects       | Messages |
| :-------------- | :------------ | -------- |
| docking_station | release_bike  |
| bike            | working_bike? |

<h2>Object & Message Communication Diagram</h2>

docking_station <------- release_bike -----> a bike
working_bike? ------> yes/no?
