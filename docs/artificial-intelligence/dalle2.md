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

TODO
