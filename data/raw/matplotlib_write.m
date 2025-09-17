d = dir('matplotlib/*.m'); 

for ii = 1:length(d)
    
    [~,n] = fileparts(d(ii).name); 
    m = eval(n); 

    writematrix(m, "../data/processed/cmaps/"+n+".csv");

end
