# About

*[⭐️ (7:21:12) | Lesson 15 | Security & Auditing](https://www.youtube.com/watch?v=wUjYK5gwNZs&t=26472s)*

Learning how to use security tooling to find bugs!

- [About](#about)
- [Getting Started](#getting-started)
  - [Requirements](#requirements)
  - [Quickstart](#quickstart)
- [Let's use tools to find bugs!](#lets-use-tools-to-find-bugs)
  - [Manul Review](#manul-review)
  - [Test Suite](#test-suite)
  - [Static Analysis](#static-analysis)
    - [Prerequisites](#prerequisites)
  - [Fuzzing](#fuzzing)
  - [Stateful fuzzing (invariants)](#stateful-fuzzing-invariants)
  - [Formal Verification (SMT Checker)](#formal-verification-smt-checker)

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

## Manul Review

In `CaughtWithManualReview.sol` we see `doMath` should add 2 instead of one! We were only able to know this because we read the documentation associated with the function.

## Test Suite

`CaughtWithTest.sol`'s `setNumber` should set `number` to the input parameter, but it doesn't!

To catch this, we write a test for our expected output, and run:

```
forge test -m testSetNumber -vv
```

## Static Analysis

### Prerequisites

- [Python](https://www.python.org/downloads/)
  - You'll know you've installed python right if you can run:
    - `python --version` or `python3 --version` and get an output like: `Python x.x.x`
- [pipx](https://pypa.github.io/pipx/installation/)
  - `pipx` is different from [pip](https://pypi.org/project/pip/)
  - You may have to close and re-open your terminal
  - You'll know you've installed it right if you can run:
    - `pipx --version` and see something like `x.x.x.x`

We recommend installing slither with `pipx` instead of `pip`. Feel free to use the [slither documentation](https://github.com/crytic/slither#how-to-install) if you prefer.

```
pipx install slither-analyzer
```

To run slither, run:

```
slither . --exclude-dependencies
```

See what it outputs!

## Fuzzing

`CaughtWithFuzz.sol`'s `doMoreMath` should never return 0... but how can we make sure of this? We can pass random data to it!

To catch this, we write a test for our expected output, and run:

```
forge test -m testFuzz -vv
```

## Stateful fuzzing (invariants)

Our `CaughtWithStatefulFuzz` contract's `doMoreMathAgain` should never return 0... and looking at it, a regular fuzz test wouldn't work!

You can run:

```
forge test -m testFuzzPasses
```

And no matter what, it'll always pass! We need to call `setValue` first, and then we can get it to revert! Invariant/Stateful Fuzzing tests do random data input combined with random function calls.

Run:

```
forge test -m invariant_testMathDoesntReturnZero -vv
```

And you'll see the 2 calls made to fail!

## Formal Verification (SMT Checker)

In `foundry.toml` uncomment the `profile.default.model_checker` section.

Then, just run: `forge build`

Our solidity modeled our `functionOneSymbolic` to be a math equation, and then, solved for the math!
