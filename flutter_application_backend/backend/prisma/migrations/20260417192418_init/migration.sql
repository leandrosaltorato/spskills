-- CreateTable
CREATE TABLE `Roupas` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `img` VARCHAR(191) NOT NULL,
    `nome` VARCHAR(191) NOT NULL,
    `categoria` VARCHAR(191) NOT NULL,
    `preco` DECIMAL(10, 2) NOT NULL,
    `marca` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
