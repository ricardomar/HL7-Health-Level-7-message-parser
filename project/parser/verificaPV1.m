function [mensagemStatus,erroTipo1] = verificaPV1(segmentoPV1)

[campos,posicao]=extraiCampos(segmentoPV1);


mensagemStatus='';
erroTipo1=0;


if size(find(posicao==0),2)~=0
    if strcmp(campos(1,1),'PV1')==0
        mensagemStatus=strvcat(mensagemStatus,'PV1 ID n�o reconhecido');
        erroTipo1=1;
    end
end
