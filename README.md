Chain Link
==========

Copyright (C) 2014 Christopher Roberts
Licensed under the [GPL v3 Licence](https://github.com/chrisjrob/chainlink/blob/master/LICENCE.md "Read licence")

Description
-----------
OpenSCAD design for a chain link.
The two halves clip together, generally without the need for glue.

Status
------
Complete.

Instructions
------------
* Edit SCAD file with your preferred parameters.
* Set selection, depending on whether you wish to print all or part of the link.
* Compile and export to STL.
* Alternatively download the included STL.
* Slice with a raft - this is only required for the male part ([see below](#raft)).
* Print.

<a name="raft"></a>
The male part of the chain link is slightly problematic to print, being prone to lifting. 
For this reason I would recommend printing with a raft and printing on its own, 
so that it isn't left on its own whilst a layer of the female part is printed.

Would benefit from being printed in a slightly flexible plastic, to cope with impact.

Assembly
--------
Clip two halves together to make the first link.
For the next link do the same, but putting through the first link.
Repeat until you have a chain.
