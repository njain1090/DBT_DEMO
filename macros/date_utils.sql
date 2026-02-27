{% macro getseason(x) %}
CASE WHEN 
MONTH(to_timestamp({{x}})) in (12,1,2) THEN 'WINTER'
WHEN MONTH(to_timestamp({{x}})) in (3,4,5) THEN 'SPRING'
WHEN MONTH(to_timestamp({{x}})) in (6,7,8) THEN 'Summer'
ELSE 'Autumn' END 

{%endmacro%}

{% macro day_type(x) %}
CASE 
WHEN dayname(to_timestamp({{x}})) in ('Sat','Sun')
THEN 'WEEKEND'
ELSE 'BusinessDay'
END

{%endmacro%}