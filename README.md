# Getting Started

## Requirements

Please install the following:

- [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
  - You'll know you've done it right if you can run `git --version`
- [Foundry / Foundryup](https://github.com/gakonst/foundry)
  - This will install `forge`, `cast`, and `anvil`
  - You can test you've installed them right by running `forge --version` and get an output like: `forge 0.2.0 (f016135 2022-07-04T00:15:02.930499Z)`
  - To get the latest of each, just run `foundryup`

## Quickstart

```sh
git clone https://github.com/PatrickAlphaC/denver-security
cd denver-security
forge install
```

Then, run our test suite, lots of stuff fails!!

```
forge test
```

# Let's use tools to find bugs!

Understanding business requirements: We can find these bugs with minimal test suites!

## Test Suite

`CaughtWithTest.sol`'s `setNumber` should set `number` to the input parameter, but it doesn't!

To catch this, we write a test for our expected output, and run:

```
forge test
```
