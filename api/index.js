const express = require('express');
const { Pool } = require('pg');
const { MongoClient } = require('mongodb');
const { Client: ESClient } = require('@elastic/elasticsearch');

const app = express();
app.use(express.json());

// PostgreSQL
const pgPool = new Pool({
  user: 'admin',
  host: 'localhost',
  database: 'furniture',
  password: 'adminpass',
  port: 5432,
});

// MongoDB
const mongoClient = new MongoClient('mongodb://localhost:27017');
let mongoDB;

// Elasticsearch
const esClient = new ESClient({ node: 'http://localhost:9200' });

// Connect to MongoDB
mongoClient.connect().then(() => {
  mongoDB = mongoClient.db('furniture');
  console.log('MongoDB connected');
}).catch(console.error);

// PostgreSQL endpoint
app.get('/pg/products', async (req, res) => {
  try {
    const result = await pgPool.query('SELECT * FROM products');
    res.json(result.rows);
  } catch (err) {
    console.error(err);
    res.status(500).send('PostgreSQL error');
  }
});

// MongoDB endpoint
app.get('/mongo/products', async (req, res) => {
  try {
    const products = await mongoDB.collection('products').find().toArray();
    res.json(products);
  } catch (err) {
    console.error(err);
    res.status(500).send('MongoDB error');
  }
});

// Elasticsearch endpoint (search by name query param)
app.get('/es/products', async (req, res) => {
  const query = req.query.q || '';
  try {
    const result = await esClient.search({
      index: 'furniture',
      body: {
        query: {
          multi_match: {
            query,
            fields: ['name', 'category', 'attributes.*']
          }
        }
      }
    });
    const hits = result.hits.hits.map(hit => hit._source);
    res.json(hits);
  } catch (err) {
    console.error(err);
    res.status(500).send('Elasticsearch error');
  }
});

app.listen(3000, () => {
  console.log('Mock API server running on http://localhost:3000');
});

