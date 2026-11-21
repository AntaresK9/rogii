.PHONY: setup data lab kernel hooks submit clean

setup:        ## instala dependencias y hooks
	uv sync --all-groups
	uv run pre-commit install

data:         ## descarga datos de Kaggle a data/raw
	scripts/download_data.sh

lab:          ## abre JupyterLab
	uv run jupyter lab

kernel:       ## registra el kernel del venv para VSCode/Jupyter externos
	uv run python -m ipykernel install --user --name rogii --display-name "Python (rogii)"

hooks:        ## corre los hooks sobre todos los archivos
	uv run pre-commit run --all-files

submit:       ## make submit FILE=submissions/x.csv MSG="desc"
	scripts/submit.sh $(FILE) "$(MSG)"

clean:
	find . -name "__pycache__" -type d -exec rm -rf {} +; rm -rf .ipynb_checkpoints
