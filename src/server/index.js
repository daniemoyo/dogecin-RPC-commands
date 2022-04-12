require('dotenv').config();
const express = require('express');
const app = express();
const PORT = process.env.PORT;
const { Pool } = require("pg")

// const os = require('os');


const pool = new Pool({
    // database: 'react'
    connectionString: process.env.DATABASE_URL,
    ssl: {
        rejectUnauthorized: false,
    },
});

app.use(express.static('dist'));
app.use(express.json());


/* GET ALL Categories GET /api/categories ----Response ALL categories */
app.get('/api/categories', (req, res)=>{
    pool.query('SELECT * FROM categories', (err, result)=>{
        res.json(result.rows);
    })
    
})
/* GET ALL Commands GET /api/commands ----Response ALL commands */
app.get('/api/commands', (req, res)=>{
    pool.query("SELECT * FROM commands ORDER BY command ASC ", (err, result)=>{
        res.json(result.rows);
    })

})/* GET ALL Arguments GET /api/arguments ----Response ALL arguments */
app.get('/api/arguments', (req, res)=>{
    pool.query("SELECT * FROM arguments", (err, result)=>{
        res.json(result.rows);
    })
})
/* Get One Command GET /commands/:id Response SINGLE command */
app.get('/api/commands/:id', (req, res)=>{
    const id = req.params.id 
    pool.query("SELECT * FROM commands WHERE id=$1 ",[id], (err, result)=>{
        res.json(result.rows[0]);
    })
})
/* Create command POST /commands RESPONSE SUCCESS(200) "add new command to db"*/
app.post('/commands/:id', (req, res)=>{
    const {name, topping, qty } = req.body
    pool.query("INSERT INTO commands (name, topping, qty) VALUES ($1,$2,$3)",[name,topping,qty], (err, result)=>{
        res.status(201).json("add new command to db");
    })
})
/* Update command PATCH commands/:id RESPONSE SUCCESS(2OO) "update existing command"*/
app.patch('/commands/:id', (req, res)=>{
    const {name, topping, qty } = req.body
    const id = req.params.id;
    const query = `
        UPDATE commands SET 
        name = COALESCE($1, name),
        topping = COALESCE($2, topping),
        qty = COALESCE($3, qty)
        RETURNING *`;
    pool.query(query, [name,topping,qty], (err, result)=>{
        res.status(201).json("update existing command");
    })
})
/* Destroy command DELETE /commands/:id RESPOSE SUCCESS "delete existing command */
app.delete('/commands/:id', (req, res)=>{
    const id = req.params.id;
    
    pool.query("DELETE FROM commands WHERE id=$1;", [id], (err, result)=>{
        res.status(201).json("delete existing command");
    })
})

app.listen(PORT || 8080, () => console.log(`Listening on port ${PORT || 8080}!`));

module.exports = app;