# Connect 4

## Goals

1. Create an AI that is able to beat me on Connect 4 game
2. Learn from the AI what is the best policy
3. Compare model-free and [model-based](../artificial-intelligence/model-based-rl.md) algorithms on this game

## Motivation

When I play Connect 4 I tipically place my first pieces in the center. I don't know if that is the
best policy and I would like to know it. I believe it will be fun to create a superhuman AI for this
game and hopefully I will learn something.

## About the game

Let's first read about the game to see if it solved. From the [wikipedia](https://en.wikipedia.org/wiki/Connect_Four)

> Connect Four is a two-player connection board game, in which the players choose a color and then take turns dropping colored tokens into a seven-column, six-row vertically suspended grid. The pieces fall straight down, occupying the lowest available space within the column. The objective of the game is to be the first to form a horizontal, vertical, or diagonal line of four of one's own tokens. Connect Four is a solved game. The first player can always win by playing the right moves.

So we can see that the game has been solved.

> For classic Connect Four played on a 7-column-wide, 6-row-high grid, there are 4,531,985,219,092 positions (4.5e12) for all game boards populated with 0 to 42 pieces.

The state space is very big, so we cannot store a value table.

> The solved conclusion for Connect Four is first-player-win. With perfect play, the first player can force a win, on or before the 41st move by starting in the middle column.

Let's see if we can get an agent close to the optimum.

## Environment

We need to find an environment where we can train the agents and also play against them.

## The job was already done

![azfour](res/2022-06-21-17-40-19.png)

I have found that Anthony Young has already [trained an alpha zero agent on connect 4](https://medium.com/@sleepsonthefloor/azfour-a-connect-four-webapp-powered-by-the-alphazero-algorithm-d0c82d6f3ae9). It has
even a [website](https://azfour.com/) where it is possible to play against the agent, although I get connection errors very often.

There are a lot of implementation details so it is worth reading the blog. It says
that connect 4 is a good testbed for verifying that alpha zero implementation
works correctly. So if in the future I have to do it I could use it.

The version deployed on the website does not do search but instead uses just the
learned policy.

## Game dynamics

My intuition was correct, the center column is filled to the top at first. The predictions of the different generations of agents do not seem to be stable.

## Thoughts about multiplayer games

Model free methods tipically learn a value function. In a multiplayer game the skill of the opponent
will influence that value function. If we play against different opponents during training we will
be adding noise to the value function and thus making the learning more difficult.

Always playing against the same player will result in a more stable training. But there is the risk
of overfitting to that player by exploiting the weak points of the player.

A policy could learn to play very well, but planning is more general because it will work well
when finding new situations that were not found during training.
