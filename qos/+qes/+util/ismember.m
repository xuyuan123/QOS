function b = ismember(A,B)
    % check if A is a member of cell B, numbers, strings or any objects with an eq methods
    % b = ismember(anObject, {'hello', 3, anotherObject, 'world'});
    
% Copyright 2016 Yulin Wu, USTC
% mail4ywu@gmail.com/mail4ywu@icloud.com

	assert(~iscell(A)&iscell(B))
    b = false;
    if ischar(A)
        for ii  = 1:numel(B)
            if ~ischar(B{ii})
                continue;
            elseif strcmp(B{ii},A)
                b = true;
                break;
            end
        end
    else
        for ii  = 1:numel(B)
            if B{ii} == A
                b = true;
                break;
            end
        end
    end
    
end