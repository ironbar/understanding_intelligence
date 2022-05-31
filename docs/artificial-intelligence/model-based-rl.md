# Model Based Reinforcement Learning

# 🚧 Work in progress 🚧

## Motivation

In the past I have followed [DeepMind's RL course](https://www.deepmind.com/learning-resources/reinforcement-learning-lecture-series-2018) and know I'm doing the [Hugginface's RL course](https://github.com/huggingface/deep-rl-class) to remember the concepts. However they do not dig deep into model based
RL and that's what I want to do it now.

In [Sutton and Barto](https://web.stanford.edu/class/psych209/Readings/SuttonBartoIPRLBook2ndEd.pdf) book I cannot find either anything about model based RL.

I believe world models will play a big role in the road of AGI. Without a world
model is not possible to plan, so we need them to achieve complex thinking and
reasoning.

## Resources

Let's search for learning resources and list them to prioritize them.

### Youtube

- [Model-free vs Model-based Reinforcement Learning -- Oriol Vinyals (11/10/2020)](https://www.youtube.com/watch?v=_rKzhhDRq_4) A talk about AlphaGo, AlphaStar, Alphazero... Some initial ideas about the differences between model-free and model-based but most of the talk is about the experience of Oriol with those mentioned projects.
- [World-Models 🌍 Model Based Reinforcement Learning](https://www.youtube.com/watch?v=0MjI2NA_s4c). Describes two challenges of world models: partial observability and randomness
- [Pieter Abbel's Lecture on Model-based RL](https://www.youtube.com/watch?v=2o1yrkbpcUk) In this video de model is used to improve the policy. The policy is trained using the world model skipping the simulator. That results in better sample efficiency. However it is very different of the planning approach I'm interested in.
- [Yannic Kilcher World Models](https://www.youtube.com/watch?v=dPsXxLyqpfs&t)
- [Yannic Kilcher Learning model-based planning from scratch](https://www.youtube.com/watch?v=56GW1IlWgMg) Describes a model
  that learns to plan. Instead of going to an algorithm like MCTS the model learns how to prioritize
  the planning steps (budget, depth and breath)
- [Harri Valpola: System 2 AI and Planning in Model-Based Reinforcement Learning](https://www.youtube.com/watch?v=HnZDmxYnpg4)
- [Dreamer v2: Mastering Atari with Discrete World Models](https://www.youtube.com/watch?v=o75ybZ-6Uu8)

### Papers

- [Model-based Reinforcement Learning: A Survey](https://arxiv.org/abs/2006.16712) This is a very good
  review of all the options when taking the model-based rl approach.
- [World models](https://worldmodels.github.io/)
- [PlaNet: A Deep Planning Network for Reinforcement Learning](https://ai.googleblog.com/2019/02/introducing-planet-deep-planning.html)
- [Dream to Control: Learning Behaviors by Latent Imagination](https://arxiv.org/abs/1912.01603)
- [Mastering Atari with Discrete World Models](https://arxiv.org/abs/2010.02193)
- [MuZero: Mastering Go, chess, shogi and Atari without rules](https://www.deepmind.com/blog/muzero-mastering-go-chess-shogi-and-atari-without-rules)
- [Vector Quantized Models for Planning](https://arxiv.org/abs/2106.04615)
