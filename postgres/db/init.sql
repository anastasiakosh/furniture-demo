CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    category_id INT REFERENCES categories(id),
    name TEXT NOT NULL,
    description TEXT,
    price NUMERIC(10,2),
    material TEXT,
    color TEXT,
    dimensions JSONB
);

INSERT INTO categories (name) VALUES
('Дивани'), ('Столи'), ('Стільці'), ('Шафи');

INSERT INTO products (category_id, name, description, price, material, color, dimensions) VALUES
(1, 'Модульний диван', 'Зручний модульний диван на 2 міста', 999.00, 'шкіра', 'сірий', '{"length":280,"depth":180,"height":85}'),
(1, 'Класичний диван', 'Класичний прямий диван 3-х місний', 19999.00, 'шкіра', 'бежевий', '{"length":220,"depth":95,"height":85}'),
(2, 'Стіл', 'Деревʼяний стіл', 8999.00, 'дуб', 'коричневый', '{"length":160,"width":90,"height":75}'),
(3, 'Косметичний стул', 'Легкий стілець', 1499.00, 'шкіра', 'натуральна', '{"seat_height":45,"width":45,"depth":40}'),
(4, 'Шкаф-купе', 'Широкий шкаф-купе', 15999.00, 'ламінат', 'білий', '{"length":200,"depth":60,"height":220}');
