const prisma = require("../data/prisma");

const novaRoupa = async (req, res) => {
    const roupa = req.body; 

    const nroupa = await prisma.roupas.create({
        data: roupa
    });

    res.json(nroupa).status(201).end;
};

const listRoupas = async (req, res) => {
    const roupa = await prisma.roupas.findMany();

    res.json(roupa).status(200).end();
};

const buscarRoupa = async (req, res) => {
    const { id } = req.params;

    const roupa = await prisma.roupas.findUnique({
        where: { id: Number(id) }
    });

    res.status(200).json(roupa);
};

const apagarRoupa = async (req, res) => {
  try {
    const { id } = req.params;

    const roupa = await prisma.roupas.delete({
      where: {
        id: Number(id), 
      },
    });

    return res.json(roupa);
  } catch (error) {
    console.error(error);
    return res.status(500).json({ error: "Erro ao deletar roupa" });
  }
};

const atualizarRoupas = async (req, res) => {
    const { id } = req.params;
    const dados = req.body;

    const roupa = await prisma.roupas.update({
        where: { id },
        data: dados
    });

    res.json(roupa).status(200).end();
};

module.exports = {
    novaRoupa,
    listRoupas,
    buscarRoupa,
    apagarRoupa,
    atualizarRoupas
}