# Notebooks

Pipeline numerado en orden de ejecución. Convención de nombres: `NN_tema.ipynb` (opcionalmente `NN_tema_autor.ipynb` para notebooks de experimentación personal).

| Notebook | Etapa | Responsable | Produce |
|---|---|---|---|
| `00_exploracion.ipynb` | Exploración de datos (hecha) | — | hallazgos |
| `01_datos_validacion.ipynb` | Parte 1 · Datos, limpieza y validación | _(nombre)_ | `data/processed/p1/` (dataset limpio, folds, métrica) |
| `02_modelo_geometrico.ipynb` | Parte 2 · Modelo geométrico / estructural | _(nombre)_ | `data/processed/p2/pred_geom.parquet` |
| `03_correlacion_gr.ipynb` | Parte 3 · Correlación de GR y predicción final | _(nombre)_ | `data/processed/p3/pred_final.parquet`, submission |

Los datos se descargan con `make data` (ver README del repo). Dependencias: 02 y 03 necesitan 01; 03 necesita además 02. Los contratos de entrada/salida están en la cabecera de cada notebook.

Reglas:
- Rutas relativas a la raíz del repo: `../data/raw/`, `../submissions/`.
- Los outputs se limpian al commitear (`nbstripout` via pre-commit); guardar figuras importantes en `reports/figures/`.
- Un notebook por etapa; si algo se reutiliza entre notebooks, va a un módulo `.py` en `src/` (a crear cuando haga falta).
- Experimentos sueltos: `NN_tema_autor.ipynb` con el número de la etapa a la que pertenecen (p. ej. `02_dip_knn_ruben.ipynb`).
