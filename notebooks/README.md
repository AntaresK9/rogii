# Notebooks

Convención de nombres: `NN_tema_autor.ipynb` con numeración por etapa.

| Rango | Etapa                                  |
|-------|----------------------------------------|
| 00-09 | Exploración de datos (EDA)             |
| 10-19 | Feature engineering / preprocesamiento |
| 20-29 | Modelos baseline                       |
| 30-39 | Modelos avanzados / tuning             |
| 40-49 | Ensambles y post-procesado             |
| 90-99 | Generación de submissions              |

Ejemplo: `01_eda_wells_ruben.ipynb`, `21_lgbm_baseline_ana.ipynb`.

Reglas:
- Rutas relativas a la raíz del repo: `../data/raw/`, `../submissions/`.
- Los outputs se limpian al commitear (`nbstripout` via pre-commit); guardar figuras importantes en `reports/figures/`.
- Un notebook por experimento; si algo se reutiliza mucho, va a un módulo `.py` en `src/` (a crear cuando haga falta).

## División del trabajo

| Notebook | Parte | Produce |
|---|---|---|
| `01_exploracion_datos.ipynb` | Exploración (hecha) | hallazgos |
| `10_datos_y_validacion.ipynb` | 1 · Datos, limpieza y validación | `data/processed/p1/` (dataset limpio, folds, métrica) |
| `20_modelo_geometrico.ipynb` | 2 · Modelo geométrico / estructural | `data/processed/p2/pred_geom.parquet` |
| `30_correlacion_gr.ipynb` | 3 · Correlación de GR y predicción final | `data/processed/p3/pred_final.parquet`, submission |

Las partes 2 y 3 dependen de la 1; la 3 depende además de la 2. Los contratos de entrada/salida están en la cabecera de cada notebook. Cada responsable pone su nombre en la cabecera.
