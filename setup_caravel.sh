## name    : setup_caravel.sh
## purpose : setup the initial working directories for caravel_user_project
##           it takes about 2~3 hours to build
## usage   : modify parameters starting with my_caravel_*
##           then do $ source setup_caravel.sh 


# modify these parameters to fit your need 
export my_caravel_workspace=/tmp/pohan/caravel_workspace
export my_caravel_local_repo=caravel_demo
export my_caravel_git=git@github.com:pohantw/caravel_demo.git 
export my_caravel_git_branch=demo

# clone a clean caravel_user_project
cd ${my_caravel_workspace}
git clone -b mpw-5c https://github.com/efabless/caravel_user_project ${my_caravel_local_repo}
cd ${my_caravel_local_repo}

# re-configure its remote to our git branch
git remote rename origin upstream
git remote add origin ${my_caravel_git}
git checkout -b ${my_caravel_git_branch}
git push -u origin ${my_caravel_git_branch}

# you need to export this whenever you start a new shell
export OPENLANE_ROOT=${caravel_workspace}/openlane
export PDK_ROOT=${caravel_workspace}/pdks

# install the pdk, caravel...etc
make setup

