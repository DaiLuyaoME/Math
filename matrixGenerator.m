% Matrix Generator
lowerBound=-100.0;
upperBound=100.0;
diagSize=[1,100];
diagMatNum=5;
diagMat=cell(1,diagMatNum);
for i=1:ceil(diagMatNum/2);
   diagMat{i}= diag(random('unif',1,upperBound,diagSize));
end
for i=(ceil(diagMatNum/2)+1):diagMatNum;
   diagMat{i}= diag(random('unif',lowerBound,upperBound,diagSize));
end

QMatNum=10;
QMat=cell(1,QMatNum);
QMatSize=[100,100];
for i=1:QMatNum
    temp=random('unif',lowerBound,upperBound,QMatSize);
    [Q,R]=qr(temp);
    QMat{i}=Q;
end;

symMatNum=diagMatNum*QMatNum;
symMat=cell(diagMatNum,QMatNum);
for i=1:diagMatNum
	for j=1:QMatNum
		symMat{i,j}=QMat{j}*diagMat{i}*transpose(QMat{j});
	end
end


    
