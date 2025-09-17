clear; seaborn_data; 
a = whos; 

for ii = 1:length(a)
    writematrix(eval(a(ii).name), "../data/processed/cmaps/"+a(ii).name+".csv");
end


