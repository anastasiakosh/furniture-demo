db = db.getSiblingDB('furniture');

db.products.drop();

db.products.insertMany([
  {
    name: "Модульний диван",
    category: "Дивани",
    price: 999,
    attributes: { color: "сірий", material: "шкіра", seats: 2, shape: "модульний" }
  },
  {
    name: "Класичний диван",
    category: "Дивани",
    price: 19999,
    attributes: { color: "бежевий", material: "шкіра", seats: 3, shape: "класичний" }
  },
  {
    name: "Стіл",
    category: "Столи",
    price: 8999,
    attributes: { material: "дуб", color: "коричневий", shape: "прямокутний" }
  },
  {
    name: "Косметичний стул",
    category: "Стільці",
    price: 1499,
    attributes: { material: "шкіра", color: "натуральна", seat_height: 45, width: 45, depth: 40 }
  },
  {
    name: "Шкаф-купе",
    category: "Шафи",
    price: 15999,
    attributes: { material: "ламінат", color: "білий", length: 200, depth: 60, height: 220 }
  }
]);

