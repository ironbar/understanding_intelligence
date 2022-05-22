# Tesla AI Day 2021

I have been watching the presentation of the Tesla AI Day and I would like to summarize how the
system works.

<iframe width="560" height="315" src="https://www.youtube.com/embed/j0z4FweCy4M" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## Problem

The problem the Tesla car has to solve is to go from point A to point B. It needs to navigate through
roads and cities to arrive to the goal location. It needs to deal with traffic, pedestrians and obstacles.

## Route planning

The first step of the process is to do route planning. Apparently [Google Maps uses Dijkstra's algorithm](https://algorithmyou.com/2020/02/15/artificial-intelligence/how-google-maps-work-fast-route-planning/)
to find the shortest path on a graph.

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
embedding that has all the information provided by all the cameras. From the presentation it seems
that this representation has the same shape as the final egocentric representation of the world
that will be described on the section below.

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

They apply planning in the vector space to optimize for safety, comfort and efficiency.

![monte carlo tree search](res/2022-05-22-15-55-59.png)

According to the presentation the most efficient search method is to use Muzero's Monte Carlo Tree
Search to plan.

![comparison of planning algorithms](res/2022-05-22-15-58-48.png)

## Training data

The models are trained to predict the vector space given the images of the individual cameras.

### Real data

The labels are applied in the vector space and reprojected to the individual cameras. Maybe they
use this as auxiliary output or for visualization purposes, more probably the first option.

![labelling on the vector space](res/2022-05-22-15-40-18.png)

They have 1000 in house labellers and they have developed all the labelling software.
Also auto-labelling is done offline to improve the speed of the labellers.

### Simulation

In addition to real data they also have a simulation that provides data with perfect labels
and also allows to reproduce clips from the real world with variations.

## Summary

1. Route planning
2. Perception to create a world representation
3. Plan the car trajectory using the world representation

Overall it seems a pretty strong setup and Tesla seems to be very well positioned to achieve autonomous
driving. The model architecture is sound, the data collection pipeline is effective...

Can I think of any obstacle that given the current information may block the progress of Tesla to
autonomous driving?

- Some people talk about long tail distributions. Rare events that are difficult to collect. This would be a problem to all automakers. And Tesla has the biggest fleet so far so it's in the best position.
- A more powerful computer may be needed to deploy autonomous driving. This should not be a problem for Tesla,
it that is the case it could sell it to its costumers as an upgrade.

At this moment I cannot imagine an obstacle, so apparently is just a matter of time that Tesla gets
to autonomous driving. They seem to have all the needed ingredients.
