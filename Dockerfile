FROM circleci/buildpack-deps

RUN sudo apt-get update && sudo apt-get install -y \
    ocaml opam

RUN opam init && \
    opam config env && \
    opam install -y oasis ounit bisect

ENV PATH="/home/circleci/.opam/system/bin:$PATH"
ENV OCAML_TOPLEVEL_PATH="/home/circleci/.opam/system/lib/toplevel"
ENV PERL5LIB="/home/circleci/.opam/system/lib/perl5:$PERL5LIB"
ENV MANPATH="$MANPATH:/home/circleci/.opam/system/man"
ENV CAML_LD_LIBRARY_PATH="/home/circleci/.opam/system/lib/stublibs:/usr/lib/ocaml/stublibs"
