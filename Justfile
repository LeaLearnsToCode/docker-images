# just manual: https://github.com/casey/just/#readme

_default:
    @just --list

build-ci-rust:
    docker build ci-rust/ -t ci-rust:latest
