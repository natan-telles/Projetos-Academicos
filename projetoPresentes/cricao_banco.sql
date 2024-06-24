-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema presentes
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema presentes
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `presentes` DEFAULT CHARACTER SET utf8 ;
USE `presentes` ;

-- -----------------------------------------------------
-- Table `presentes`.`presentes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `presentes`.`presentes` (
  `id_presente` INT NOT NULL,
  `categoria` VARCHAR(45) NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `descricao` VARCHAR(200) NOT NULL,
  `preco(R$)` FLOAT NOT NULL,
  `link_compra` VARCHAR(1000) NULL,
  PRIMARY KEY (`id_presente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `presentes`.`sugestoes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `presentes`.`sugestoes` (
  `id_sugestao` INT AUTO_INCREMENT NOT NULL,
  `categoria1` VARCHAR(45) NOT NULL,
  `categoria2` VARCHAR(45),
  `categoria3` VARCHAR(45),
  `id_presente_escolhido` INT NOT NULL,
  PRIMARY KEY (`id_sugestao`),
  CONSTRAINT `id_presente_escolhido`
    FOREIGN KEY (`id_presente_escolhido`)
    REFERENCES `presentes`.`presentes` (`id_presente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `id_presente_escolhido_idx` ON `presentes`.`sugestoes` (`id_presente_escolhido` ASC);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `presentes`.`presentes`
