---
title: "Notes on Machine Learning"
date: "2023-08-15"
draft: true
---

# Embeddings

»Embeddings are dense numerical representations of real-world objects and relationships, expressed as a vector.« ([source](https://www.featureform.com/post/the-definitive-guide-to-embeddings))

Most machine learning algorithms can only take inputs in the form of low-dimensional numerical data. So in order to analyze and use data non-numeric variables need to be translated into numbers or vectors. We can thus    create embeddings for single pieces of data and find similarities by looking at how close to each other some of the values in the embedding vectors are.

## Vectors

Vectors in ML are lists of numbers. In our training data, we can define a feature and give it a numeric value.

# Hugging Face

sources: [1](https://github.com/huggingface/transformers) | [2](https://wandb.ai/int_pb/huggingface/reports/An-Introduction-To-HuggingFace-Transformers-for-NLP--VmlldzoyOTgzMjI5)

Hugging Face offers a hub with many pre-trained models that are usually free to download (much like repos on Github). Other such hubs are [TensorFlow Hub](https://www.tensorflow.org/hub)

## Use cases


### Text

- sentiment analysis 
- text summarization
- text classification
- information extraction
- question answering
- translation
- text generation

### Images

- image classification
- object detection
- segmentation

### Audio

- speech recognition 
- audio classification.


## Transformers 

»Hugging Face Transformers is an open-source framework for deep learning« ([source](https://docs.databricks.com/en/machine-learning/train-model/huggingface/index.html)). Transformers have an API, which lets you download pre-trained models and (fine) tune them.

### library

### pipelines 