#!/usr/bin/env bash

$HOME/slivka-bio/binaries/iupred/iupred $*
if [ -f out.glob ]; then
    PARSER_ARGS="${PARSER_ARGS} --glob out.glob --feat iupred.jvfeat"
fi
if [ -f out.short ] || [ -f out.long ]; then
    if [ -f out.short ]; then
        PARSER_ARGS="${PARSER_ARGS} --short out.short"
    fi
    if [ -f out.long ]; then
        PARSER_ARGS="${PARSER_ARGS} --long out.long"
    fi
    PARSER_ARGS="${PARSER_ARGS} --annot iupred.jvannot"
fi
python $HOME/slivka-bio/scripts/parser.py iupred ${PARSER_ARGS}