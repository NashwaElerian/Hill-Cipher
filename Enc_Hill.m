function Ciphertext=Enc_Hill(Plaintext,k)
%Plaintext='paymoremoney';
%key=[17 17 5;21 18 21;2 2 19];
    % Get the length of key matrix
    lenk=size(k,2);
    
    %reshape( plaintext, D:rows, D:cols)
    Ciphertext=reshape(Plaintext,[],lenk)*0;
    [nr,ncol]=size(Ciphertext);
    %create variable to iterate on the plaintext:
    x=1;
    for j=1:nr
        for i=1:ncol
              Ciphertext(j,i)=Plaintext(x);
              x=x+1;
        end  
    end
    % return to the range of numbers from 0 to 25 
      Ciphertext=Ciphertext-97;
      Ciphertext=upper(char(mod(Ciphertext*k,26)+97));
     %create variable to iterate on the columns of matrix m
    h=1;
    for j=1:nr
        for i=1:ncol
            m(1,h)=Ciphertext(j,i);
            h=h+1;
        end  
    end
    Ciphertext=m;
end