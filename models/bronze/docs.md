{% docs dbt_cloud_job_id %}

`dbt_cloud_job_id` identifica la ejecución de dbt Cloud que generó o actualizó el registro.


Este campo permite:

- Trazar cada fila hasta una ejecución concreta de dbt Cloud.

- Facilitar auditoría y debugging (saber **qué run** produjo un dato).

- Correlacionar datos con logs, errores o métricas de dbt Cloud.


Notas:

- El valor proviene de variables de entorno de dbt Cloud.

- En ejecuciones locales, este campo puede venir como NULL.
{% enddocs %}
 