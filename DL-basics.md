# Neural Network intro:
- Neural Networks: Universal function approximator (need to be trained for it)
- Actual loss cannot be used (we do not have all possible values) - so use proxy for actual loss i.e. calculate the Average of Divergence of Loss over the training dataset only
- Avg of Divergence of Loss over train data = ugly function, so use gradient descent to minimize it.

# Basic Concepts:
### Batch Normalization
- We assume in DL: All train data comes from the same distribution.
- Assumption not true across batches
- Thus, to remove Covariate Shifts in data:
  -   Bring to origin
-   
