# Design

## Library

* use of a [generic function](http://www.ada-auth.org/standards/12rm/html/RM-12-1.html) definition to implement the linear regression algorithm `Minimum` as an (almost) regular library.

## Algorithms

For now the minimum is computed through brute force ... (basic iteration).

Some could code others linear regression algorithms 😉

## Loading of the data file

* Did some tweek on the data by replacing `,` with ` ` (space) so as to have a plain use of `Integer_IO`.

## Running the program

* Parameter `LINEAR` OR `PROGRESSIVE` passed on the command-line permits you to change the way fuel consumption is computed.
