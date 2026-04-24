const express = require("express");

const router = express.Router();

const { 
    novaRoupa, 
    listRoupas, 
    buscarRoupa, 
    atualizarRoupas, 
    apagarRoupa 
} = require("../controllers/roupas.controller");

router.post("/cadastrar", novaRoupa);
router.get("/listar", listRoupas);
router.get("/buscar/:id", buscarRoupa);
router.put("/atualizar/:id", atualizarRoupas);
router.delete("/excluir/:id", apagarRoupa);

module.exports = router;
