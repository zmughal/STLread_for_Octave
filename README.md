stlread() for Octave
==================

## Description

`stlread()` is a function for octave that takes in a binary (NOT ASCII) .stl'a and outputs the vertices and a list of each face's vertices.

`stlread` outputs 2 matrices that can be immediately ploted using `patch()`

## Usage

Retrieving the vertices and faces is easy

```matlab
%assuming you have a file "sample.stl"
[vertices, faces] = stlread('sample.stl');
```

In order to plot these you might follow with

```matlab
patch( 'Faces', faces, 'Vertices', verticies );
```

## Limitations

3 year old hardware (like my linux box) isn't 
well designed for viewing patches. If you have 
the option stls with under 1000-1500 faces are 
prefered in the interest of time.

## Future

stlview() function should arrive soon. Will 
have options for display characteristics. 




