close all;
%%
optimalValue = objValueList(end);
plotData(log10(objValueList-optimalValue),'$k$','$\log \left( f\left( {{x}_{k}} \right)-{{p}^{*}} \right)$')
