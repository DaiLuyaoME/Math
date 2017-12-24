function [m_n,P_n,mn_n1] = kalman_filter(m_n1,P_n1,y_n,F_n,Q_n,H_n,R_n)

mn_n1 = F_n * m_n1;
Pn_n1 = F_n * P_n1 * F_n' + Q_n;
Sn = H_n * Pn_n1 * H_n' + R_n;
Kn = linsolve(Sn,(Pn_n1*H_n'));
m_n = mn_n1 + Kn * (y_n - H_n * mn_n1);
P_n = Pn_n1 - Kn * H_n * Pn_n1;

end
