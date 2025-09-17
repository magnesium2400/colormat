l = load('colorbrewer.mat').('colorbrewer'); 

f1 = fieldnames(l);

for ii = 1:length(f1)

l2 = l.(f1{ii}); 
f2 = fieldnames(l2)

for jj = 1:length(f2)
    writematrix(l2.(f2{jj}){end}/255, "../data/processed/cmaps/"+lower(f2{jj})+".csv"); 
end


end
