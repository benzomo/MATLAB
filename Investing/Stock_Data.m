function [ stock_sym hist_d hist_h hist_l hist_o hist_c hist_v ] = Stock_Data( stock_vector )
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

for i=1:N
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
        
        vectorA = A(:,1,i-1);
        set1 = temp(:,1);
        tempA = ismember(vectorA, set1);
        temp2 = temp(ismember(temp(:,1),A(:,1,i-1)),:);
        
        A = A(tempA,:,:);
        
        A(:,:,i)= temp2;
        
    end
    
    
end

stock_sym = stock_symbol;


hist_d(:,:) = datestr(A(:,1,1));
hist_h(:,:) = A(:,2,:);
hist_l(:,:) = A(:,3,:);
hist_o(:,:) = A(:,4,:);
hist_c(:,:) = A(:,5,:);
hist_v(:,:) = A(:,6,:);
