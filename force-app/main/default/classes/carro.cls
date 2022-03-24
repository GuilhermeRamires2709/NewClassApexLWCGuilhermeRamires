public with sharing class carro {

    public String modelo {get; set;}
    public String cor {get; set;}
    public Boolean ligado {get; set;}
    public Integer velocidadeCarro {get; set;}
    public String Motor{get; set;}
    public Boolean estadoPorta {get; set;}
    public Boolean gasolina{get;set;}

    public Boolean acelerar(Integer velocidade){
        if(gasolina==true){
        this.velocidadeCarro = velocidade;
        } else {
            system.debug('carro sem gasolina');
        }
        return velocidade > 0 && velocidade != null && this.ligado == true ? true:false;
    }
    
   /* public Boolean ligarCarro(Boolean ligarCarro){

        Boolean carroLigado = ligarCarro ? true : false;

        if(ligarCarro == true){
            system.debug('Carro Ligado');
        } else{
            system.debug('Carro desligado');
        }
        return ligarCarro;
    }
    public Boolean ligarFarois(Boolean LigarFarol){
        Boolean ligouFarol = LigarFarol ? true : false;
        if(LigarFarol){
            system.debug('Farol ligado');
        } else{
            system.debug('Farol desligado');
        }
        return ligouFarol;
    }
    public Boolean ligarSeta(Boolean ligarSeta){
        Boolean ligouSeta = ligarSeta ? true : false;
        if(ligarSeta){
            system.debug('Seta ligado');
        } else{
            system.debug('Seta desligado');
        }
        return ligouSeta;
    }
    public Integer acelerarCarro(Integer velocidade){
        system.debug('você está a '+velocidade+' KM/h');
        return velocidade;  

    }

*/

    }


