% ###  PROGRAM: rev_t36_alumnos - LFMA  ###'

function percent=rev_t36_alumnos(n)
	% El +6 desplaza el valor central (media) a 6. ¿?
	notas=randn(1,10000)+6;
	media=mean(notas)
	hist(notas,100)
	percent=100*sum(notas>n)/10000;
end


