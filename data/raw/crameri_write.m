l = load('CrameriColourMaps7.0.mat'); 
f = fieldnames(l); 

for ii = 1:length(f)
    writematrix(l.(f{ii}), "../data/processed/cmaps/"+f{ii}+".csv"); 
end



