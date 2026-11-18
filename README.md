# OpenSAFELY ehrQL

ehrQL is a Python-based query language for electronic health record (EHR) data.
It has been designed for use with the OpenSAFELY platform.

Documentation is at the [OpenSAFELY documentation site](https://docs.opensafely.org/ehrql).

# Experimental National SDE HES data support

This repository ([ehrql-natsde-hes](https://github.com/bennettoxford/ehrql-natsde-hes)) is a fork of the [main ehrQL repository](https://github.com/opensafely-core/ehrql) containing experimental / prototype code. It was created for an HDRS / Bennett Institute collaborative project to investigate possibilities for ehrQL with the National SDE, specifically looking at their tabulation service.

See:

* [the NationalSDE backend](https://github.com/bennettoxford/ehrql-natsde-hes/blob/aa9bc4a878d38fadc3b04580e425ae2550109419/ehrql/backends/nationalsde.py)
* [the NationalSDE table definitions](https://github.com/bennettoxford/ehrql-natsde-hes/blob/aa9bc4a878d38fadc3b04580e425ae2550109419/ehrql/tables/nationalsde.py)
* [the example tabulation in ehrQL](https://github.com/bennettoxford/ehrql-natsde-hes/blob/aa9bc4a878d38fadc3b04580e425ae2550109419/tests/acceptance/external_studies/national-sde-example1/analysis/dataset_definition.py) & associated files

# For developers

See [DEVELOPERS.md](DEVELOPERS.md).

There is also [a glossary](GLOSSARY.md) of terms used in the codebase.

# About the OpenSAFELY framework

The OpenSAFELY framework is a Trusted Research Environment (TRE) for electronic
health records research in the NHS, with a focus on public accountability and
research quality.

Read more at [OpenSAFELY.org](https://opensafely.org).
