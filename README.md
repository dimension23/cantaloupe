# Cantaloupe

Cantaloupe is an experiment to run a legacy tool hmmer3 in Spark Context without re-writing the code.

## How to use this project

The following sections include a step-by-step guide to re-creating the environment for executing the project.

> Note: This project was tested on a machine with Intel Corei7 processor, 8GB RAM and 500GB SSD running Windows 7 Operating System and thus will be considered as minimum hardware requirement for this project.

### Pre-requisites

This project requires a Linux Operating System running Spark and Hadoop services, therefore we set up a Sandbox environment using Oracle VM Virtual Box. Following are three pre-requisites to be installed in order to set up this project. 

- Oracle VM VirtualBox
- Cloudera VM
- Anaconda

We have discussed the installation of each component in detail below.


#### Installing Oracle VM VirtualBox

> VirtualBox is a powerful x86 and AMD64/Intel64 virtualization product for enterprise as well as home use. Not only is VirtualBox an extremely feature rich, high-performance product for enterprise customers, it is also the only professional solution that is freely available as Open Source Software under the terms of the GNU General Public License (GPL) version 2.
> 

We will be using the VirtualBox to run the Cloudera VM which serves as a base for this project. Download and install Oracle VM VirtualBox for Windows using the following link

    http://download.virtualbox.org/virtualbox/5.1.4/VirtualBox-5.1.4-110228-Win.exe

#### Installing Cloudera VM

> Cloudera QuickStart VM (single-node cluster) makes it easy to quickly get hands-on with CDH for testing, demo, and self-learning purposes and include Cloudera Manager for managing the cluster. Cloudera QuickStart VM also includes a tutorial, sample data, and scripts for getting started. Cloudera QuickStart is not intended or supported for use in production.

We will be using Cloudera VM running CDH 5.8 for VirtualBox, the VM can be downloaded from the official page below. Once downloaded mount the image using Oracle VM VirtualBox set up in the previous step. Start the VM.

    http://www.cloudera.com/downloads/quickstart_vms/5-8.html

> From this point onwards we work on the Cloudera VM which is our Sandbox for this project. 

#### Installing Anaconda

We have used Python 2 variant of Anaconda for this project. Anaconda comes with popular python packages pre-installed and we use one of the popular package to document and share our code - IPython notebook. Also, we choose Python language for writing Spark script, known as PySpark.

> Anaconda is the leading open data science platform powered by Python. The open source version of Anaconda is a high-performance distribution of Python and R and includes over 100 of the most popular Python, R and Scala packages for data science.
> 

Anaconda is to be installed in the Cloudera VM which is a Cent OS operating System, hence we choose the 64-bit Linux package for installation. Use the following command to download the package.

    wget https://repo.continuum.io/archive/Anaconda2-4.1.1-Linux-x86_64.sh

Install the package with command below, follow the instructions after executing the command.

    bash Anaconda2-4.1.1-Linux-x86_64.sh

Note: Install Anaconda in your home directory i.e. `/home/cloudera`. After installation, there will be a directory `anaconda2` , which needs to be included as environment variable as instructed in the following steps.

### Setting up the project

Once the Cloudera VM is running with all it's services and Anaconda python, we proceed with setting environment for this project on the Sandbox.

#### Set up the environment variables

Navigate to home directory with `cd ~` and open the `.bashrc` file for editing in your favorite editor, in this case we use `vim`.

    vim .bashrc

Add following lines

    # added by Anaconda2 4.1.1 installer
    export PATH="/home/cloudera/anaconda2/bin:$PATH"

    export PYSPARK_DRIVER_PYTHON=/home/cloudera/anaconda2/bin/jupyter
    export PYSPARK_DRIVER_PYTHON_OPTS="notebook --NotebookApp.open_browser=False --NotebookApp.ip='*' --NotebookApp.port=8880"
    export PYSPARK_PYTHON=/home/cloudera/anaconda2/bin/python

Now, refresh environment variables with `source .bashrc` and execute the following commands, to verify if the variables have been set correctly.

Python

    [cloudera@quickstart ~]$ python
    Python 2.7.12 |Anaconda 4.1.1 (64-bit)| (default, Jul  2 2016, 17:42:40) 
    [GCC 4.4.7 20120313 (Red Hat 4.4.7-1)] on linux2
    Type "help", "copyright", "credits" or "license" for more information.
    Anaconda is brought to you by Continuum Analytics.
    Please check out: http://continuum.io/thanks and https://anaconda.org
    >>> 
    
PySpark with Jupyter/IPython Notebook
    
    [cloudera@quickstart ~]$ pyspark
    [W 07:30:38.932 NotebookApp] Unrecognized JSON config file version, assuming version 1
    [I 07:30:39.629 NotebookApp] [nb_conda_kernels] enabled, 1 kernels found
    [W 07:30:39.722 NotebookApp] WARNING: The notebook server is listening on all IP addresses and not using encryption. This is not recommended.
    [W 07:30:39.722 NotebookApp] WARNING: The notebook server is listening on all IP addresses and not using authentication. This is highly insecure and not recommended.
    [I 07:30:40.347 NotebookApp] ✓ nbpresent HTML export ENABLED
    [W 07:30:40.348 NotebookApp] ✗ nbpresent PDF export DISABLED: No module named nbbrowserpdf.exporters.pdf
    [I 07:30:40.353 NotebookApp] [nb_conda] enabled
    [I 07:30:40.478 NotebookApp] [nb_anacondacloud] enabled
    [I 07:30:40.490 NotebookApp] Serving notebooks from local directory: /home/cloudera
    [I 07:30:40.490 NotebookApp] 0 active kernels 
    [I 07:30:40.490 NotebookApp] The Jupyter Notebook is running at: http://[all ip addresses on your system]:8880/
    [I 07:30:40.490 NotebookApp] Use Control-C to stop this server and shut down all kernels (twice to skip confirmation).

#### Download the project

Once we have finished installing the per-requisites and setting up the environment, its time to download the project by issuing the following command.

    git clone https://github.com/prp4github/cantaloupe.git

Once the project is cloned/downloaded, you should be able to see a directory structure as shown below.

    cantaloupe/
    ├── database
    │   ├── pfam
    │   └── sequence
    ├── input
    ├── output
    ├── src
    └── tests
       

#### Executing the program

Executing the program is really simple, just navigate to `/cantaloupe/src` and execute the `pyspark` command. Once the command is successful, point the browser to `http://127.0.0.1:8880/` which brings up Jupyter notebook showing files in src folder of the project. To run the project notebook, open `cantaloupe.ipynb`. Execute each cell in sequence to achieve the desired results. Each cell is titled appropriately. 

Use the toolbar at the top to execute the entire notebook or a single cell. For shortcuts navigate to `Help > Keyboard Shortcuts`.

#### Output

The output of the program is stored in `/cantaloupe/output`.

