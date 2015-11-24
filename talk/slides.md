Quantitative Portfolio Optimization
**Thomas Schmelzer**

$Thalesians


Intro
-----

Swati, thanks for having me here today. It's a pleasure to speak in front of such a large crowd about one of my favorite topics
I am happy to see so many familiar faces in the audience. Raphael Hauser is here. I have learnt everything I know about the subject from him.

In this talk I try to give you an introduction into the subject and point out some of the most common traps in this area.
I am very aware that some of you may have a strong and some others almost no background in this particular area.
The good news is that there are drinks in like 60 minutes.

I also try to avoid to get lost in technical details here but I shall confess that I am a mathematician by training (feels great
to be back at ETH. I used to be a student here when I was still young.

About me and Portfolio Optimization:
------------------------------------

- I joined Winton Capital back in 2007. Risk measurement (covariance matrices, volatilities, etc.) and portfolio optimization

- Working with Raphael Hauser (Oxford University) and Paul Rosinger (in the audience today!)

- Started to work closely with Mosek (www.mosek.com, bought the first license for Winton)

- In 2010: Moved back to Switzerland via IMC Zug

- In 2013: Gardening leave at Maui, Hawaii. Two small reports online!

- Since 2014: Head of Research for a Swiss Family Office at Geneva


Semantics:
----------
Optimization is almost an evil term today (as bad as fitting?). Too ambiguous for most people.

Mathematicians: Convex Programming, Conic programming!

Finance practioners: Asset Allocation (very ambiguous too)


Challenges:
-----------

- Usually underestimated! Show me the Excel function that does ...  It's all just an IT problem

- Modelling (implicit constraints, reverse engineering, politics etc.) Black Litterman???

- Complex maths, freedom to formulate problems



The sculptor method:
--------------------

- That's Thales! How do you make a Thales?

- Take a block of stone and remove everything that doesn't look like Thales! You end up with Thales!

- I call this approach the sculptor method.


An index tracker?:
------------------

We want to combine a few assets (or indicators, etc.) such that we match a given index (or returns etc) as close as possible.

This is a (convex) least-squares problem. We try to find weights w such that

A * w  is close to some vector b

So we need a "distance" between A * w and b

argmin Norm(A * w -  b) = argmin Norm^2 (A * w - b)

but there are constraints(!), sum w = 1 and all w have to be non-negative.

Good news?

w = (A'A)^(-1) * A'*b

NORMAL EQUATIONS! or use your fav. decomposition (QR, SVD, etc)

Let's take w as our stone block and then apply the sculptor method!?


Do you see the ice-cream?
-------------------------

In general very bad idea to introduce such "clever" intermediate steps. Leave it to the solver!


Picture of a cone!


That's a quadratic cone. It's convex


We introduce 1 additional variable y

min y

[y, A*w - b] is a cone

sum w = 1

w >= 0


or even better:


min z

[z, x] is a cone

x = A*w - b

sum w = 1

w >= 0


Note:
- Linear objective
- Linear constraints
- One conic constraint
- 2n + 1 variables! We lifted the problem...
- w >= 0 is actually also a cone :-)


Application: Minimum variance portfolio
-------------------------------------------

Variance

1/n sum (r_i - mean(r))^2 approx 1/n 2-Norm (r)^2 = 1/n r'*r
if we assume mean(r) = 0


m stocks, try to find a linear combination of them that is minimizing the variance!

A: column i is the return time series of a stock i
b: Null-vector (we ignore the mean term in the definition of the variance)

Variance of the portfolio
1/n A * w = 1/n w' A' A * w = w'*Cov*w = W'*vol' * Cor * vol * w

It's usually better to move to risk space rather than weights

DEMO

#Let's discuss the solution
#Loads of weight on...

#Let's make an upper bound?



Did we say anything about expected returns?
-------------------------------------------

Yes, implicitly we did. We kind of assume they are all positive and exactly the same for each asset.
Where did we say that? Implicitly
it's a latent statement


Let's say max expected return

max mu' * x - lambda 1/n * Norm(R*w)
s.t sum x = 1

$$A \times x - b$$

You are solving a special case of a more general problem. That's helpful! It offers insight!
You have made a choice!
If you have different opinions about expected returns you shouldn't use the minimum variance portfolio!

We can also argue that we solved the problem above for lambda going to infinity, etc.


Do we like the solution?
------------------------

No, too much weight on asset x

Too concentrated

- We could do bounds (I can of hesitate as people tend to misuse bounds)
- We could appliy Tikhonov regularization (penalty two-norm!), e.g Shrinkage
We apply a bias! That's not bad!




What's possible
----------------
- sparse minimum variance portfolio
- existing position (e.g. trading costs)
- bounds on weights
- solving the general problem (bounds on the 1-norm of x, e.g. 130/30 portfolios etc):

max mu'*x   - lambda 1/n * Norm(R * w)     - lambda_2 * 1-Norm(T*(w - w_0))

s.t. sum x = 1
     1-Norm(x) <= 1.6


A second example
----------------

Simple version

max    mu'*x
s.t.   x'*C*x <= Variance

That's how it all started. Combining the indicators of Winton (mu) with the covariance matrix.
Analytic solution?

You may prefer an alternative formulation but often they are equivalent (verify via the KKT conditions)


Example with Mosek and Python:
------------------------------
Github...
git clone...

Comes with a 30day license.

Selection of 50 stocks...
Every month I run a min var portfolio and apply the weights
vs. index

-- Transaction costs
-- Sparsity
-- Paper online:
http://arxiv.org/abs/1310.3397



Mean-Variance optimization:
---------------------------
Simple version

max    mu'*x
s.t.   x'*C*x <= Variance

I kind of got attacked for this version a few times in the past.
Others use min risk,    or max mu'*x - lambda * x'*C*x

All those problems are mathematically equivalent (use KKT conditions)

There is an analytic solution... (good news: most people haven't heard about it)

....

Analytic solutions are often not that useful    [Lloyd Nick Trefethen]

Sculptor method applies? NO!!!!!!!!!!!!!!!!!!


If the answer is highly sensitive to perturbations, you have probably asked the wrong question.
Lloyd Nick Trefethen, MAXIMS ABOUT NUMERICAL MATHEMATICS, SCIENCE, COMPUTERS, AND LIFE ON EARTH


Just because there's an exact formula doesn't mean it's necessarily a good idea to use it.
Lloyd Nick Trefethen, MAXIMS ABOUT NUMERICAL MATHEMATICS, SCIENCE, COMPUTERS, AND LIFE ON EARTH


This problem is hard enough to illustrate quite some traps but simple enough to be discussed in a talk here


Typical reaction:
-----------------

- It's broken

- The positions that come out are crazy

- We invented something proprietary far superior to such simple stuff. Obviously we can't mention details :-)
(e.g. we don't know literature, if you are investor you such put this term high up on your bullshit list)

- Some are rediscovering established concepts:
mole hill












Same trick: Get the problem into the "conic language"

Cholesky: C = G G'





























Semantics and evil terms:
In Swiss Banking avoid words such as:
Short, Leverage, Hedge Fund, Cayman,

Portfolio Optimization is a bit of an evil word in some companies. The problem is that some people think I tweak backtests and parameters.
That's often a very non-linear and non-convex problem and has to be treated with great caution.

When I say portfolio optimization I think about convex programming. A large class of problems in finance falls into this framework.
(Constrained) regression, Mean variance optimization with and without transaction costs, etc.

Warning:

- Portfolio Optimization often underestimated or classified as some sort of IT problem (which function I have to call)
I have seen horrendous mistakes (and they tend to repeat) and it's all based on this implicit assumption that I just have to call
a function I can download from some webpage.

- Convex Programming is actually an entire branch of mathematics
Books, people, courses



- Challenges

---> often complex mathematics
---> political mine-field (go and explore Black-Litterman model)
--->


- Starting point / Experiments / Slides

Github:

git clone ... @v1.0

We love Python

We love Mosek



