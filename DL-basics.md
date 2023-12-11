SOURCES:
- https://nn.labml.ai/
- https://twitter.com/maximelabonne
- https://github.com/mlabonne/llm-course
- LLama2 notebook - https://colab.research.google.com/drive/1PEQyJO1-f6j0S_XJ8DV50NkpzasXkrzd#scrollTo=OJXpOgBFuSrc

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
### Language Modeling:
  - Given N-1 words, predict the Nth word
  - Actually predicts a probability distribution over the whole Vocabulary for the next word
  - Sample the next word from this distribution/pick up the max probability one
  - Inputs could be 1-hot encoding, but they are
    - sparse
    - don't capture semantic or contextual information (i.e. distance between any two words is the same
    - Thus use semantic embedding in a smaller dimensional space.
  - Append <sos> and <eos> to Vocab to know when to begin predicting and when to end predictions
  - Generative Language Modeling: (Using Bayes Rule)
    P(O<sub>1</sub> , O<sub>2</sub> ... O<sub>t-1</sub> , O<sub>t</sub> , <eos> / I<sub>1</sub> , I<sub>2</sub> ... I<sub>k-1</sub> , I<sub>k</sub> , <sos>) = P(O<sub>1</sub> / I<sub>1</sub> , I<sub>2</sub> ... I<sub>k-1</sub> , I<sub>k</sub> , <sos>) * P(O<sub>2</sub> , O<sub>t-1</sub> , O<sub>t</sub> , <eos> / I<sub>1</sub> , I<sub>2</sub> ... I<sub>k-1</sub> , I<sub>k</sub> , <sos> , O<sub>1</sub>) ... 

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
#### Mathematics:
- K, Q, V matrices
  - Query -> used to find the weights of all wrt current token
  - Key -> the value used for finding current token's weight for any other token
  - Value -> the value used when weights of all others are found
- w<sub>i</sub> = <QK<sup>T</sup> / sqrt root of d
- ATTN(Q, K, V) = Softmax of W's * V
- Scaling by root of d:
  - This is done to avoid large dot-product values causing softmax to give very small gradients when dk is large.

### Transformer:
#### Decoder:
- Not Bidirectional (uses Masked Self Attn)
- Auto-Regressive (since we input the previous outputs)

#### Transformers during inference:
- Use Teacher forcing (else gets very difficult to find 1-1 correspondence between Actual O/P and desired output and model needs to be trained because one wrong prediction can lead to faulty outputs in all O/Ps in future steps


#### Transformers during inference:
- Beam Search? -> only during inference, right?
- CTC? where and check again!

