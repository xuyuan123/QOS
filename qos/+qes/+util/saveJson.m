function saveJson(fullfilename,fields,value)
% fields = {'ad_boards{1}','numChnls'};
% Copyright 2016 Yulin Wu, USTC
% mail4ywu@gmail.com/mail4ywu@icloud.com

% {
%     "class": "sync.ustc_da_v1",
%     "chnlMap": [1 ,2 ,3 ,4 ,				// rack 1, for jpa iq and readout in iq
% 											// rack 2, taken as dc channels
%                       15,16,17,18,19,20,	// rack 3, qubit zpa, first two channels: dc
%                 21,22,23,24,25,26,27,28,  	// rack 4, qubit mw iq
%                 29,30,31,32,33,34,35,36,	// rack 5, qubit mw iq
% 				37,38,39,40 			]  	// rack 6, qubit zpa, right board: power not connected
% }
%     error('save fields in json files is not implemented yet.');   
%     error('save history is not implemented yet.');
if ischar(value)
    value=['s"' value '"'];
elseif isnumeric(value)
	if numel(value)==1
        value=['n' num2str(value)];
    else
        str='a[';
        for i=1:numel(value)
            str=[str num2str(value(i)) ','];
        end
        value=[str(1:end-1) ']']; 
    end
end

mod = py.importlib.import_module('+qes.+util.saveJson'); 
py.importlib.reload(mod);    
result=cell(mod.func1(fullfilename,fields,value));

if result{1}== 1
    error('type error');
end
if result{1}== 2
    error('not a last layer');
end
end