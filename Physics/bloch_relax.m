function [Mend] = bloch_relax(Mstart, T, M0, T1, T2)
% bloch_relax - compute the effect of relaxation on the net magnetization
%
% INPUTS
%	Mstart - initial magnetization
%	T - duration [ms]
%	M0 - equilibrium magnetization (default = 1)
%	T1 - longitudinal relaxation time [ms]
%	T2 - transverse relaxation time [ms]
% OUTPUTS
%   Mend - final magnetization

Arelax = [exp(-T/T2) 0 0; ...
          0 exp(-T/T2) 0; ...
          0 0 exp(-T/T1)];
brecover = [0; 0; M0*(1-exp(-T/T1))];
	
Mend = Arelax*Mstart + brecover;