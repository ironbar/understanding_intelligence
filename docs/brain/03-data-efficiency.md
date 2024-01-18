# Data efficiency

Let's see how much data current deep learnings systems need compared to humans:

- [Llama 2](https://ai.meta.com/resources/models-and-libraries/llama/) is trained on 2e12 tokens. On [OpenAI's documentation](https://www.datacamp.com/blog/gpt4-turbo#:~:text=GPT%2D4%20has%20a%20maximum,MISTRAL%2D7b%2D128k%20model.) it is said that 128k tokens are equivalent to 240 pages (at 400 words per page). Let's say that the average book has 240 pages. So 2e12 tokens is equivalent to 15 million books. A human will need 42000 years to read those books if reading one book a day.
- [Laion-5B](https://laion.ai/blog/laion-5b/) is a dataset with 5.8e9 image-text pairs that is used to train CLIP models. If a human spend all the day watching the images at a rate of one per second it would need 184 years (without sleeping).
- On [Alphastar](https://deepmind.google/discover/blog/alphastar-mastering-the-real-time-strategy-game-starcraft-ii/) they train each agent for the equivalent of 200 human years of of real-time StarCraft play.
- [AlphaZero](https://arxiv.org/abs/1712.01815) played 44 million chess games, if each chess game takes around 20 minutes that would be 670 years of play.

| dataset         | equivalent human years |
|-----------------|------------------------|
| Llama 2         | 42000                  |
| Laion 5B        | 184                    |
| AlphaStar       | 200                    |
| AlphaZero chess | 670                    |

Neither Llama 2 or CLIP models have matched the capabilities of humans, despite using much more data. Why?

- Priors. The human brain is likely using good priors over the real world data that reduce the search space and allow to learn from less data. Evolution would very likely favour this kind of priors. We might be missing some priors in our models, or using wrong ones.
- Data quality. Sometimes we have very large datasets but low diversity or quality, so the effective size is much smaller than the number suggest.
- Data distribution. When humans see an object for a first time they are able to see the object from varius distances and angles. This data distribution is very different from Laion where each image is typically independent from the others.
- Interaction of the world. As humans we have constant interaction with the world. That allows to learn a very accurate world model that will be corrected anytime it makes a wrong prediction. In the other hand current deep learning systems typically just receive passive data and are simply required to copy what humans do, without the oportunity to interact with the world.
 
A 5 year old human does have a much better vision system than CLIP and a much more general intelligence than Llama 2. It seems we are missing something very relevant in our current models.
