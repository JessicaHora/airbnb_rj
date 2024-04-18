{% macro fill_null(column_name, fill_value) %}
    SELECT
        CASE
            WHEN {{ column_name }} IS NULL THEN {{ fill_value }}
            ELSE {{ column_name }}
        END AS {{ column_name }}
{% endmacro %}
