function resultado=verificaData(data)
    data=char(data);

    if size(data,2)==14
        ano = str2num(data(1,1:4));
        mes = str2num(data(1,5:6));
        dia = str2num(data(1,7:8));
        hora=str2num(data(1,9:10));
        minuto=str2num(data(1,11:12));
        segundo=str2num(data(1,13:14));
        
        if mes <=12 && mes >=1 && dia >=1 && dia <=31 && hora >=0 && hora <=23 && minuto >=0 &&minuto <=59 && segundo >=0 && segundo <=59
            resultado=1;
        else
           resultado=0; 
        end        
    else
        resultado=0;
    end