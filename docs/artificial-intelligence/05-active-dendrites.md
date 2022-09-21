# Avoiding Catastrophical Forgetting with Active Dendrites

[Paper](https://arxiv.org/abs/2201.00042) and [Yannic Kilcher video](https://www.youtube.com/watch?v=O_dJ31T01i8)

## Summary

> Standard Artificial Neural Networks (ANNs) often fail dramatically when learning multiple tasks, a phenomenon known as catastrophic forgetting where the network forgets previously learned information.

<!---->

> Today it is well known that the point neuron assumption is an oversimplified model of biological computations. Proximal synapses (close to the cell body) have a linear impact on the neuron, but the vast majority of synapses are located on distal dendritic segments (far from the cell body) and individually have minimal impact on the cell. These distal segments process groups of synapses locally in a non-linear fashion, and are known as active dendrites . Empirical evidence suggests that each distal dendritic segment acts as a separate active subunit performing its own local computation. Modeling studies show that neurons with active dendrites are more powerful and complex than the point neuron model can accommodate.

<!---->

> This suggests that basal active dendrites have a modulatory, long-lasting impact on the cell’s response, with a very different role than proximal, or feedforward, inputs

<!---->

> Neural circuits in the neocortex are highly sparse.

![architecture schema](res/2022-05-26-17-50-41.png)

The idea is to use a context to modulate the activation of the neurons and next
to induce sparsity with a k winners take it all layer (kWTA). This two modifications to
the standard neural network work together to do modify only a small sparse subset
of the network for each input.

This happens because the kWTA blocks the gradients of all the units that are set
to zero. And the context modulates the activations, thus influencing which units
will be zeroed and which won't.

So in essence is like having multiple subnetworks inside a single network.

## Thoughts

The proposed architecture is interesting and could be an inspiration for future
custom networks. I would like to see if this could scale to bigger models.

I have found one sentence of the paper very intriguing:

> . Liu et al. [2019], Maninis et al. [2019] demonstrate that attention-based architectures could also prevent task interference in multi-task learning scenarios

Is this implying that transformers do not suffer from catastrophical forgetting in a multi-task
learning scenario?

The cited papers are [End-to-End Multi-Task Learning with Attention](https://arxiv.org/abs/1803.10704) and [Attentive Single-Tasking of Multiple Tasks](https://arxiv.org/abs/1904.08918). Those papers do
not talk about transformers but about adding an attention mechanism can help to multi-task learning.
Since the transformer architecture is based on attention we could make the assumption that it will
also have good properties for multi-task learning. And moreover we have the recent publication of [Gato](../artificial-intelligence/02-gato.md) that shows that a transformer can learn to do a lot of tasks.

So probably choosing a transformer as the architecture has more sense than implementing the proposed
changes on a more classic architecture.
