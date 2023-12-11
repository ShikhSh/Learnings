SOURCES:
- https://nn.labml.ai/
- https://twitter.com/maximelabonne
- https://github.com/mlabonne/llm-course
- LLama2 notebook - https://colab.research.google.com/drive/1PEQyJO1-f6j0S_XJ8DV50NkpzasXkrzd#scrollTo=OJXpOgBFuSrc
- https://machinelearning-basics.com/
- https://h2o.ai/wiki/attention-mechanism/ -> for attn, BERT related stuff, Transformers, Layer Norm

# Neural Network intro:
- Neural Networks: Universal function approximator (need to be trained for it)
- Actual loss cannot be used (we do not have all possible values) - so use proxy for actual loss i.e. calculate the Average of Divergence of Loss over the training dataset only
- Avg of Divergence of Loss over train data = ugly function, so use gradient descent to minimize it.

# Basic Concepts:
### Batch Normalization
- We assume in DL: All train data comes from the same distribution.
- Assumption not true across batches
- Thus, to remove Covariate Shifts in data:
  - Bring to origin (normalize each mini batch) 
  - Move to the actual whole data (alpha*Zcap + beta)
- AFFINE (WX+b) -> BatchNorm -> Activation
- during the test (we might not send mini-batches, thus use the same mean and variance as calculated during the train phase).
- Complicates back-propagation
- Cons:
  - Batch size small
  - OR not much variation in each batch
  - THEN gradients not propagated back from the B.N.


# Sequence to Sequence Translation:
### Auto-regressive models:
  - Models which predict future on the basis of past (output of the model is fed into it again)

### Language Modeling:
  - Given N-1 words, predict the Nth word
  - Actually predicts a probability distribution over the whole Vocabulary for the next word
  - Sample the next word from this distribution/pick up the max probability one
  - Inputs could be 1-hot encoding, but they are
    - sparse
    - don't capture semantic or contextual information (i.e. distance between any two words is the same
    - Thus use semantic embedding in a smaller dimensional space.
  - Append <sos> and <eos> to Vocab to know when to begin predicting and when to end predictions
  - Discriminative Language Modeling: (Using Bayes Rule) - gives probability of output directly
    P(O<sub>1</sub> , O<sub>2</sub> ... O<sub>t-1</sub> , O<sub>t</sub> , <eos> / I<sub>1</sub> , I<sub>2</sub> ... I<sub>k-1</sub> , I<sub>k</sub> , <sos>) = P(O<sub>1</sub> / I<sub>1</sub> , I<sub>2</sub> ... I<sub>k-1</sub> , I<sub>k</sub> , <sos>) * P(O<sub>2</sub> , O<sub>t-1</sub> , O<sub>t</sub> , <eos> / I<sub>1</sub> , I<sub>2</sub> ... I<sub>k-1</sub> , I<sub>k</sub> , <sos> , O<sub>1</sub>) ...
  - Generative Language Model: P(X, y) = P(X/y).P(y) -> class conditioned LM, and does not give output probability directly and hence not used that often.

#### Measuring:
- BLEU score: Bilingual Evaluation Understanding -> finds score for machine translation
- Accuracy = what % is correct -> bad for imbalanced class
- Precision = tp/(tp+fp) out of what it retrieved, how many were correct
- Recall = tp/(tp+fn) out of all correct how many could it retrieve
- F-score = Harmonic mean = 2*P*R/(P+R)
- Coomparing models:
  - P-test = lower p-value, more significant is the difference
  - Confidence Interval = We have 2 models, and both of them are ran on N data points, it Model 1 is better x times then it is x% confident.

### Transition from LSTM to Attn: (Attention is all you need paper)
- We used 1 LSTM to capture the input sentence, and then when it encountered EOS, it starts emitting the output until it emits EOS.
  - Problem:
    - One Hidden state is supposed to capture the whole of the Input seq
- Thus, give input to all
  - Problem:
    - At every time-step O/P sees all of the inputs with the same wts
- Thus, with every input to decoder (which comes from encoder), associate a weight for every output. -> ATTENTION!!!! -> Cross Attention (since between encoder and decoder)
  - Problem:
    - Hidden state in O/P needs to preserve the output context
