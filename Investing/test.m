function [ A B C] = test( stock_vector )
%STOCKDATA Summary of this function goes here
%   Detailed explanation goes here

N=length(stock_vector);
indexl = 1;
hist_date = [];
    hist_high= []; 
    hist_low = [];
    hist_open = []; 
    hist_close  = [];
    hist_vol = [];
    
for i=1:2
    [S D H L O C V] = Get_Yahoo(stock_vector(i));
    sizev(i) = length(D);
    index(i,:) = [indexl sum(sizev)];
   
    
    stock_symbol(i) = S;
    hist_date = [hist_date; D];
    hist_high= [hist_high;H]; 
    hist_low = [hist_low; L];
    hist_open = [hist_open; O]; 
    hist_close  = [hist_close; C];
    hist_vol = [hist_vol; V];
    indexl = index(i,2)+1;
    
    
    temp = [datenum(hist_date(index(i,1):index(i,2))) hist_high(index(i,1):index(i,2)) hist_low(index(i,1):index(i,2)) hist_open(index(i,1):index(i,2)) hist_close(index(i,1):index(i,2)) hist_vol(index(i,1):index(i,2))];
    
    if(i ==1)
        A(:,:,i) = [datenum(hist_date(index(i,1):index(i,2))) hist_high(index(i,1):index(i,2)) hist_low(index(i,1):index(i,2)) hist_open(index(i,1):index(i,2)) hist_close(index(i,1):index(i,2)) hist_vol(index(i,1):index(i,2))];
    
    else
       B(:,:,1) = [datenum(hist_date(index(i,1):index(i,2))) hist_high(index(i,1):index(i,2)) hist_low(index(i,1):index(i,2)) hist_open(index(i,1):index(i,2)) hist_close(index(i,1):index(i,2)) hist_vol(index(i,1):index(i,2))];
    end
    
   
    
end