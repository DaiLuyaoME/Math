matrixGenerator;
%%
cg=1;
lanczos=2;
minres=3;
res=zeros(3,ANum);
% rescg=zeros(1,ANum);
% reslan=zeros(1,ANum);
% minres=zeros(1,ANum);
for i=1:diagMatNum
    for j=1:QMatNum
        for k=1:3
        [x,relres,resvec]=solution(A{i,j},b{i,j},k,1e-6,60);
        res(k,(i-1)*QMatNum+j)=relres;
        end
    end
end

        
        