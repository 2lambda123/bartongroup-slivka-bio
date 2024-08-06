slivka-bio
==========

Slivka-bio is a pre-configured instance of a slivka project
targeted for bioinformatics. It contains configurations for tools such
as Clustal Omega, ClustalW2, Muscle, IUPred, Mafft and more.
The goal is to provide (almost) ready to use package which bundles
bioinformatic software in one tool.
The applications currently available include:


 - [AACon](https://www.compbio.dundee.ac.uk/aacon/)
 - [Clustal Omega](http://www.clustal.org/omega/)
 - [ClustalW2](http://www.clustal.org/clustal2/)
 - [DisEMBL](http://dis.embl.de/)
 - [GlobPlot](http://globplot.embl.de/)
 - [IUPred](http://iupred.enzim.hu) (sources not included)
 - [JPred](https://www.compbio.dundee.ac.uk/jpred/index_up.html)
 - JRonn (Java implementation of [RONN](https://www.bioinformatics.nl/~berndb/ronn.html))
 - [MAFFT](https://mafft.cbrc.jp/alignment/software/)
 - [MSAProbs](http://msaprobs.sourceforge.net/homepage.htm)
 - [MUSCLE](https://www.drive5.com/muscle/)
 - [ProbCons](http://probcons.stanford.edu/)
 - [T-Coffee](http://tcoffee.org/)

Downloading slivka-bio
======================

To download slivka-bio, you have two options:

1. **Download the zip file**: you can directly download end extract the
project as a zip from the following link: 
[slivka-bio v0.8.3](https://github.com/bartongroup/slivka-bio/archive/refs/heads/v0.8.3.zip).
2. **Clone the git repository**:
```sh
git clone --branch v0.8.3 --single-branch https://github.com/bartongroup/slivka-bio.git
```
3. **Install with conda**: slivka-bio and all its dependencies can be installed
automatically by conda package manager
```sh
conda install -c slivka -c mmwarowny -c bioconda -c conda-forge slivka-bio=0.8.3
```

This will download the *v0.8.3* version of slivka-bio into a directory
named *slivka-bio* or into your conda environment files.
The project, however, requires *slivka* and the bioinformatic tools to work.
If you choose to download the project sources, the dependencies need to be
installed manually. The conda installation installs (almost) all tools
and dependencies automatically.

Conda Installation
==================

The recommended way to manage slivka installation and dependencies
is through conda package manager. If you don't have `conda` or `mamba`
installed, follow the miniconda installation instructions from
[conda user guide](https://docs.conda.io/projects/conda/en/latest/user-guide/index.html).

Once the conda installation completes, create a new conda environment
that will contain slivka and most of the bioinformatic tools used by
slivka-bio. Installation of programs not available through conda is
covered later in this document.

Installing from environment file
--------------------------------

The slivka-bio repository contains an exported conda environment file
*environment.yaml*. Importing it is the easiest way to get started with
slivka. It automatically takes care of tool versions and dependencies.
You can create a new environment named *slivka-bio* and install the
packages from the environment file using the following command. You can
choose a different name for the environment if you prefer. 
 
```sh
conda env create --name slivka-bio --file environment.yaml
```

If you chose this installation option, you can skip the
*installing slivka* section and installation of bioinformatic tools with
conda.

Installing slivka
-----------------

If you prefer not to import the existing environment and manage software
versions yourself, you can install slivka from our conda channel or from
sources.
Our conda channel *slivka* contains more stable versions of slivka. At
the time of writing, the current version is 0.8.3. It is recommended to
use python version 3.10 which should be compatible with all
bioinformatic tools used by slivka.

```sh
conda install python=3.10 slivka::slivka=0.8.3
```

Alternatively, if you like living on the edge, you can install the
version directly from sources from github. You can choose the branch you
wish to fetch the sources from by specifying the `--branch` option.

```sh
git clone --branch master --single-branch https://github.com/bartongroup/slivka.git
(cd slivka; python setup.py install)
```

Keep in mind that slivka-bio does not include binaries for bioinformatic
tools except for JRONN and AACon.
You need to install them manually from conda or from sources.

Installing bioinformatic tools
------------------------------

If you chose to install slivka-bio dependencies using the environment
file then all of the tools are already installed in your environment.

However, if you decided to install or update them manually, they
are available as packages from *bioconda* or my *mmwarowny* channels

### Bioconda ###

The following tools are available from the bioconda:

  - aacon
  - clustalo
  - clustalw
  - jronn
  - mafft
  - msaprobs
  - muscle
  - probcons
  - t-coffee
  - rnaalifold

You can install them with the command below (remember to activate the
conda environment first). I advise against installing t-coffee from
bioconda as their package locks version of other bioinformatic tools
causing version conflicts. An alternative, dependency-free version is
provided by my *mmwarowny* channel.

```sh
conda install -c bioconda -c conda-forge \
    aacon=1.1 \
    clustalo=1.2.4 \
    clustalw=2.1 \
    jronn=7.1 \
    mafft=7.458 \
    msaprobs=0.9.7 \
    muscle=5.1 \
    probcons=1.12 \
    t-coffee=13.46 \
    viennarna=2.6.4
```

### My own conda channel ###

For the long line tools DisEMBL and GlobPlot depended on a closed-source Tisean
package and could not be added to bioconda. However, after the license changes,
they are now openly available from my *mmwarowny* channel.

```sh
conda install -c mmwarowny -c conda-forge disembl=1.4 globplot=2.3
```

If you decide not to install bioconda version of *t-coffee* package, you can
install it from my channel with:

```sh
conda install -c mmwarowny -c conda-forge t_coffee=13.46
```

### Building from sources ###

It is highly recommended to install the bioinformatic tools using the package
managers.  However, if you prefer building them from the sources and have a
full control over it you are free to do so.  After the compilation, make sure
that the binary location is included in the PATH variable or set the absolute
path to the binary in the service configuration file.

#### IUPred ####

Due to the legal limitations, IUPred sources could not be included in
the slivka-bio package nor can be provided through conda.
If you wish to use it, you can obtain the sources from
[iupred website](http://iupred.enzim.hu/Downloads.php).
Then, place them in *bin/iupred* directory and run ``make iupred``.

Compiling IUPred requires C compiler, which is a part of the GNU
toolchain, to be installed on your system.
Make sure that `make` and `gcc` are available on your system.

On Debian/Ubuntu/Mint they can be installed with
```sh
apt-get install make gcc
```

On CentOS/Redhat/Fedora they are available as part of the Development Tools
```sh
yum group install "Development Tools"
```

Using homebrew on MacOS
```sh
brew install make gcc
```

Using conda package manager
```sh
conda install gcc_linux-64  # linux
conda install clang_osx-64  # MacOS
```

For other operating systems refer to you package manager repositories.

## WSGI server ##

Web Service Gateway Interface is a convention for web servers to
forward HTTP requests to python application.
Recommended middleware supported by Slivka include
[Gunicorn](https://gunicorn.org/) and
[uWSGI](https://uwsgi-docs.readthedocs.io/en/latest/).
You need to install one of those (both available as conda packages)
to use slivka server.
If you want to use other software the wsgi application is located in
the *wsgi.py* module file and is named *application*.


Configuration
=============

Slivka-bio configuration is organised into multiple files.
Basic configuration is located in the *settings.yaml* file
in the repository root directory
The configurations for each service is located in its respective file
in the *services* folder.
If slivka-bio was installed with conda package manager, the configuration
files are located at `$CONDA_PREFIX/var/slivka-bio`

For in depth service configuration instructions refer to the
[slivka documentation](http://bartongroup.github.io/slivka/).

Launching
=========

## MongoDB ##

Slivka depends on [MongoDB](https://www.mongodb.com) for exchanging
and storing data.
Ask your system administrator for installation and access to the mongo
database on your system or, if you need user installation only, mongodb
is available through conda in *anaconda* channel.
Once installed, MongoDB process can be started using `mongod` command.
More information on available command line parameters and configuration
can be found in the [mongod documentation](https://docs.mongodb.com/manual/reference/program/mongod/).

## Slivka ##

Once you finished the configuration step, you can deploy your own
slivka server.
First, navigate to the slivka configuration directory (the one having
*settings.yaml* in it). Alternatively, you can set *SLIVKA_HOME*
environment variable pointing to that directory.
For slivka to operate properly, you need to start its three processes:
http server which manager incoming connections, scheduler which collects
and dispatches incoming job requests, local-queue which stacks and runs
incoming jobs on the local machine.

The three processes are launched using `slivka` command created during
slivka installation. Alternatively, you can use *manage.py* script
located in the project directory which automatically sets *SLIVKA_HOME*
variable when started.
If you have slivka-bio installed as a conda package, use `slivka-bio`
command instead. All other command line parameters remain the same.

### Server ###
```sh
slivka start server [-t TYPE] [-d -p PID_FILE] [-w WORKERS]
```
Starts the HTTP server using WSGI application specified by *TYPE*.
Allowed values are `devel`, `uwsgi` or `gunicorn`. The specified
application must be installed and available in the *PATH*.
The development server is always available, but it can't serve more
than one client at the time therefore it's not recommended for production.

If you want to make your server publicly accessible, we recommend running
it behind a reverse proxy server. Refer to your wsgi application
documentation for more details.

Providing `-d` flag along with `-p PID_FILE` starts the process in
background as a daemon and writes its pid to the file.

You can also specify the number of worker processes explicitly.
Defaults to twice the cpu-count.

### Scheduler ###
```sh
slivka start scheduler [-d -p PID_FILE]
```
Starts the scheduler that collects and dispatches new jobs and monitors their states.
Providing `-d` flag starts the scheduler as a daemon and `-p PID_FILE`
specifies the pid file location.

### Local queue ###
```sh
slivka start local-queue [-d -p PID_FILE] [-w WORKERS]
```
This is a default job runner which spawns new jobs as subprocesses on
the local machine. If you specify `-d` and `-p PID_FILE` the process
will run as a daemon and write its pid to the specified file.

Additionally, you may specify the number of workers i.e. the number
of jobs which can be run simultaneously. Defaults to 2.

