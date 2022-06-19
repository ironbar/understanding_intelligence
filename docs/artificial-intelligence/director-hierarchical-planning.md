# Director - Deep Hierarchical Planning from Pixels

## Summary of the paper

![director schema](res/2022-06-19-08-45-16.png)

> current artificial intelligence is limited to tasks with horizons of a few hundred decisions, despite large compute budgets

This is true, current RL has difficulties on environments with very sparse rewards.

> Hierarchical reinforcement learning (HRL) aims to automatically break long-horizon tasks into subgoals or commands that are easier to achieve, typically by learning high-level controllers that operate at more abstract time scales and provide commands to low-level controllers that select primitive actions.

<!---->

> In this paper, we present Director, a practical method for learning hierarchical behaviors directly from pixels by planning inside the latent space of a learned world model. We observe the effectiveness of Director on long-horizon tasks with very sparse rewards and demonstrate its generality by learning successfully in a wide range of domains.

<!---->

> The world model representations st are 1024-dimensional continuous vectors. Selecting such representations as goals would be challenging for the manager because this constitutes a very high- dimensional continuous action space. To avoid a high-dimensional continuous control problem for the manager, Director compresses the representations st into smaller discrete codes z using a goal autoencoder that is trained on replay buffer model states

This is interesting, they use a quantized autoencoder to compress the state and to plan in a smaller space.
Sampling in a discrete space is easier.

> Director learns a manager policy that selects a new goal for the worker every fixed number of K =time steps. The manager is free to choose goals that are much further than 8 steps away from the current state, and in practice, it often learns to choose the most distant goals that the worker is able to achieve. Instead of selecting goals in the high-dimensional continuous latent space of the world model, the manager outputs abstract actions in the discrete code space of the goal autoencoder (Section 2.2). The manager actions are then decoded into world model representations before they are passed on to the worker as goals. To select actions in the code space, the manager outputs a vector of categorical distributions, analogous to the goal encoder in Section 2.2:

<!---->

> The objective for the manager is to maximize the discounted sum of future task rewards and ex-
ploration rewards.

So the manager asks to the worker to achieve a future world state. It has to both maximimize the rewards
and to explore the world.

<!---->

> The worker is responsible for reaching the goals chosen by the manager. Because the manager outputs codes z in the discrete space of the goal autoencoder, we first decode the goals into the state space . of the world model g = dec(z). Conditioning the worker on decoded goals rather than the discrete codes has the benefit that its learning becomes approximately decoupled from the goal autoencoder. The worker policy is conditioned on the current state and goal, which changes every K = 8 time steps, and it produces primitive actions at to reach the feature space goal:

The worker is a conditioned policy that tryies to achieve the goal state.

## Multi level hierarchical planning

On the paper there are only two levels for planning: high level and low level. Is it possible to have
more levels? How would that work?

Let's think of some examples of hierarchical planning:

1. In a company there are different levels of abstractions. The bigger the company the longer the chain of command.
   Each element of the chain is working on a different level of abstraction, being the higher the CEO of the
   company and the lower a developer who is implementing a product. Each element has different goals
   and rewards and works with different information. But in the end the whole company is working
   to achieve the goals of the CEO (ideally).
2. Every task can be decomposed on subtasks, and those subtasks can likely be decomposed on subtasks
   and so on. We can have an arbitrary level of hierarchies when decomposing a task.

Thus to have a multi-level hierarchical planning we need:

- Different managers operating at different time scales that decompose a high level goal into multiple
  low level goals. Each manager tries to achieve the high level goal by proposing the low level goals.
  Exploration would also be encouraged like in the director paper. The number of managers will
  be a design choice.
- A low level worker that takes actions to try to achieve the received goals
- On each hierarchical level there might be different specialized managers or workers. For example
  the agent might have to work on different contexts and having specialized policies could be better than a single policy
- All the hierarchical levels might operate on the same representation of the world, but it is likely
  that using different levels of abstraction might be helpful (just like in the company example)
