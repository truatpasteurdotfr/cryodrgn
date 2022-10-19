FROM continuumio/miniconda3

RUN conda update conda && conda upgrade --all -y

# https://github.com/zhonge/cryodrgn
# 
# Create conda environment
RUN conda create --name cryodrgn1 python=3.9 && \
eval "$(conda shell.bash hook)"  && \
conda activate cryodrgn1

# Install dependencies
RUN conda install pytorch -c pytorch && \
conda install pandas

# Install dependencies for latent space visualization 
RUN conda install seaborn scikit-learn 
RUN conda install umap-learn jupyterlab ipywidgets cufflinks-py "nodejs>=15.12.0" -c conda-forge
RUN jupyter labextension install @jupyter-widgets/jupyterlab-manager --no-build
RUN jupyter labextension install jupyterlab-plotly --no-build
RUN jupyter labextension install plotlywidget --no-build
RUN jupyter lab build


# Clone source code and install

RUN cd /opt && \
git clone  https://github.com/zhonge/cryodrgn.git && \
cd cryodrgn && \
python3 -m pip install .

