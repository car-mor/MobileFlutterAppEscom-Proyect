const express = require('express');
const { authenticate } = require('../controllers/auth.controller');

const router = express.Router();

// Ruta de login
router.post('/login', authenticate);

module.exports = router;
