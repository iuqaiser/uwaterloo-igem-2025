# Uwaterloo iGEM 2025
Waterloo iGEM 2025 Math and Modelling

## File structure
```
├── README.md
├── models
│   ├── subsubteam1
│   │   ├── model1
│   │   ├── model2
│   │   ├── README.md
│   │   └── requirements.txt / environment.yml
│   ├── subsubteam2
│   │   ├── etc...
│   ├── etc...
```

## Setups
For each subsubteam, create your own requirements.txt within the models folder.

Try to make sure the Python version is consistent with the rest of the team.
eg. [Python 3.11](https://www.python.org/downloads/release/python-3110/)

**To make requirements.txt, use the following command:**
```
$ pip freeze > requirements.txt
```
or this if you are using conda:
```
$ conda env export > requirements.txt
or
$ conda env export > environment.yml
```

**To create a virtual environment, use the following command:**
```
$ python -m venv .venv
```
or if you are using conda:
```
$ conda create --name 'name of environment' python=3.11
```

**To install packages from requirements.txt, use the following command:**
```
$ pip install -r requirements.txt
```
or this if you are using conda (the above works as well):
``` 
$ conda env update --file requirements.txt
or
$ conda env update --file environment.yml
```

**To run the environment, use the following command:**
```
$ cd 'path where .venv is located'
$ source .venv/bin/activate
```
or on Windows:
```
$ cd 'path where .venv is located'
$ .venv\Scripts\activate
```
or if you are using conda:
```
$ conda activate 'name of environment'
```

## Jupyter Notebook
To run Jupyter Notebook, use the following command:
```
$ jupyter notebook
```
or if you are using vscode editor for Jupyter Notebook:
- remeber to install the Jupyter extension for vscode
- select the correct kernel for your notebook
- run the notebook

If you need GPU access for whatever reason, use [google colab](https://colab.google/).

## Git
Each person working on their own branch:
eg. name/branch_abbreviations/branch_name
- name: your name
- branch_abbreviations: the abbreviation of your subsubteam
- branch_name: the name of your branch
- eg. `wallace/hy/hydrogel_ODE`

### To first fork and clone the repo:
1. Go to the [Uwaterloo iGEM 2025 GitHub](https://github.com/igem-waterloo/uwaterloo-igem-2025) and click the "Fork" button in the top right corner.
2. In your forked repo, copy the link of the repo and clone it to your local machine:
```
$ git clone 'link of your forked repo'
or 
$ git clone 'ssh link of your forked repo'
```
3. Go to the cloned repo:
```
$ cd uwaterloo-igem-2025
```
4. Add the original repo as a remote:
```
$ git remote add upstream "https://github.com/igem-waterloo/uwaterloo-igem-2025"
or
$ git remote add upstream "ssh link of original repo"
```
5. Check if the remote is added:
```
$ git remote -v
```
6. You should see something like this:
```
origin  https://github.com/[your acc]/uwaterloo-igem-2025 (fetch)
origin  https://github.com/[your acc]/uwaterloo-igem-2025 (push)
upstream        https://github.com/igem-waterloo/uwaterloo-igem-2025 (fetch)
upstream        https://github.com/igem-waterloo/uwaterloo-igem-2025 (push)
```

### To create a new branch:
1. Make sure you are on the main branch:
```
$ git checkout main
```
2. Pull the latest changes from the original repo:
```
$ git pull upstream main (update from original repo)
or 
$ git pull origin main (update from your forked repo)
```
3. Create a new branch:
```
$ git checkout -b 'name/branch_abbreviations/branch_name'
```
You are now on the new branch. You can check if you are on the new branch by running:
```
$ git branch
```
4. You should see something like this:
```
* name/branch_abbreviations/branch_name
  main
```

### To push the new branch to your forked repo:
1. Make sure you are on the new branch:
```
$ git checkout 'name/branch_abbreviations/branch_name'
```
2. Your usual workflow:
```
$ git add . or $ git add 'file name'
$ git commit -m "your commit message (don't put random things)"
$ git push origin 'name/branch_abbreviations/branch_name'
```

### Creating a pull request:
1. Go to your forked repo on GitHub.
2. Click on the "Pull requests" tab.
3. Click on the "New pull request" button.
4. Select the branch you want to merge into the original repo.
5. Select the branch you want to merge from.
6. Click on the "Create pull request" button.
7. Add a title and description for your pull request.
8. Click on the "Create pull request" button.
9. Wait for the review from the original repo.
10. Once the review is done, you can merge the pull request.
