function plaintext=Dec_Hill(ciphertext,k)
    %Ciphertext= 'RRLMWBKASPDH'
    %k=[17 17 5;21 18 21;2 2 19]

lenk=size(k,2);
plaintext=reshape(double(char(ciphertext)),lenk,[]);
plaintext=transpose(plaintext);
[nr,ncol]=size(plaintext);
% convert ciphertext from vector to matrix



plaintext=plaintext-65;

%find the inverse of determinant

%int16 : Type
dk=int16(mod(det(k),26));

if gcd(dk,26) ~= 1
    disp('determinant has no inverse modulo 26')
else
    
[G,u,v]= gcd(dk,26);
inverse_dk= mod(u,26);
end

%find Minor and cofactor of key matrix (adjugate matrix)
key_t=k';
adjugate_key=int16((det(key_t)*inv(key_t))');

%key inverse=(Det(key))^-1 . Adj(Key) mode 26
key_inverse=(mod(inverse_dk*adjugate_key,26));

%Decryption p=c*k^-1 mod26
plaintext=lower(char((mod(plaintext*double(key_inverse),26)+65)));

h=1;
for j=1:nr
    for i=1:ncol
        pl(1,h)=plaintext(j,i);
        h=h+1;
    end  
end
plaintext=pl;
end