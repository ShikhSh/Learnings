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
- Thus, with every input, associate a weight for every output.
  - Problem:
    - Hidden state in O/P needs to preserve the output context
- Thus, add the output at prev step as another input

### Transformer:
#### Decoder:
- Not Bidirectional (uses Masked Self Attn)
- Auto-Regressive (since we input the previous outputs)

### LM during inference:
- Beam Search? -> only during inference, right?

