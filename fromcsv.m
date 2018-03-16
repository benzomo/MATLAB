function[data] = fromcsv()
%STATA CODE TO EXPORT:
%. export delimited using statatest

data = readtable('D:\benmo\OneDrive\2016& 2017Classes\FInancial Econ\data\fedReserve.csv') ;

end