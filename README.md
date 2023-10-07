# The reproduce.work sci-dev-kit
> A collection of tools for flexible, reproducible scientific development --- compatible as a wrapper framework for the vast majority of scientific computing workflows

## Getting started via your CLI
Users of our system are expected to be familiar with the command line interface (CLI) of their operating system. The following instructions are for users of Linux and macOS. Windows users should install [Windows Subsystem for Linux](https://docs.microsoft.com/en-us/windows/wsl/install-win10) and follow the instructions for Linux users.

The reproduce.work ecosystem relies on containerization to facilitate cross-platform computing; as such, the first step is to install [Docker](https://docs.docker.com/get-docker/) or a suitable drop-in replacement such as OrbStack (which is a wrapper service around Docker). Once Docker is installed, you can install the reproduce.work command line interface (CLI) by running the following command in your terminal:

### 1. Build the `sci-dev-kit` Docker image by running the following command in your terminal:
```bash
cd sci-dev-kit # navigate to the sci-dev-kit project's directory in your system's terminal
docker build -t sci-dev-kit ./ # build the sci-dev-kit Docker image
```

### 2. Run the `sci-dev-kit` image with the following command in your terminal, which will launch a JupyterLab Server::
```bash
docker run -i -v /var/run/docker.sock:/var/run/docker.sock -v $(pwd):/home/science -p 8888:8888 sci-dev-kit
``` 

- Working with private data. EXPERIMENTAL; use at own risk
    - If you are working on sensitive data, you can use the following command instead, replacing `/path/to/data` with the path to your local data. This command allows you to access your local data from within the containerized `/home/private` directory. You will be able to work with this data, and as long as you don't save any data or sensitive files within the `/home/open` directory within the sci-dev-kit container, your data will not be accessible to anyone with whom share the container's source code. When running with private data, your data is only accessible to the code you run within the container **when the container is running**. Once you stop the container, your data is no longer accessible to the container. As mentioned, data within the container saved to the `/home/open` directory will be preserved; avoid saving private data here, but be sure to save the results of your analyses here, assuming you do want them to be shared inside the reproducible container.
    ```bash
    PATH_TO_DATA=/path/to/data # replace this with the path to your data
    docker run -i -v /var/run/docker.sock:/var/run/docker.sock -v $(pwd):/home/science -v ${PATH_TO_DATA}:/home/private -p 8888:8888 sci-dev-kit
    ```

    - This workflow may have value to facilitate verification with specific parties with whom researcher selectively shares data. This could help automated review processes and allow for easy verification of results. This workflow is experimental and should be used with caution. We are not responsible for any data loss or data breach that may occur as a result of using this workflow.
 

### 3. Launch your preferred development environment or web browser and configure your computing environment

The JupyterLab integrated development environment can be accessed by navigating to `http://localhost:8888/lab?token=reproducibleScience` in your preferred web browser. If prompted for a password, it will be `reproducibleScience` by default.

Other software designed to interface with the IPython console and `.ipynb` notebook files can also be used with the Docker-based Jupyter instance launched above. For example, the [Visual Studio Code](https://code.visualstudio.com/) integrated development environment can be used to interface with the JupyterLab Server by installing the [Jupyter extension](https://marketplace.visualstudio.com/items?itemName=ms-toolsai.jupyter) and then using the URL `http://localhost:8888/lab?token=reproducibleScience` when prompted for a notebook kernel server URL.

### 4. Do science!

The reproduce.work sci-dev-kit default boilerplate comes preinstalled with Python, IPython, JupyterLab, pandas, numpy, matplotlib, scikit-learn, and several other scientific computing packages. You can install additional packages in Python by modifying the `requirements.txt` file in the root directory of your project. You can also install additional software, including R and other programming languages, by modifying the `Dockerfile` in the root directory of your project. In the future, we will also provide links to other repositories that contain preconfigured Docker images for specific scientific computing workflows.


<!--
```bash
curl -sSL https://reproduce.work/install | bash
```

This will install the reproduce.work CLI in your home directory. You can then run the CLI by running the following command in your terminal:

```bash
~/.reproduce-work/bin/reproduce-work
```

You can also add the reproduce.work CLI to your PATH by running the following command in your terminal:

```bash
echo 'export PATH="$HOME/.reproduce-work/bin:$PATH"' >> ~/.bashrc
```

## Usage

### `reproduce-work init`
The `reproduce-work init` command initializes a new project. It creates a new directory with the following structure:

```
-->

