# Dall-e 2

[Dall-e 2](https://openai.com/dall-e-2/) is trained with a dataset of 650M of image, text pairs. It shows an incredible ability to generalize, creating realistic images for very unusual text prompts.

Why are the key ingredients for generalization on Dall-e 2?

- Huge dataset of **text**, image pairs
- Big model (although is not huge because at 3B parameters is much smaller than the 175B parameters of GPT3)

Compared to models that are trained on Imagenet with a fixed set of categories the flexibility of a model
trained with natural language is vastly superior.

I guess it will be possible to do the same with different pairs:

- text, text -> GPT3
- text and video
- text and music
- text and actions

So language seems to be a key ingredient for achieving generalization.

## How it works in a nutshell

1. CLIP model is trained to create embeddings from image, text pairs that are as similar as possible
2. Dall-e 2 first stage is a model that takes a CLIP text embedding as input and creates an image embedding
3. Dall-e 2 second stage decodes the image embedding and creates a new image using a diffusion model

## The role of embeddings

It seems that an embedding is a universal representation method. There are word embeddings, text
embeddings, biometric embeddings, image embeddings...

From the point of view of information an embedding is a sequence of numbers. I could encode a maximum
of different `m^n` states in an embedding of length `n` if each dimension has `m` bits. The biggest
clip embedding size is 1024. In this context the number of bits will be how many different partitions
we can make of each dimension. With float32 each dimension has 4 bytes so that would be a total of 32 bits
that will theoretically enable a partition of 2^32. However neural networks are noisy so let's take
a pessimistic lower bound that says that each dimension can only hold two partitions (positive and negative).
In that case the number of different states that the embedding could store is `2^1024 ~ 10^313`, a number much bigger than `10^82` which is the number of atoms in the observable universe.

Thus we can see that the embeddings can encode a ton of information. However to be able to use
that information we need a big encoder or decoder, because the embedding alone does not mean anything.