- Thus, add the output at prev step as another input (use teacher forcing from time-to-time)
  - Question:
    - Do we even need recurrence anymore?
- We can apply self-attention and get rid of recurrence
  - Since got rid of attention, attention is all you need.
  - Problem:
    - No concept of sequence in the Encoder now, since everyone can see everyone (no locality bias)
- Thus, add positional embeddings
- When using 1 set of matrices of K, Q, V -  Single head attention
- When using multiple sets of matrices - Multi-head attention

### Learning:
- Multi-task learning: Teach on multiple tasks
- Transfer Learning: teach on something else and then we care about just one final application
- Pre-training: Train for one purpose initially and then fine tune on the final task
- Prompting: Use a trained model for different tasks (no fine-tuning here)
- 

### Transformer:
#### About:
- Seq to Seq models
- Variable sized inputs accepted (with padding - and ignores the padded part later on)
- Self attn gives contextual embeddings
- Multi-head attn: every head focuses on different aspects of the inputs
- Characteristics:
  1. Multi-headed self attn
  2. Cross Attention between encoder and decoder
  3. Masked Self attn in decoder
    - Masked attn in decoder preserved the auto-regressive nature while letting it train fast and in parallel, instead of waiting for sequential output
  4. Positional embeddings
  5. Layer Normalization
    - Normalizes mean and variance of the O/P of embeddings
    - Large/Small embeddings - bad for future layer computations
    - Layer Normalization is a technique used in machine learning and artificial intelligence to normalize the inputs of a neural network layer. It ensures that the inputs have a consistent distribution and reduces the internal covariate shift problem that can occur during training. By normalizing the inputs, Layer Normalization enhances the stability and generalization of the network.
    - Layer Normalization operates by calculating the mean and variance of the inputs for each sample. It then applies a normalization transformation to the inputs, bringing them to a standard distribution. This helps to reduce the impact of different scales and ranges of feature values, making the learning process more stable and efficient.
    - Indep of batch sizes (unlike Batch Norm)
    - https://h2o.ai/wiki/layer-normalization/
  6. Residual connections
  7. Scheduler - AdamW (increase and then decreased)
  8. Label Smoothing - Redistribution of probabilities
  9. Multi-task learning
    - Trained on multiple tasks

#### Advantages:
- Removed Vanishing gradient problems of LSTM
- Parallelized the computations

#### Mathematics:
- K, Q, V matrices
  - Query -> used to find the weights of all wrt current token
  - Key -> the value used for finding current token's weight for any other token
  - Value -> the value used when weights of all others are found
- w<sub>i</sub> = <QK<sup>T</sup> / sqrt root of d
- ATTN(Q, K, V) = Softmax of W's * V
- Scaling by root of d:
  - This is done to avoid large dot-product values causing softmax to give very small gradients when dk is large.

#### Decoder:
Below are the training objectives: (could be that we ask it to generate the next word OR could be that we ask it to generate the Masked word given the words before and after it)
- Could be Bidirectional (uses Masked Self Attn to mask out some words in between and asks to generate them) -> eg BERT 
- Auto-Regressive (since we input the previous outputs - training objective could be generate the next word given the previous ones) -> GPT

#### Transformers during inference:
- Use Teacher forcing (else gets very difficult to find 1-1 correspondence between Actual O/P and desired output and model needs to be trained because one wrong prediction can lead to faulty outputs in all O/Ps in future steps


#### Transformers during inference:
- Beam Search? -> only during inference, right?
- CTC? where and check again!

### Language Models:
- All Tx based
- Different data used to train
- Different Objective

| Parameter/Model | BERT          | 
| -------------   | ------------- |
| About    | Input: Embeddings, Position Embeddings, Segment Embedings  |
| Objective    | Masked Word Prediction + Next sentence prediction  |
| Training Data | - Wikipedia + Books corpus |
| Results | <ul><li>Gives Birectional Contexts</li><li>Contextual Representations (different representations for word 'bank' in river and money situations</li></ul> |
| Notes | <ul><li>15% of total words masked</li><li>Out of 15% - 80% with [MASK], 10% random, 10% No change</li><li>[CLS] - Classify token - used for IsNextSent task, and hence can be used to get the emb of whole sent</li></ul> |

