function [arrayCampos,numPosicao]=extraiCampos(data)

%para retirar os espaços no final
posCR=strfind(data,'<CR>');
data=data(1,1:posCR+3);


numCaracteres = size(data,2);

posInicio = 1;
arrayCampos= cell(1,0);
posCampo = 0;
temp=1;

for i = 1:numCaracteres
    if data(i) == '|'
        if posInicio <= (i-1)            
            arrayCampos(1,temp)={data(posInicio : i-1)};
            numPosicao(1,temp)=posCampo;
            temp=temp+1;
        end
        
        posCampo = posCampo + 1; 
        posInicio = i + 1;
    end
    
    if i == numCaracteres
        arrayCampos(1,temp) = {data(posInicio : numCaracteres-4)};
        numPosicao(1,temp)=posCampo;
        temp=temp+1;
    end
end

