## Toy pipeline for simple Nextflow tests

The purpose of this repo is to have a pipeline with features including:

General:
* Simple
* Small (including required software)
* Quick to setup and run

Pipeline:
* Requires a small package, that can be installed with Conda or Spack
  * Conda: `cowpy` (from `conda-forge`)
  * Spack: `cowsay`
* Reads/writes files

Software options:
* Host
* Containers
* Conda
* Conda with Wave
* Spack
* Spack with Wave
