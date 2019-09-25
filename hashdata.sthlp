{smcl}
{* Sep 23rd 2019}
{hline}
Help for {hi:hashdata}
{hline}

{title:Description}

{p}{cmd:hashdata} imports data from another location and validates it
against a stored {help datasignature}. It is intended to allow easy
data {it:storage} in a (private) location that is not tracked by Git,
and encourage version-controlled data {it:processing}
entirely within (public) Git-friendly tracking.

{title:Syntax}

{phang}{cmd:hashdata} [{it:"/data/storage/location.dta"}]
{break}	{help using} {it:"/data/target/location.dta"} ,
{break} [reset] [replace] {p_end}

{title:Instructions}

{p}{cmd:hashdata} will load the data from the storage location if specified.
It will then use {help datasignature} to check it against a stored .dtasig,
which must live at the target location and have the same name.
If there is a mismatch, the command will report this and terminate.{p_end}

{p}The {bf:reset} option allows the data signature to be overwritten.
The {bf:replace} option allows the target data file to be overwritten.
The data file will be saved at the target location if the datasignature matches
or if {bf:reset} and {bf:replace} are both specified.
(The {bf:reset} option should be specified on the first run to initialize the .dtasig){p_end}

{p}The essential idea is that the dataset will not persist at the target location:
.dta should be in the .gitignore for the folder and .dtasig should be tracked.
Therefore the data is not exposed publicly in any case (except variable names)
and does not clutter the repository; but there is a version history of metadata
allowing the user to confirm that the correct data is being loaded each time.

{title:Author}

Benjamin Daniels
bbdaniels@gmail.com

{title:Contributing}

{p}{bf: hashdata} is open for development on {browse "https://github.com/bbdaniels/hashdata/":GitHub}.
Submit bugs and feature requests {browse "https://github.com/bbdaniels/hashdata/issues":here}.
If you like {bf:hashdata}, be sure to visit my {browse "http://www.benjaminbdaniels.com":homepage}
and {browse "https://gist.github.com/bbdaniels/a3c9f9416f1d16d6f3c6e8cf371f1d89":Stata boilerplate code}.{p_end}
