# Question Answering

## Intro

On this page I want to study the state of the art of the question answering systems. I believe that a
system that could answer correctly to questions about a document or a website will be very valuable.
It would be a very useful tool for knowledge management, we could simply add knowledge to a website
and then query the question answering model when we need it.

On a small scale it would be useful for companies. It would "replace" that person in the company that
knows everything.

On a big scale it could replace Google and help advance scientific discovery.

## Open questions

I have written a list of questions that I have at the start of this study that I would like to
answer.

### How good are big language models at question answering?

Remember that they typically train for one epoch so they don't memorize the dataset.

### What if we simply fine-tune a big model in our data?

In the [Stanford Lecture](#stanford-cs224n-nlp-with-deep-learning-winter-2021-lecture-11-question-answering) they do that with good results. However that might be too expensive to do
for every user.

### Can we decouple data and model?

### Blenderbot

### Could we create a knowledge graph a la Google style?

### How do humans do this task of question answering?

### Is the system scalable? (to challenge Google)

### Are there commercial or open-source solutions?

No paid traffic on Google

## Resources

### [Huggingface: What is question answering?](https://huggingface.co/tasks/question-answering)

### Stanford CS224N NLP with Deep Learning | Winter 2021 | Lecture 11 - Question Answering

[Video](https://youtu.be/NcqfHa0_YmU)

- Pretrain is very important. It allows to improve F1 score on Squad V1 dataset from 77 to 95
- Question answering is not solved yet, the models fail against adversarial examples
- A lot of common knowledge is needed to answer some questions. For example knowing that a name is female, numeric knowledge...
- A big language model can directly answer questions after fine-tuning
- There is a very cool and very fast demo at the end about open-domain question answering

### Real-Time Open-Domain QA with Dense-Sparse Phrase Index

[Github](https://github.com/seominjoon/denspi) | [Paper](https://arxiv.org/abs/1906.05807) | [Live demo](http://allgood.cs.washington.edu:15001/)
