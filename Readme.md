# Project Description

Sparse matrix reordering consists in swapping the matrix rows and columns in order to reduce the fill-in or/and the matrix bandwidth. The main benifits of reordering are calculation speed-up and memory storage reducing. Many algorithms can be used to reorder sparse matrices. In this project, I implemented few .m functions which allow to reorder a sparse matrix read from a [Matrix Market](https://math.nist.gov/MatrixMarket/) file using the [Reverse Cuthill-McKee algorithm](https://en.wikipedia.org/wiki/Cuthill%E2%80%93McKee_algorithm). In addition to reordering, it is possible to write the reordered sparse matrix to a Matrix Market file, plot it side-by-side with the original, compute few statistics about it and output the plot as a PNG file. All these functions can be applied to a single input matrix or multiple matrices stored in a given folder. 

## Features

The implemented functions allow:
* Read and write a sparse matrix in Matrix Market file format
* Reorder a sparse matrix using the Reverse Cuthill-McKee algorithm
* Plot the original and reorderd matrices side-by-side
* Output statistics about both matrices (e.g., size, number of non-zeros, fill-in factor, bandwidth)
* Save the plot automatically as a PNG
* Manipulate either a single or multiple matrices

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

What things you need to install the software and how to install them

```
Give examples
```

### Installing

A step by step series of examples that tell you how to get a development env running

Say what the step will be

```
Give the example
```

And repeat

```
until finished
```

End with an example of getting some data out of the system or using it for a little demo

## Running the tests

Explain how to run the automated tests for this system

### Break down into end to end tests

Explain what these tests test and why

```
Give an example
```

### And coding style tests

Explain what these tests test and why

```
Give an example
```

## Dependencies

This project uses [Matrix Market I/O Function for Matlab](https://math.nist.gov/MatrixMarket/mmio/matlab/mmiomatlab.html) released by NIST, to read and write matrix market files.

## Built With

* [GNU Octave](https://www.gnu.org/software/octave/) - (version 5.1.0)

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

