// source of abscissae and weights:
// http://pomax.github.io/bezierinfo/legendre-gauss.html

abscissae = [
	-0.0243502926634244;
	0.0243502926634244;
	-0.0729931217877990;
	0.0729931217877990;
	-0.1214628192961206;
	0.1214628192961206;
	-0.1696444204239928;
	0.1696444204239928;
	-0.2174236437400071;
	0.2174236437400071;
	-0.2646871622087674;
	0.2646871622087674;
	-0.3113228719902110;
	0.3113228719902110;
	-0.3572201583376681;
	0.3572201583376681;
	-0.4022701579639916;
	0.4022701579639916;
	-0.4463660172534641;
	0.4463660172534641;
	-0.4894031457070530;
	0.4894031457070530;
	-0.5312794640198946;
	0.5312794640198946;
	-0.5718956462026340;
	0.5718956462026340;
	-0.6111553551723933;
	0.6111553551723933;
	-0.6489654712546573;
	0.6489654712546573;
	-0.6852363130542333;
	0.6852363130542333;
	-0.7198818501716109;
	0.7198818501716109;
	-0.7528199072605319;
	0.7528199072605319;
	-0.7839723589433414;
	0.7839723589433414;
	-0.8132653151227975;
	0.8132653151227975;
	-0.8406292962525803;
	0.8406292962525803;
	-0.8659993981540928;
	0.8659993981540928;
	-0.8893154459951141;
	0.8893154459951141;
	-0.9105221370785028;
	0.9105221370785028;
	-0.9295691721319396;
	0.9295691721319396;
	-0.9464113748584028;
	0.9464113748584028;
	-0.9610087996520538;
	0.9610087996520538;
	-0.9733268277899110;
	0.9733268277899110;
	-0.9833362538846260;
	0.9833362538846260;
	-0.9910133714767443;
	0.9910133714767443;
	-0.9963401167719553;
	0.9963401167719553;
	-0.9993050417357722;
	0.9993050417357722;
]
weights = [
	0.0486909570091397;
	0.0486909570091397;
	0.0485754674415034;
	0.0485754674415034;
	0.0483447622348030;
	0.0483447622348030;
	0.0479993885964583;
	0.0479993885964583;
	0.0475401657148303;
	0.0475401657148303;
	0.0469681828162100;
	0.0469681828162100;
	0.0462847965813144;
	0.0462847965813144;
	0.0454916279274181;
	0.0454916279274181;
	0.0445905581637566;
	0.0445905581637566;
	0.0435837245293235;
	0.0435837245293235;
	0.0424735151236536;
	0.0424735151236536;
	0.0412625632426235;
	0.0412625632426235;
	0.0399537411327203;
	0.0399537411327203;
	0.0385501531786156;
	0.0385501531786156;
	0.0370551285402400;
	0.0370551285402400;
	0.0354722132568824;
	0.0354722132568824;
	0.0338051618371416;
	0.0338051618371416;
	0.0320579283548516;
	0.0320579283548516;
	0.0302346570724025;
	0.0302346570724025;
	0.0283396726142595;
	0.0283396726142595;
	0.0263774697150547;
	0.0263774697150547;
	0.0243527025687109;
	0.0243527025687109;
	0.0222701738083833;
	0.0222701738083833;
	0.0201348231535302;
	0.0201348231535302;
	0.0179517157756973;
	0.0179517157756973;
	0.0157260304760247;
	0.0157260304760247;
	0.0134630478967186;
	0.0134630478967186;
	0.0111681394601311;
	0.0111681394601311;
	0.0088467598263639;
	0.0088467598263639;
	0.0065044579689784;
	0.0065044579689784;
	0.0041470332605625;
	0.0041470332605625;
	0.0017832807216964;
	0.0017832807216964;
]

function y = f(x)
	if (x >= -%pi & x <= 0) then y = 1
	elseif (x >= 0 & x <= %pi) then y = %e^(-x)
	end
endfunction

function y = fourier(f, p, n)
	x = -p:0.01:p
	for j = 1:size(x, 'c')
		y(j) = ai(f, p, 0) / 2;
		for i = 1:n
			y(j) = y(j) + ai(f, p, i) * cos((n * %pi * x(j)) / p) + bi(f, p, i) * sin((n * %pi * x(j)) / p);
		end
	end
endfunction

function y = ai(f, p, i)
	y = 0
	for j = 1:8 
		y = y + weights(j) * f(p * abscissae(j)) * cos(i * %pi * abscissae(j));
	end
endfunction

function y = bi(f, p, i)
	y = 0
	for j = 1:8
		y = y + weights(j) * f(p * abscissae(j)) * sin(i * %pi * abscissae(j));
	end
endfunction
