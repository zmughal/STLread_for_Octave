function [vertices, faces] = stlread(filename)
% This function reads an STL file in binary format into matrixes vertices
% and faces which can be used by patch to view the stl.
%
% MATLAB code by Doron Harlev
% Octave edits by John Moosemiller
if nargout>2
    error('Too many output arguments')
end

fid=fopen(filename, 'r'); %Open the file, assumes STL Binary format.
if fid == -1 
    error('File could not be opened, check name or path.')
end

ftitle=fread(fid,80,'uchar=>schar'); % Read file title
num_facet=fread(fid,1,'int32'); % Read number of Facets

fprintf('\nTitle: %s\n', char(ftitle'));
fprintf('Num Facets: %d\n', num_facet);

% Preallocate memory to save running time
vertices = zeros(3*num_facet,3);
faces = zeros(num_facet,3);

for i=1:num_facet
    norm=fread(fid,3,'float32'); % normal coordinates, ignored for now
    ver1=fread(fid,3,'float32'); % vertex 1
    ver2=fread(fid,3,'float32'); % vertex 2
    ver3=fread(fid,3,'float32'); % vertex 3
    col=fread(fid,1,'uint16'); % color bytes

    vertices((3*i-2) , :) = [ver1(1),ver1(2),ver1(3)];
    vertices(3*i-1 , :) = [ver2(1),ver2(2),ver2(3)];
    vertices(3*i , :) = [ver3(1),ver3(2),ver3(3)];
    
    faces(i, :) = [3*i-2,3*i-1,3*i];

end

fclose(fid);

% For more information http://rpdrc.ic.polyu.edu.hk/old_files/stl_binary_format.htm
