-- Módulo de pruebas de penalización - Análisis estático SQL (SQLFluff).
-- Dialecto: ANSI
-- Score base: 100 pts (sin errores de linting).
--
-- Instrucciones:
--   1. Ejecutar el análisis con este archivo tal como está → score 100.
--   2. Descomentar SOLO UN bloque a la vez.
--   3. Volver a ejecutar y verificar la penalización en el score.
--   4. Comentar el bloque antes de probar el siguiente.

CREATE TABLE employees (
    id INT NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    salary DECIMAL(10, 2) NOT NULL,
    hire_date DATE NOT NULL,
    PRIMARY KEY (id)
);

CREATE INDEX idx_employee_name ON employees (first_name);

-- =============================================================================
-- TIPO 1 | PARSEO (PRS) | Penalización: -5 pts c/u
-- Descripción: Bloque de código SQL con sintaxis no reconocida por el parser
--              ANSI — produce error de parseo (PRS) en SQLFluff.
-- Acción   : Descomentar el bloque completo (5 líneas debajo).
-- Esperado : 100 - 5 = 95 pts  (1 violación PRS × -5 pts)
-- =============================================================================
-- CREATE PROCEDURE get_employee (IN emp_id INT)
-- BEGIN
--     SELECT first_name, salary
--     FROM employees WHERE id = emp_id;
-- END;

-- =============================================================================
-- TIPO 2 | CAPITALIZACIÓN (CP01, CP02) | Penalización: -2 pts c/u
-- Descripción: Keywords y/o identificadores en minúsculas en lugar de
--              mayúsculas — viola la regla de capitalización de SQLFluff.
-- Acción   : Descomentar las 3 líneas debajo.
-- Esperado : 100 - 6 = 94 pts  (3 violaciones CP × -2 pts: select, from, where)
-- =============================================================================
 select first_name, salary
  from employees
  where id = 1;

-- =============================================================================
-- TIPO 3 | ESPACIADO (LT01) | Penalización: -0.5 pts c/u
-- Descripción: Falta espacio entre el identificador y el paréntesis
--              de apertura en la cláusula ON del índice.
-- Acción   : Descomentar las 2 líneas debajo.
-- Esperado : 100 - 1.0 = 99 pts  (2 violaciones LT01 × -0.5 pts)
-- =============================================================================
 CREATE INDEX idx_salary ON employees(salary);
 CREATE INDEX idx_hire_date ON employees(hire_date);
