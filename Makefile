CONDA_ACTIVATE=source $$(conda info --base)/etc/profile.d/conda.sh

create-conda-env:
	./create-conda-env.sh

python-info:
	$(CONDA_ACTIVATE); conda activate ./env; python --version; which -a python

jupyter-lab:
	$(CONDA_ACTIVATE); conda activate ./env; python --version; which -a python; jupyter lab
