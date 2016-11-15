function [ans] = string_compare( string1 , string2 )

    str1 = str2double(string1); str2 = str2double(string2);
    
    if str1>str2
        ans = 1;
    elseif str1<str2
        ans = -1;
    elseif str1==str2
        ans = 0;
    else
        ans = 'Error';
    end
    
end