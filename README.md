# ROGII - Wellbore Geology Prediction

Repositorio del equipo para la competencia de Kaggle
[ROGII - Wellbore Geology Prediction](https://www.kaggle.com/competitions/rogii-wellbore-geology-prediction).

- **Objetivo**: predecir la geología (TVT, *True Vertical Thickness*) a lo largo de la sección final de pozos horizontales.
- **Métrica**: RMSE.

## Estructura

```
.
├── data/
│   ├── raw/          # datos de Kaggle tal cual (ignorado por git)
│   ├── processed/    # datos transformados / features (ignorado)
│   └── external/     # datos externos (ignorado)
├── notebooks/        # todo el código va aquí (ver notebooks/README.md)
├── models/           # modelos entrenados (ignorado)
├── submissions/      # csv de submissions (ignorado)
├── reports/figures/  # figuras para compartir (ignorado)
├── scripts/          # descarga de datos y submit
├── pyproject.toml    # dependencias (uv)
└── Makefile          # atajos
```

## Setup

Requisitos: [uv](https://docs.astral.sh/uv/) y una cuenta de Kaggle.

```bash
git clone git@github.com:rubenxrb/rogii.git && cd rogii
make setup            # crea .venv, instala deps y hooks de pre-commit
```

Credenciales de Kaggle (una de las dos opciones):

1. OAuth (recomendado): `uv run kaggle auth login` y seguir el flujo en el navegador.
2. Token: generarlo en *Kaggle > Settings > API*, copiar `.env.example` a `.env` y llenar `KAGGLE_API_TOKEN`.

Aceptar las reglas de la competencia en la web de Kaggle antes de descargar.

```bash
make data             # descarga a data/raw/
make lab              # abre JupyterLab
make kernel           # (opcional) registra el kernel para VSCode
```

## Flujo de trabajo

- Código en notebooks dentro de `notebooks/` siguiendo la convención de `notebooks/README.md`.
- Los outputs de los notebooks se eliminan automáticamente al commitear (nbstripout), así los diffs quedan limpios.
- Submissions: `make submit FILE=submissions/archivo.csv MSG="descripción"`.
- Una rama por persona/experimento; PRs a `main`.

## Comandos útiles

| Comando        | Qué hace                                  |
|----------------|-------------------------------------------|
| `make setup`   | instala dependencias y hooks              |
| `make data`    | descarga los datos de la competencia      |
| `make lab`     | abre JupyterLab con el entorno del repo   |
| `make hooks`   | corre pre-commit sobre todos los archivos |
| `make submit`  | sube una submission a Kaggle              |
