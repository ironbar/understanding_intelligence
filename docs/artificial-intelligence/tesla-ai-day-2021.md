# Tesla AI Day 2021

I have been watching the of the Tesla AI Day and I would like to summarize how the
system works.

<iframe width="560" height="315" src="https://www.youtube.com/embed/j0z4FweCy4M" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## Problem

The problem the Tesla car has to solve is to go from point A to point B. It needs to navigate through
roads and cities to arrive to the goal location. It needs to deal with traffic, pedestrians and obstacles.

## Route planning

The first step of the process is to do route planning. I don't know how this is exactly done but seems
to be a solved problem since Google maps does it already for free.

So the car knows its location because it has a GPS and the user enters the goal location on the touchscreen.
A search algorithm returns a route that may be decomposed into a series of steps. My intuition is that
this steps are fed as high level actions to the AI system that translates those high level actions
into fine-grained actions such as steer the wheels, brake...

For example the high level actions could be: turn left, follow the road for 20 km... The typical
instructions we hear when using the GPS.

## Perception

The task of the perception system is to integrate over time the information of all the cameras and sensors
and to create an internal representation of the state of the world. This representation will be used
later for planning. The representation is also rendered in the touchscreen probably to give confidence
to the user.

![autopilot representation](res/2022-05-22-11-43-35.png)

### Integrating all the cameras

Each camera is processed with a visual backbone and a Transformer learns to combine the information
of the cameras into a single vector representation. Thus the output of this module is a single
embedding that has all the information provided by all the cameras.

![integration of the cameras](res/2022-05-22-11-51-45.png)

I find very interesting the use of a Transformer to merge information from different sources. It
feels a very good choice and probably could be applied to many different problems.

### Integrating information over time

To be able to represent the environment the car needs to integrate information over time. Objects
can be occluded, signs could be left behind... and the car needs to remember that information.

![vector space embeddings queue](res/2022-05-22-12-04-39.png)

This is solved with a queue that stores the vector space embeddings. That queue is updated using
both time and space criteria.

![spatial RNN](res/2022-05-22-12-04-53.png)

Finally there is a there is a grid of RNN that creates and egocentric representation of the world.
This RNN module integrates the time information into a single and final representation of the world.

### Whole architecture

![whole architecture](res/2022-05-22-12-00-41.png)

It is curious that the representation of the world can be directly visualized. The picture
above shows the activation of some of the channels of the world representation.

## Planning

Monte carlo planning with policy

## Training data

### Real data

### Simulation
