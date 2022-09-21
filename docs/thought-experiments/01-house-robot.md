# House robot

Let's imagine we are already in the future and we have a home robot

![house robot](res/2022-05-21-11-51-03.png)

## Case 1

```
Human: Clean the bathroom
Robot: I don't know how to clean the bathroom
```

To be able to reach this situation the robot needs to query its world model something like:
Do I know how to clean the bathroom? Have I ever clean the bathroom?

Or maybe the robot queries its world model: What is the first thing I have to do to clean the bathroom?
And the answer will be: I don't know.

### World model

So the robot needs a world model to be able to do the tasks. What is the difference between a world
model and a huge database of data, f.e. all the memories of the robot? Probably the difference is
that I can query the world model and get an answer. On a database I can query it and get data in
return but data itself is not an answer. Also the world model can use its knowledge to answer about
events that have never happened and imagine the future. Also the world model needs to handle uncertainty
and lack of knowledge.

For this task a database could be enough. The robot could have a library with different routines and
it queries for the cleaning bathroom routing and since it cannot find it, it is aware that it does not
know how to do it.

## Case 2

```
Human: Clean the bathroom
Robot: Ok Master
```

After answering the robot does the following actions:

1. Goes to the closet and picks up the broom
2. Goes to bathroom and starts cleaning
3. Evaluates the cleanliness of the floor and decides to stop cleaning
4. Returns the broom to the closet

To be able to do this tasks the robot needs to have an algorithm to do the cleaning. It needs to know
the different steps of the task and the success criteria of each step.
It also needs a policy for each step and a critic that decides if the success criteria is met.

Can the world model do both?

## Case 3

```
Human: Clean the bathroom
Robot: Which bathroom master?
```

In this case the robot knows how to clean the bathroom but since there are two bathrooms in the house
there is uncertainty regarding which one needs to be cleaned.
