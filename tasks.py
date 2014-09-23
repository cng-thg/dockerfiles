from __future__ import print_function
from invoke import task


@task
def make_dir(value):
    print(value)


@task
def foo(bar):
    print(bar)
