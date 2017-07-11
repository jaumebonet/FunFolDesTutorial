## About this repository

In this repository one can find _RosettaScripts_ to be used both as test and example on how to run the FoldFromLoops protocol.  

With them, it can also be find a [presentation](presentation) to guide the tutorial.

>This repository does not contain the code to run __FoldFromLoops__.  
>To run these examples, one needs the last version of the __[Rosetta Suite](https://www.rosettacommons.org/software)__.

## Scenarios: Examples of use

The most simple example, the insertion of a __single motif__ segment into a template __without binder__ can be found [here](scenarios/nobinder/onesegment).

To find a example that fits a particular type of problem, you can follow this table:


||__binder__|__nobinder__|
|-|-|-|
|__one segment__|[bo](scenarios/binder/onesegment)|[no](scenarios/nobinder/onesegment)|
|__multiple segment__|[bm](scenarios/binder/multisegment)|[nm](scenarios/nobinder/multisegment)|

Different scenarios can be presented in each example type.

### Database Requirements

The __NubInitioMover__, that is the basis of the _FFL protocol_, relies on _ab initio_. Thus, in order to run it, fragments for the template protein must be created. Fragment files have been already created for the examples contained here, but if one would make its own runs with new templates, the _vall database_ is needed.  
The database can be build following the description in the [database folder](database).

### Running all the scenarios

All scenarios can be automatically run one after the other __(nstruct=2)__, by calling the python script:
```
python scenarios/run_test.py
```
Running the script with the `print` parameter
```
python scenarios/run_test.py print
```
would just print the commands that are going to be executed, and it is recommended before running the full test.  

After this, a `scenarios/paths.json.user` will be created. In that file the path and version of your Rosetta distribution should be set up.
