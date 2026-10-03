{% macro generate_schema_name(custom_schema_name, node) -%}

    {# Se for um seed, ignora o target.schema e usa apenas o esquema customizado #}
    {%- if node.resource_type == 'seed' and custom_schema_name is not none -%}

        {{ custom_schema_name | trim }}

    {# Para qualquer outro modelo, mantém o comportamento padrão do dbt #}
    {%- else -%}

        {%- set default_schema = target.schema -%}
        {%- if custom_schema_name is none -%}
            {{ default_schema }}
        {%- else -%}
            {{ default_schema ~ '_' ~ custom_schema_name | trim }}
        {%- endif -%}

    {%- endif -%}

{%- endmacro %}
