
{% macro find_date_diff(date1,date2) %}
    (datediff('month', {{ date1 }}, {{ date2 }}))
{% endmacro %}
