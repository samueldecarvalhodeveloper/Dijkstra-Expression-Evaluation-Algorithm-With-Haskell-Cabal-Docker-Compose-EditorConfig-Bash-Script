#syntax=docker/dockerfile:1

FROM haskell:9.10

WORKDIR /src/app

COPY ./expression-evaluator.cabal /src/app/expression-evaluator.cabal
COPY ./app/ /src/app/app/

RUN cabal update

RUN cabal build

CMD cabal run