-- -----------------------------------------------------
START TRANSACTION;
USE `presentes`;
insert into presentes values 
(1, 'Tecnologia', 'Iphone 15 Pro', 'Smartphone de última geração da Apple', 9299.99, 'https://www.apple.com/br/shop/buy-iphone/iphone-15-pro'),
(2, 'Tecnologia', 'QCY T13', 'Fones de ouvido sem fio de alta qualidade', 169.99, 'https://qcy.com.br/pages/shopt13?gad_source=1&gclid=CjwKCAjwr7ayBhAPEiwA6EIGxGG3QCadBm96M0HCLubuLut4y1xq0J8M-_UMiKoDcQh5072uFAPPQRoCOOgQAvD_BwE'),
(3, 'Tecnologia', 'Playstation 5', 'Console de videogame', 3599.99, 'https://www.kabum.com.br/produto/238671/console-playstation-5-sony-ssd-825gb-controle-sem-fio-dualsense-com-midia-fisica-branco-1214a?gad_source=1&gclid=CjwKCAjwr7ayBhAPEiwA6EIGxB5y47ECXNAx_5LicTu4NZLJZJV1lBvicgo2zbp9IVf7757MuepB9xoCTY4QAvD_BwE'),
(4, 'Tecnologia', 'DJI Mini 3', 'Drone com câmera 4K', 2226.05, 'https://pt.aliexpress.com/item/1005006636078148.html?src=google&src=google&albch=shopping&acnt=768-202-3196&slnk=&plac=&mtctp=&albbt=Google_7_shopping&isSmbAutoCall=false&needSmbHouyi=false&albcp=17355674356&albag=&trgt=&crea=pt1005006636078148&netw=x&device=c&albpg=&albpd=pt1005006636078148&gad_source=1&gclid=CjwKCAjwr7ayBhAPEiwA6EIGxLa79Wj23KmpQTyT3aZrdpX9eRDhC4fQSLyM9L0LLb_UV_7maJ6RNxoCFrsQAvD_BwE&gclsrc=aw.ds&aff_fcid=ab04a36e640e4f95acf1b4347233c0c1-1716410475033-02436-UneMJZVf&aff_fsk=UneMJZVf&aff_platform=aaf&sk=UneMJZVf&aff_trace_key=ab04a36e640e4f95acf1b4347233c0c1-1716410475033-02436-UneMJZVf&terminal_id=20bd68a2098f499ea92d44f77f9f6b51&afSmartRedirect=y'),
(5, 'Tecnologia', 'HAYLOU Solar Plus RT3', 'Relógio inteligente (smartwatch)', 255.99, 'https://www.amazon.com.br/HAYLOU-Smartwatch-Bluetooth-Telefone-Inteligente/dp/B0D291W3C6/ref=asc_df_B0D291W3C6/?tag=googleshopp00-20&linkCode=df0&hvadid=647495188024&hvpos=&hvnetw=g&hvrand=11300231767351908182&hvpone=&hvptwo=&hvqmt=&hvdev=c&hvdvcmdl=&hvlocint=&hvlocphy=9100223&hvtargid=pla-2304554922132&psc=1&mcid=827927feaa3f3a97b4f3ebc0e1fe50b2'),
(6, 'Tecnologia', 'APEX PRO TKL', 'Teclado mecânico para jogos', 1599.99, 'https://www.kabum.com.br/produto/524371/teclado-gamer-steelseries-apex-pro-tkl-rgb-usb-c-preto-64856?gad_source=1&gclid=CjwKCAjwr7ayBhAPEiwA6EIGxHpolpSL_BPWovCN2TDWiCfRoJ98Bmmj5XRLtkdptgmUvvrCM1dbqBoCcAEQAvD_BwE'),
(7, 'Tecnologia', 'Quest 2 Advanced', 'Óculos de realidade virtual', 1888.00, 'https://www.amazon.com.br/Oculus-Conjunto-realidade-virtual-Advanced/dp/B0B3CMHSXS/ref=asc_df_B0B3CMHSXS/?tag=googleshopp00-20&linkCode=df0&hvadid=379714766595&hvpos=&hvnetw=g&hvrand=8028969643167990585&hvpone=&hvptwo=&hvqmt=&hvdev=c&hvdvcmdl=&hvlocint=&hvlocphy=9100223&hvtargid=pla-1720660347749&psc=1&mcid=d0e84b81a2263d61bb984a92fd2d1ac8'),
(8, 'Tecnologia', 'Acer Nitro 5', 'Notebook gamer', 5699.99, 'https://www.kabum.com.br/produto/518342/notebook-gamer-acer-nitro-5-intel-core-i7-12650h-8gb-ram-geforce-rtx-3050-ssd-512gb-15-6-full-hd-144hz-win-11-home-preto-an515-58-78bz?gad_source=1&gclid=CjwKCAjwr7ayBhAPEiwA6EIGxLKzB9oVXLlTTAfsFSaNCVdizW75BOd5hkl7I8RnrMoUNW5Lwp2LsBoCKMAQAvD_BwE'),
(9, 'Tecnologia', 'GoPro HERO12 BLACK', 'Câmera esportiva de ação', 2875.00, 'https://www.amazon.com.br/GoPro-HERO12-BLACK-HyperSmooth-horizonte/dp/B0CF3VVTLG/ref=asc_df_B0CF3VVTLG/?tag=googleshopp00-20&linkCode=df0&hvadid=647766843314&hvpos=&hvnetw=g&hvrand=11193273631323021139&hvpone=&hvptwo=&hvqmt=&hvdev=c&hvdvcmdl=&hvlocint=&hvlocphy=9100223&hvtargid=pla-2197431728849&psc=1&mcid=adbc56f47199376eb0bfdfb707363fb3'),
(10,'Tecnologia', 'Galaxy S23 Ultra','Smartphone de última geração da Samsung',4049.10,'https://www.magazineluiza.com.br/smartphone-samsung-galaxy-s23-ultra-256gb-preto-5g-12gb-ram-68-cam-quadrupla-selfie-12mp/p/232855300/te/s23u/?&seller_id=magazineluiza&utm_source=google&utm_medium=pla&utm_campaign=&partner_id=68710&gclsrc=aw.ds&gclid=CjwKCAjwr7ayBhAPEiwA6EIGxEzI3yyZCiNk7hlro34SRbN5YM7VcsbEkUZYT4nB49eFDDhZ86TGoBoCoBQQAvD_BwE'),
(11, 'Moda', 'Relógio Tommy Hilfiger', 'Masculino Couro Marrom 1791965', 990.00, 'https://www.vivara.com.br/relogio-tommy-hilfiger-masculino-couro-marrom-1791965-to00004355/p?gad_source=1&gclid=CjwKCAjwr7ayBhAPEiwA6EIGxEY-U_h9fbC8MlR7nZ1Iaf75Lpq5dBQFfQ7JGKsTIdENlDGTGNtEbBoCqeAQAvD_BwE'),
(12, 'Moda', 'Terno Estilo Italiano', 'Perfeito para ocasiões especiais e profissionais, este terno irá te deixar ainda mais elegante e confiante.', 1329.99, 'https://mafie.com.br/products/terno-estilo-italiano-com-3-pecas?currency=BRL&variant=41232541614182&utm_source=google&utm_medium=cpc&utm_campaign=Google%20Shopping&stkn=03859355099a&gad_source=1&gclid=CjwKCAjwr7ayBhAPEiwA6EIGxAbpWSr-xTKji9zxBggysnjRq3nzTws69ifMxpStht-sUNxogA_ZTBoCdZMQAvD_BwE'),
(13, 'Moda', 'Viccini Romeo', 'Sapato Social de Couro Viccini Romeo Preto', 569.00, 'https://www.viccini.com.br/produto/sapato-social-de-couro-viccini-romeo-preto/?gad_source=1&gclid=CjwKCAjwr7ayBhAPEiwA6EIGxEeEx5A-yW7Y05wSrZYFMwj_fn35LW6Ro7J92YSmNY2OMMnTSNbSOhoCjAUQAvD_BwE'),
(14, 'Moda', 'Gravata De Seda Semi Slim', 'Gravatas De Seda Semi Slim Com Abotoadura, Lenço E Clipe', 99.00, 'https://emporiodoexecutivo.com/products/gravatas-de-seda-semi-slim-com-abotoadura-lenco-e-clipe?variant=46811182891294&currency=BRL&utm_medium=product_sync&utm_source=google&utm_content=sag_organic&utm_campaign=sag_organic&gad_source=1&gclid=CjwKCAjwr7ayBhAPEiwA6EIGxHJ2NhTEh81GWZMBQv7UQne70Nlwl8LV_CNstaTeNYfOiP1UnxVNQhoCg2oQAvD_BwE'),
(15, 'Moda', 'Classic Sampaio', 'Jaqueta Masculina de Couro Classic Sampaio', 329.00, 'https://lojasampaio.com.br/products/jaqueta-masculina-de-couro-classic-sampaio%C2%AE?currency=BRL&utm_source=google&utm_medium=cpc&utm_campaign=Google%20Shopping&stkn=9ca76bee4ff4&gad_source=1&gclid=CjwKCAjwr7ayBhAPEiwA6EIGxLIOVt8AO9rPozJwN0N45wQR84RSrEQ1GxVCjaYojmmMVvQZAVuP6BoC__YQAvD_BwE'),
(16, 'Moda', 'Under Armour Blitzing', 'Boné de Treino Masculino Under Armour Blitzing', 129.99, 'https://www.underarmour.com.br/bone-de-treino-masculino-under-armour-blitzing-1376700-012/p?idsku=36248&utm_source=google&utm_campaign=googlepla&utm_medium=shopping&gad_source=1&gclid=CjwKCAjwr7ayBhAPEiwA6EIGxCLKyPwuYiOf6huto0_etN3v0EkAVTdJCco9WuH01uHxOCJi1dzBShoCSoYQAvD_BwE'),
(17, 'Moda', 'CAMISETA MAMONAS', 'CAMISETA MAMONAS MANGA CURTA SABÃO', 118.00, 'https://www.vextorcrew.com.br/camiseta-mamonas-manga-curta-sabao-cra-cra-vm2230200-p38284?utm_source=google&utm_medium=cpc&utm_campaign=lojavirtual&pp=/44.573/40.794&gad_source=1&gclid=CjwKCAjwr7ayBhAPEiwA6EIGxCBmhmKFfPOzu_UisNVvkKU5mdX2fqERq0WUkZ7Hsj1-8rj3vdsPrBoCCdcQAvD_BwE'),
(18, 'Moda', 'Mochila aprova d`agua', 'Mochila de vela Resistente à água 25L', 284.99, 'https://www.decathlon.com.br/backpack-sailing-25l-black-no-size-00306061-276113/p?gad_source=1&gclid=CjwKCAjwr7ayBhAPEiwA6EIGxPwIb1EhQ_SSxnaVogaoje2a_m6Cj_3oooc6fgqMc-sTGrmpOVAu1xoCYYkQAvD_BwE'),
(19, 'Moda', 'Pulseira VIVARA', 'Pulseira Life Trançada em Couro Preto com Aço', 378.00, 'https://www.vivara.com.br/pulseira-life-masculina-trancada-couro-preto-21-cm-pl00001619/p?gad_source=1&gclid=CjwKCAjwr7ayBhAPEiwA6EIGxGC3DXJcmMX2vfPRNoVpaC30AhAn_J_PkdQmjuFxisIrXKfr-hRNehoCvaM)QAvD_BwE'),
(20, 'Moda', 'CALÇA CARGO ADIDAS ADVENTURE PREMIUM', 'Calça Cargo', 529.99, 'https://www.adidas.com.br/calca-cargo-adidas-adventure-premium/IJ0719.html?-_-ds_agid=-_-&-_-ds_kid=-_-&cm_mmc=AdieSEM_Google_PLA-_-Always_On-_-Shopping-_-IJ0719-0005-_-dv%3AeCom-_-cn%3AAlways_On-_-pc%3AOriginals&cm_mmc=AdieSEM_Google_PLA-_-PMAX-Outlet-M-_--_--_-&cm_mmc1=BR&cm_mmc2=PLA-Multiple-Originals-Other-None-BR-LATAM-eCom-Paid_Search&cm_mmc2=&cm_mmca1=BR&gad_source=1&gclid=CjwKCAjwr7ayBhAPEiwA6EIGxIk9k6w4vad0XiO3jzx6B8OpBOIsW1rjAXcFtXaL9p1pcO2eeEbW8RoCjysQAvD_BwE&gclsrc=aw.ds'),
(21, 'Entretenimento', 'Livro Sapiens', 'Uma Breve História da Humanidade', 59.90, 'https://www.amazon.com.br/Sapiens-Uma-Breve-Hist%C3%B3ria-Humanidade/dp/8535925694'),
(22, 'Entretenimento', 'Ingressos Cinemark', 'Pacote de ingressos para o Cinemark', 120.00, 'https://www.ingressocomdesconto.com.br/ingressos-de-cinema/ingressos-cinemark'),
(23, 'Entretenimento', 'Netflix Gift Card', 'Cartão de presente para assinatura Netflix', 50.00, 'https://www.netflix.com/br/gift-cards'),
(24, 'Entretenimento', 'Coleção Harry Potter', 'Box com todos os livros de Harry Potter', 289.90, 'https://www.amazon.com.br/Cole%C3%A7%C3%A3o-Harry-Potter-Completa/dp/8532530788'),
(25, 'Entretenimento', 'Kindle Paperwhite', 'Leitor de livros digitais da Amazon', 499.00, 'https://www.amazon.com.br/kindle-paperwhite-8gb'),
(26, 'Entretenimento', 'Assinatura Spotify', 'Cartão de presente para assinatura Spotify', 34.90, 'https://www.spotify.com/br/premium/'),
(27, 'Entretenimento', 'Jogo de Tabuleiro Catan', 'Jogo de estratégia e negociação', 249.90, 'https://www.amazon.com.br/Jogo-de-Tabuleiro-Catan/dp/B00U26V4V4'),
(28, 'Entretenimento', 'Ingressos para Teatro', 'Pacote de ingressos para peças de teatro', 200.00, 'https://www.sampaingressos.com.br/'),
(29, 'Entretenimento', 'Google Play Gift Card', 'Cartão de presente para Google Play', 100.00, 'https://play.google.com/store'),
(30, 'Entretenimento', 'Disney+ Gift Card', 'Cartão de presente para assinatura Disney+', 79.90, 'https://www.disneyplus.com/br/gift-cards'),
(31, 'Esportes', 'Bola de Futebol Adidas', 'Bola de futebol oficial da Adidas', 199.99, 'https://www.adidas.com.br/bola-futebol'),
(32, 'Esportes', 'Camiseta Nike Dri-Fit', 'Camiseta de treino da Nike com tecnologia Dri-Fit', 129.99, 'https://www.nike.com.br/camiseta-dri-fit'),
(33, 'Esportes', 'Smartwatch Garmin Forerunner', 'Relógio esportivo Garmin Forerunner', 1599.99, 'https://www.garmin.com.br/forerunner'),
(34, 'Esportes', 'Tênis de Corrida Asics', 'Tênis de corrida Asics Gel Nimbus', 499.99, 'https://www.asics.com.br/gel-nimbus'),
(35, 'Esportes', 'Bicicleta Caloi', 'Bicicleta de montanha Caloi', 2499.00, 'https://www.caloi.com/bicicleta-montanha'),
(36, 'Esportes', 'Kit de Pesca Shimano', 'Conjunto de vara e molinete Shimano', 899.99, 'https://www.shimano.com.br/kit-pesca'),
(37, 'Esportes', 'Patins Inline Rollerblade', 'Patins inline para adultos da Rollerblade', 799.99, 'https://www.rollerblade.com.br/patins-inline'),
(38, 'Esportes', 'Óculos de Natação Speedo', 'Óculos de natação com proteção UV da Speedo', 89.90, 'https://www.speedo.com.br/oculos-natacao'),
(39, 'Esportes', 'Raquete de Tênis Wilson', 'Raquete de tênis oficial da Wilson', 399.99, 'https://www.wilson.com.br/raquete-tenis'),
(40, 'Esportes', 'Suplemento Whey Protein', 'Suplemento alimentar Whey Protein', 149.99, 'https://www.gsuplementos.com.br/whey-protein'),
(41, 'Alimentacao', 'Cesta de Chocolates', 'Cesta gourmet com chocolates variados', 199.99, 'https://www.cestasdechocolates.com.br'),
(42, 'Alimentacao', 'Vinho Tinto Malbec', 'Garrafa de vinho tinto Malbec', 89.90, 'https://www.vinhos.com.br/malbec'),
(43, 'Alimentacao', 'Kit de Queijos e Vinhos', 'Kit gourmet com queijos e vinhos', 249.99, 'https://www.kitqueijosevinhos.com.br'),
(44, 'Alimentacao', 'Café Gourmet', 'Pacote de café gourmet em grãos', 79.90, 'https://www.cafegourmet.com.br'),
(45, 'Alimentacao', 'Cesta de Café da Manhã', 'Cesta especial de café da manhã', 149.99, 'https://www.cestasdecafedamanha.com.br'),
(46, 'Alimentacao', 'Churrasqueira Portátil', 'Churrasqueira portátil a carvão', 399.99, 'https://www.churrasqueiras.com.br/portatil'),
(47, 'Alimentacao', 'Cesta de Frutas', 'Cesta com frutas frescas variadas', 129.99, 'https://www.cestasdefrutas.com.br'),
(48, 'Alimentacao', 'Assinatura de Cervejas Artesanais', 'Assinatura mensal de cervejas artesanais', 99.90, 'https://www.cervejasartesanais.com.br/assinatura'),
(49, 'Alimentacao', 'Kit Churrasco Tramontina', 'Kit de utensílios para churrasco da Tramontina', 149.99, 'https://www.tramontina.com.br/kit-churrasco'),
(50, 'Alimentacao', 'Máquina de Café Nespresso', 'Máquina de café espresso Nespresso', 499.00, 'https://www.nespresso.com.br/maquina-de-cafe')
