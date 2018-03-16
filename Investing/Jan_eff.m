% As Goes January % LuminousLogic.com % 
 
% Historical Data % 
hist_data = [2007 1418.30 1438.24 NaN; 2006 1248.29 1280.66 1418.30;  2005 1211.92 1181.27 1248.29;  2004 1111.92 1131.13 1211.92; 2003 879.82 855.70 1111.92; 2002 1148.08 1130.20 879.82; 2001 1320.28 1366.01 1148.08; 2000 1469.25 1394.46 1320.28; 1999 1229.23 1279.64 1469.25; 1998 970.43 980.28 1229.23; 1997 740.74 786.16 970.43; 1996 615.93 636.02 740.74; 1995 459.27 470.42 615.93; 1994 466.45 481.61 459.27; 1993 435.71 438.78 466.45; 1992 417.09 408.78 435.71; 1991 330.22 343.93 417.09; 1990 353.40 329.08 330.22; 1989 277.72 297.47 353.40; 1988 247.08 257.07 277.72; 1987 242.17 274.08 247.08; 1986 211.28 211.78 242.17; 1985 167.24 179.63 211.28;  1984 164.93 163.41 167.24; 1983 140.64 145.30 164.93; 1982 122.55 120.40 140.64; 1981 135.76 129.55 122.55; 1980 107.94 114.16 135.76;  1979 96.11 99.93 107.94;  1978 95.10 89.25 96.11;  1977 107.46 102.03 95.10]; 
% Compute RORs for January and Feb-Dec periods 
jan_rors = hist_data(2:end,3) ./ hist_data(2:end,2) - 1; feb2dec_rors = hist_data(2:end,4) ./ hist_data(2:end,3) - 1; 
% Compute Probabilities 
p_up_jan = sum(jan_rors>0) / length(jan_rors); 
p_up_feb2dec = sum(feb2dec_rors>0) / length(feb2dec_rors); 
p_dn_jan = 1 - p_up_jan; p_dn_feb2dec = 1 - p_up_feb2dec; 
p_up_jan_and_up_feb2dec = sum((jan_rors>0) & (feb2dec_rors>0) ) / length(jan_rors); 
p_up_jan_and_dn_feb2dec = sum((jan_rors>0) & (feb2dec_rors<=0)) / length(jan_rors); 
p_dn_jan_and_dn_feb2dec = sum((jan_rors<=0) & (feb2dec_rors<=0)) / length(jan_rors); 
p_dn_jan_and_up_feb2dec = sum((jan_rors<=0) & (feb2dec_rors>0) ) / length(jan_rors); 
p_up_feb2dec_gvn_up_jan = p_up_jan_and_up_feb2dec / p_up_jan; p_dn_feb2dec_gvn_dn_jan = p_dn_jan_and_dn_feb2dec / p_dn_jan; 
p_feb2dec_same_as_jan = p_up_feb2dec_gvn_up_jan*p_up_jan + p_dn_feb2dec_gvn_dn_jan*p_dn_jan; 
fprintf(1,'As goes January, so goes the year?\n'); 
fprintf(1,'----------------------------------\n'); 
fprintf(1,'%d years in data set.\n', size(hist_data,1)-1); 
fprintf(1,'P(Up January) = %1.3f\n', p_up_jan); 
fprintf(1,'P(Up Feb-Dec) = %1.3f\n\n', p_up_feb2dec); 
fprintf(1,'P(Up Jan & Up Feb-Dec) = %1.3f\n', p_up_jan_and_up_feb2dec); 
fprintf(1,'P(Dn Jan & Dn Feb-Dec) = %1.3f\n', p_dn_jan_and_dn_feb2dec); 
fprintf(1,'P(Up Jan & Dn Feb-Dec) = %1.3f\n', p_up_jan_and_dn_feb2dec); 
fprintf(1,'P(Dn Jan & Up Feb-Dec) = %1.3f\n\n', p_dn_jan_and_up_feb2dec); 
fprintf(1,'P(Up Feb-Dec | Up Jan) = %1.3f\n', p_up_feb2dec_gvn_up_jan); 
fprintf(1,'P(Dn Feb-Dec | Dn Jan) = %1.3f\n\n', p_dn_feb2dec_gvn_dn_jan); 
fprintf(1,'P(As goes Jan, so goes Feb-Dec) = %1.3f\n\n', p_up_jan_and_up_feb2dec + p_dn_jan_and_dn_feb2dec) 
% Compute average ROR 
jan_rule_long_ror = []; jan_rule_long_short_ror = []; 
always_long_ror = []; 
for i=1:length(jan_rors) 
    always_long_ror = [always_long_ror; 1+feb2dec_rors(i)]; 
    if jan_rors(i)>0 jan_rule_long_ror = [jan_rule_long_ror; 1+feb2dec_rors(i)]; 
        jan_rule_long_short_ror = [jan_rule_long_short_ror; 1+feb2dec_rors(i)]; 
    else jan_rule_long_ror = [jan_rule_long_ror; 1]; 
        jan_rule_long_short_ror = [jan_rule_long_short_ror; 1/(1+feb2dec_rors(i))]; 
    end
end
fprintf(1,'Ave. Geo. ROR for Feb-Dec = %3.1f%%\n', (((prod(always_long_ror))^(1/length(always_long_ror)))-1)*100); 
fprintf(1,'Ave. Geo. ROR for Feb-Dec using Jan. Rule (long only) = %3.1f%%\n', (((prod(jan_rule_long_ror))^(1/length(jan_rule_long_ror)))-1)*100) 
fprintf(1,'Ave. Geo. ROR for Feb-Dec using Jan. Rule (long & short) = %3.1f%%\n', (((prod(jan_rule_long_short_ror))^(1/length(jan_rule_long_short_ror)))-1)*100)