
% mensaje a cifrar 'lo bueno se malogra queriendo mejorarlo'
% mensaje cifrado: 'xopgwneggsoxcypcekydwepnqcepsfmznmdd'
% mensaje descifrado post cifrado: 'lo bueno se malogra queriendo mejorarlo xx'
% mensaje a descifrar = 'rykpmtikxediwimvxubqpmtgiexvckudaqtwtcajgnuuh';
% mensaje descifrado = 'duelo hasta la muerte por el amor de mi reina victoria x';

msgInicial = input('Introducir mensaje: ','s');

msgInicial = strrep(msgInicial,' ','');
A = [15 24 16; 4 5 4; 6 22 5];

while(mod(length(msgInicial),3) ~= 0)
    msgInicial = append(msgInicial,'x');
end

msgProcesado = '';
alphabet = 'abcdefghijklmnopqrstuvwxyz';

for pos=1:3:length(msgInicial)
    a = double(msgInicial(pos))-97;
    b = double(msgInicial(pos+1))-97;
    c = double(msgInicial(pos+2))-97;
    u = [a;b;c];
    v = A*u;
    msgProcesado = append(msgProcesado,alphabet(mod(v(1),26)+1));
    msgProcesado = append(msgProcesado,alphabet(mod(v(2),26)+1));
    msgProcesado = append(msgProcesado,alphabet(mod(v(3),26)+1));
end

disp(['Mensaje resultante: ',msgProcesado]);

