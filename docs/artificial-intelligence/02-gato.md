# Gato

[Gato](https://www.deepmind.com/publications/a-generalist-agent), a generalist agent, is a paper released
by Deepmind short after [Flamingo](./flamingo.md) on May 2022.

![gato summary](res/2022-05-15-10-33-58.png)

The idea is to train a model that can receive both text and images as inputs (like Flamingo) in a bunch of different tasks. Gato is much smaller than Flamingo:
1.2B vs 80B. This is motivated because they want to be able to execute the model in real time for
robotics tasks.

> The same network with the same weights can play Atari, caption images, chat, stack blocks with a real robot arm and much more, deciding based on its context whether to output text, joint torques, button presses, or other tokens.

<!-- -->

> The guiding design principle of Gato is to train on the widest variety of relevant data possible, including diverse modalities such as images, text, proprioception, joint torques, button presses, and other discrete and continuous observations and actions. To enable processing this multi-modal data, we serialize all data into a flat sequence of tokens. In this representation, Gato can be trained and sampled from akin to a standard large-scale language model.



<!-- -->

> While no agent can be expected to excel in all imaginable control tasks, especially those far outside of its training distribution, we here test the hypothesis that training an agent which is generally capable on a large number of tasks is possible; and that this general agent can be adapted with little extra data to succeed at an even larger number of tasks.

<!-- -->

> We focus our training at the operating point of model scale that allows real-time control of
real-world robots, currently around 1.2B parameters in the case of Gato. As hardware and model
architectures improve, this operating point will naturally increase the feasible model size, pushing
generalist models higher up the scaling law curve. For simplicity Gato was trained offline in a purely
supervised manner; however, in principle, there is no reason it could not also be trained with either
offline or online reinforcement learning (RL).

That is true but RL is much harder than supervised learning.

> As described above, Gato’s network architecture has two main components: the parameterized embedding function which transforms tokens to token embeddings, and the sequence model which outputs a distribution over the next discrete token. While any general sequence model can work for next token prediction, we chose a transformer (Vaswani et al., 2017) for simplicity and scalability. Gato uses a 1.2B parameter decoder-only transformer with 24 layers, an embedding size of 2048, and a post-attention feedforward hidden size of 8196 (more details in Section C.1).

![scaling laws](res/2022-05-15-10-39-12.png)

As shown in the picture above Gato benefits from the same scaling rules that apply to the transformers.

> Transformer sequence models are effective as multi-task multi-embodiment policies, including for real-world text, vision and robotics tasks. They show promise as well in **few-shot** out-of-distribution task learning. In the future, such models could be used as a default starting point via prompting or fine-tuning to learn new behaviors, rather than training from scratch.

Gato is not a zero-shot model like Dall-e or Flamingo, the results are not as impressing. It needs
fine-tuning to be able to achieve good scores on new games.

> Given scaling law trends, the performance across all tasks including dialogue will increase with
scale in parameters, data and compute. Better hardware and network architectures will allow training
bigger models while maintaining real-time robot control capability. By scaling up and iterating on
this same basic approach, we can build a useful general-purpose agent.

In essence Gato is a promise of something bigger that will come in the future. It is possible that
scaling Gato may result in a general zero-shot policy that might be able to do many different tasks.

## Criticism

Gato is a glimpse of what could come in the future, but we already know that it is limited. A policy
is very unlikely to achieve human intelligence because humans have the ability to plan, while a policy
is similar to a fast reaction.

In the book "Think fast, think slow" it was talked about two systems:

> System 1 thinking is a near-instantaneous process; it happens automatically, intuitively, and with little effort. It's driven by instinct and our experiences. System 2 thinking is slower and requires more effort. It is conscious and logical.

I believe Gato is a very good candidate to become a powerful System 1, but System 2 is needed to
do more complex tasks. For example when playing Go Deepmind needed to use Monte Carlo for sampling although they had a very good policy. However the policy was never as strong as planning.
