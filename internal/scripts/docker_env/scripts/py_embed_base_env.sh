#! /bin/sh

################################################################################
# Environment: metplus_base.v5
# Last Updated: 2022-06-15 (mccabe@ucar.edu)
# Notes: Move logic to create METplus base env to script so it can be called
#   on a local machine to create the environment
# Python Packages:
#   xarray==2022.3.0
#   netcdf4==1.5.8
#
# Other Content: None
################################################################################

# Conda environment to create
ENV_NAME=py_embed_base.v5

conda create -y --name ${ENV_NAME} -c conda-forge python=3.8.6
conda install -y --name ${ENV_NAME} -c conda-forge xarray==2022.3.0
conda install -y --name ${ENV_NAME} -c conda-forge netcdf4==1.5.8
