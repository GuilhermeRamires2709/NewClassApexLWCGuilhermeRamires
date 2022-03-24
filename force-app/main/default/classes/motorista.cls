public with sharing class motorista {
    public static void carroDoMotorista() {

        /*Carro carro1 = new Carro();
        carro1.modelo = 'Fusca';
        carro1.cor = 'Preto';
        carro1.ligado = true;
        carro1.velocidadeCarro = 10;
        carro1.estadoPorta = false;
        system.debug('O modelo do carro 1 é '+carro1.modelo);
        system.debug('carro1 '+carro1);
        Boolean aceleraCarro1 = carro1.acelerar(carro1.velocidadeCarro);
        system.debug('Acelerou o carro? '+aceleraCarro1);

        Carro carro2 = new Carro();
        carro2.modelo = 'Opala';
        carro2.cor = 'Rosa';
        carro2.ligado = false;
        carro2.velocidadeCarro = 10;
        carro2.estadoPorta = false;
        carro2.
        system.debug('O modelo do carro 2 é '+carro2.modelo);
        system.debug('carro2 '+carro2);
        Boolean aceleraCarro2 = carro2.acelerar(carro2.velocidadeCarro);
        system.debug('Acelerou o carro? '+aceleraCarro2); */

        //DESAFIO - Verificar se o carro tem ou não gasolina para poder acelerar

        Carro carro3 = new Carro();
        carro3.modelo = 'Virtus';
        carro3.cor = 'Azul';
        carro3.ligado = false;
        carro3.velocidadeCarro = 10;
        carro3.estadoPorta = false;
        carro3.gasolina=false;
        Boolean aceleracarro3 = carro3.acelerar(carro3.velocidadeCarro);
        system.debug('Acelerou o carro? '+aceleracarro3);



        /* carro carroFusca = new carro();
        Boolean fuscaLigado = carroFusca.ligarCarro(true);
        
        if(fuscaLigado){
            carroFusca.ligarSeta(true);
        }
        if(fuscaLigado){
            carroFusca.acelerarCarro(90);
        }

        system.debug('Fusca Ligado: '+fuscaLigado);
        system.debug('Carro Fusca: '+carroFusca);


        carro carroOpala = new carro();
        Boolean OpalaLigado = carroOpala.ligarCarro(false);
        if(fuscaLigado){
            carroOpala.ligarSeta(true);
        }


        system.debug('carroOpala: '+carroOpala);


    } */
    }
}   
