function [B] = B_dipole(x, pos_rec)
	mu_0 = 1.25663706e-6; % m * kg * s^-2 * A^-2
	noOf_rec = size(pos_rec, 1);
	pos_rec = transpose(pos_rec);
	theta = x(4);
	phi = x(5);
	psi = 0;
	m_norm_signed = x(6);
	rot =eye(3) ;%rotMtrx([theta, phi, psi]);
	m = repmat( (rot * [0; 0; m_norm_signed]), [1, noOf_rec] );
	R = rot * ( pos_rec - [x(1); x(2); x(3)] );
	nR = vecnorm(R,2,1);

	B = mu_0/(4*pi) .* ( (3.*dot(m, R, 1).*R ./ (nR.^5)) - (m ./ (nR.^3)) );
	B = B';
end
